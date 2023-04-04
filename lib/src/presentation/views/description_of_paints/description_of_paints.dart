import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

class DescriptionOfPaints extends StatefulWidget {
  static const routeName = "descriptionOfPaints";

  final int currentIndex;
  final void Function(String page) setCurrentPage;
  final void Function(CartModel product) addProductsToCart;
  final List<CartModel> products;

  const DescriptionOfPaints(
      {Key? key,
      required this.setCurrentPage,
      required this.products,
      required this.currentIndex,
      required this.addProductsToCart})
      : super(key: key);

  @override
  _DescriptionOfPaintsState createState() => _DescriptionOfPaintsState();
}

class _DescriptionOfPaintsState extends State<DescriptionOfPaints> {
  final controller = CarouselController();

  nextPage() {
    controller.nextPage();
  }

  previousPage() {
    controller.previousPage();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = widget.currentIndex;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            widget.setCurrentPage("store");
          },
        ),
        title: Text(
          'Opções de tintas',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: CustomColors.black10,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    carouselController: controller,
                    items: widget.products.map((product) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    fontSize: 26,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.black10,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: Image.network(
                                    product.coverImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 300.0,
                      initialPage: _currentIndex,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 110,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: previousPage,
                            child: Icon(Icons.arrow_back,
                                color: CustomColors.gray90, size: 40),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: nextPage,
                            child: Icon(Icons.arrow_forward,
                                color: CustomColors.gray90, size: 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.setCurrentPage("HowToPaint");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.gray70,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topLeft: Radius.circular(50),
                            bottomRight: Radius.circular(4),
                            topRight: Radius.circular(4)),
                      ),
                      minimumSize: const Size(160, 44),
                    ),
                    child: const Text(
                      "Como pintar",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.gray70,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            topLeft: Radius.circular(4),
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      minimumSize: const Size(150, 44),
                    ),
                    child: const Text(
                      "Tirar dúvidas",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 198,
                margin: const EdgeInsets.only(
                    left: 45, right: 45, top: 18, bottom: 26),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: CustomColors.gray100),
                    color: CustomColors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Diferenciais",
                          style: TextStyle(
                              fontSize: 14,
                              color: CustomColors.black10,
                              fontWeight: FontWeight.bold)),
                      Container(
                        margin: const EdgeInsets.only(top: 23),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              getAssetVectorUrl(
                                "brush.svg",
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Fácil de aplicar",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CustomColors.black10,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 23),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              getAssetVectorUrl(
                                "smelless.svg",
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("Não deixa cheiro",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CustomColors.black10,
                                ))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            getAssetVectorUrl(
                              "paint_bucket.svg",
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text("É só abrir, mexer e pintar",
                              style: TextStyle(
                                fontSize: 14,
                                color: CustomColors.black10,
                              ))
                        ],
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: ElevatedButton(
                  onPressed: () {
                    widget.addProductsToCart(
                        widget.products[widget.currentIndex]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.purple,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    minimumSize: const Size(326, 59),
                  ),
                  child: const Text(
                    "Adicionar ao carrinho",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
