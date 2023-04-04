import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paint_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_profile_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_post_cart_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_search_paint_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/profile_response.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/cart/cart.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/description_of_paints/description_of_paints.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/components/store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/how_to_paint/how_to_paint.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/profile/profile.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

final _screensIndex = {0: "store", 1: "cart", 2: "profile"};

final _svgIcons = [
  {"img": 'shop.svg', "label": 'Loja'},
  {"img": 'cart.svg', "label": 'Carrinho'},
  {"img": 'person.svg', "label": 'Perfil'},
];

class Home extends StatefulWidget {
  static const routeName = "home";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _currentPage = "store";

  bool _showBottomNavigationBar = true;
  bool _isLoading = true;
  int _currentProductIndex = 0;
  int _pageIndex = 0;
  List<CartModel> _products = [];
  List<CartModel> _userCart = [];
  List<CartModel> _filteredProducts = [];
  bool _onlyFreeDeliveries = false;
  ProfileResponse? _profileUser;
  final _searchValueController = TextEditingController();

  void setCurrentPage(String page) {
    setState(() {
      _currentPage = page;
      if (page == "HowToPaint") {
        _showBottomNavigationBar = false;
      } else {
        _showBottomNavigationBar = true;
      }
    });
  }

  void setCurrentProductIndex(int index) {
    setState(() {
      _currentProductIndex = index;
    });
  }

  void handleSearch(String value, bool onlyFreeDeliveries) async {
    setState(() {
      _onlyFreeDeliveries = onlyFreeDeliveries;
      _isLoading = true;
    });
    if (value == "" && !onlyFreeDeliveries) {
      setState(() {
        _filteredProducts = _products;
        _isLoading = false;
      });
    } else {
      var response = await GetIt.I.get<ISearchPaintUseCase>()(search: value);
      setState(() {
        _filteredProducts = response.where((item) {
          if (onlyFreeDeliveries) {
            return item.deliveryFree == true;
          }
          return true;
        }).toList();
        _isLoading = false;
      });
    }
  }

  void addProductsToCart(CartModel product) async {
    setState(() {
      _userCart.add(product);
    });
    await GetIt.I.get<IPostCartUseCase>()(data: product);
  }

  void cleanTheCart() {
    setState(() {
      _userCart = [];
    });
  }

  void getPaints() async {
    var response = await GetIt.I.get<IGetPaintUseCase>()();

    setState(() {
      _products = response.toList();
      _filteredProducts = response.toList();
      _isLoading = false;
    });
  }

  void getProfileUser() async {
    var response = await GetIt.I.get<IGetProfileUseCase>()();

    setState(() {
      _profileUser = response;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getPaints();
    getProfileUser();
    super.initState();
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() {
    return _svgIcons
        .asMap()
        .map((index, icon) {
          return MapEntry(
            index,
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                getAssetVectorUrl(icon["img"] ?? ""),
                width: 27,
                height: 27,
                color: _pageIndex == index ? CustomColors.purple : Colors.grey,
              ),
              label: icon["label"] ?? "",
            ),
          );
        })
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final _screens = {
      "store": Store(
          setCurrentPage: setCurrentPage,
          products: _filteredProducts,
          setCurrentProductIndex: setCurrentProductIndex,
          handleSearch: handleSearch,
          onlyFreeDeliveries: _onlyFreeDeliveries,
          searchValueController: _searchValueController,
          isLoading: _isLoading),
      "cart": Cart(
          setCurrentPage: setCurrentPage,
          userCart: _userCart,
          cleanTheCart: cleanTheCart),
      "profile":
          Profile(setCurrentPage: setCurrentPage, profileUser: _profileUser),
      "DescriptionOfPaints": DescriptionOfPaints(
          setCurrentPage: setCurrentPage,
          products: _filteredProducts,
          currentIndex: _currentProductIndex,
          addProductsToCart: addProductsToCart),
      "HowToPaint": HowToPaint(setCurrentPage: setCurrentPage)
    };

    return Scaffold(
      body: _screens[_currentPage],
      bottomNavigationBar: _showBottomNavigationBar == true
          ? Container(
              alignment: Alignment.center,
              height: 85,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, -3),
                        blurRadius: 7)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              child: BottomNavigationBar(
                currentIndex: _pageIndex,
                elevation: 0,
                backgroundColor: Colors.transparent,
                items: _bottomNavigationBarItems(),
                selectedFontSize: 14,
                unselectedFontSize: 14,
                selectedLabelStyle:
                    const TextStyle(height: 2.2, fontWeight: FontWeight.bold),
                selectedItemColor: CustomColors.purple,
                unselectedItemColor: Colors.grey,
                onTap: (int index) {
                  setState(() {
                    _pageIndex = index;
                    _currentPage = _screensIndex[index]!;
                  });
                },
              ))
          : const SizedBox.shrink(),
    );
  }
}
