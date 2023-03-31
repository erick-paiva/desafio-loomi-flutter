import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/cart/components/product_card.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/components/store.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

class Cart extends StatefulWidget {
  static const routeName = "cart";

  final void Function(String page) setCurrentPage;

  const Cart({Key? key, required this.setCurrentPage}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _currentIndex = 0;
  final controller = CarouselController();

  nextPage() {
    controller.nextPage();
  }

  previousPage() {
    controller.previousPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Carrinho',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: CustomColors.black10,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ProductCard(
                            name: product['name'],
                            price: product['price'],
                            deliveryFree: product['deliveryFree'],
                            coverImage: product['coverImage'],
                            onTap: () {},
                          ),
                        ),
                        SizedBox(height: 12),
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 28),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: CustomColors.purple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  minimumSize: Size(326, 59),
                ),
                child: Text(
                  "Confirmar compra",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
