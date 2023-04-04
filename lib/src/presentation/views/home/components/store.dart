import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/components/custom_switch.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paint_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/components/input_search.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/components/product_card.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/search_bar_component.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class Store extends StatefulWidget {
  final void Function(String page) setCurrentPage;
  final void Function(String value, bool onlyFreeDeliveries) handleSearch;
  final void Function(int index) setCurrentProductIndex;
  final List<CartModel> products;
  final bool onlyFreeDeliveries;
  final TextEditingController searchValueController;

  const Store({
    Key? key,
    required this.setCurrentPage,
    required this.products,
    required this.setCurrentProductIndex,
    required this.handleSearch,
    required this.onlyFreeDeliveries,
    required this.searchValueController,
  }) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'Opções de tintas',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.black10),
                ),
              ),
              InputSearch(
                  hintText: "Buscar...",
                  controller: widget.searchValueController,
                  onChanged: (value) {
                    widget.handleSearch(value, widget.onlyFreeDeliveries);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomSwitch(
                          onChanged: (value) {
                            widget.handleSearch(
                                widget.searchValueController.text, value);
                          },
                          value: widget.onlyFreeDeliveries),
                      RichText(
                        text: TextSpan(
                          text: 'Apenas ',
                          style: TextStyle(
                            fontSize: 16,
                            color: CustomColors.gray80,
                          ),
                          children: [
                            TextSpan(
                              text: 'entrega grátis',
                              style: TextStyle(
                                fontSize: 16,
                                color: CustomColors.gray80,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "${widget.products.length} resultados",
                    style: TextStyle(
                      color: CustomColors.gray80.withOpacity(0.4),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              final product = widget.products[index];
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ProductCard(
                      name: product.name,
                      price: product.price,
                      deliveryFree: product.deliveryFree,
                      coverImage: product.coverImage,
                      onTap: () {
                        widget.setCurrentProductIndex(index);
                        widget.setCurrentPage("DescriptionOfPaints");
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
