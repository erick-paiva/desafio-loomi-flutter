import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/cart/components/product_card.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class Cart extends StatefulWidget {
  static const routeName = "cart";

  final List<CartModel> userCart;
  final void Function(String page) setCurrentPage;
  final void Function() cleanTheCart;

  const Cart(
      {Key? key,
      required this.setCurrentPage,
      required this.userCart,
      required this.cleanTheCart})
      : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
                margin: const EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: widget.userCart.length,
                  itemBuilder: (context, index) {
                    final product = widget.userCart[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ProductCard(
                            name: product.name,
                            price: product.price,
                            deliveryFree: product.deliveryFree,
                            coverImage: product.coverImage,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 28),
              child: ElevatedButton(
                onPressed: () {
                  widget.cleanTheCart();
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
