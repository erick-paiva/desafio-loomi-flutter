import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/cart/cart.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/description_of_paints/description_of_paints.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/components/store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/profile/profile.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

final _screensIndex = {0: "store", 1: "cart", 2: "profile"};

class Home extends StatefulWidget {
  static const routeName = "home";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pageIndex = 0;
  String _currentPage = "store";

  final _svgIcons = [
    {"img": 'shop.svg', "label": 'Loja'},
    {"img": 'cart.svg', "label": 'Carrinho'},
    {"img": 'person.svg', "label": 'Perfil'},
  ];

  void setCurrentPage(String page) {
    setState(() {
      _currentPage = page;
    });
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
      ),
      "cart": Cart(setCurrentPage: setCurrentPage),
      "profile": Profile(setCurrentPage: setCurrentPage),
      "DescriptionOfPaints": DescriptionOfPaints(
        setCurrentPage: setCurrentPage,
      )
    };

    return Scaffold(
      body: _screens[_currentPage],
      bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 85,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, -3), blurRadius: 7)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.white),
          child: BottomNavigationBar(
            currentIndex: _pageIndex,
            elevation: 0,
            backgroundColor: Colors.transparent,
            items: _bottomNavigationBarItems(),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedLabelStyle:
                TextStyle(height: 2.2, fontWeight: FontWeight.bold),
            selectedItemColor: CustomColors.purple,
            unselectedItemColor: Colors.grey,
            onTap: (int index) {
              setState(() {
                _pageIndex = index;
                _currentPage = _screensIndex[index]!;
              });
            },
          )),
    );
  }
}
