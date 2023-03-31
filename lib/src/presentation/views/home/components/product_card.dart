import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/description_of_paints/description_of_paints.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final bool deliveryFree;
  final String coverImage;
  final Function()? onTap;

  const ProductCard(
      {Key? key,
      required this.name,
      required this.price,
      required this.deliveryFree,
      required this.coverImage,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceFormatted = NumberFormat.currency(locale: 'pt_BR', symbol: "")
        .format(double.parse(price));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 91,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: CustomColors.gray100),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 12.25, left: 19.5, right: 15, top: 16),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                coverImage,
                fit: BoxFit.cover,
                height: 51,
                width: 51,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 5, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'R\$',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                priceFormatted,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          if (deliveryFree)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: CustomColors.purple)),
                              child: Text(
                                'Entrega grátis',
                                style: TextStyle(
                                    color: CustomColors.gray150, fontSize: 12),
                              ),
                            ),
                        ],
                      ),
                    ],
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
