import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/components/custom_switch.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/components/input_search.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/components/product_card.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/search_bar_component.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

final List<Map<String, dynamic>> products = [
  {
    "name": "Refined Frozen Bacon",
    "price": "273.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support",
    "id": "1"
  },
  {
    "name": "Practical Wooden Pizza",
    "price": "775.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
    "id": "2"
  },
  {
    "name": "Ergonomic Steel Cheese",
    "price": "869.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
    "id": "3"
  },
  {
    "name": "Ergonomic Bronze Bacon",
    "price": "483.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
    "id": "4"
  },
  {
    "name": "Luxurious Cotton Pizza",
    "price": "241.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
    "id": "5"
  },
  {
    "name": "Oriental Concrete Shoes",
    "price": "884.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Boston's most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
    "id": "6"
  },
  {
    "name": "Intelligent Steel Tuna",
    "price": "316.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
    "id": "7"
  },
  {
    "name": "Refined Granite Chicken",
    "price": "202.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The Football Is Good For Training And Recreational Purposes",
    "id": "8"
  },
  {
    "name": "Recycled Fresh Ball",
    "price": "709.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
    "id": "9"
  },
  {
    "name": "Licensed Granite Shoes",
    "price": "102.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
    "id": "10"
  },
  {
    "name": "Rustic Rubber Shoes",
    "price": "503.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
    "id": "11"
  },
  {
    "name": "Refined Cotton Towels",
    "price": "36.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients",
    "id": "12"
  },
  {
    "name": "Luxurious Metal Fish",
    "price": "335.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
    "id": "13"
  },
  {
    "name": "Electronic Wooden Cheese",
    "price": "123.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit",
    "id": "14"
  },
  {
    "name": "Bespoke Soft Car",
    "price": "343.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit",
    "id": "15"
  },
  {
    "name": "Ergonomic Metal Gloves",
    "price": "179.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit",
    "id": "16"
  },
  {
    "name": "Practical Frozen Car",
    "price": "462.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
    "id": "17"
  },
  {
    "name": "Unbranded Steel Chips",
    "price": "814.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
    "id": "18"
  },
  {
    "name": "Incredible Steel Chips",
    "price": "720.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart",
    "id": "19"
  },
  {
    "name": "Oriental Frozen Chair",
    "price": "244.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The Football Is Good For Training And Recreational Purposes",
    "id": "20"
  },
  {
    "name": "Intelligent Rubber Hat",
    "price": "76.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The Football Is Good For Training And Recreational Purposes",
    "id": "21"
  },
  {
    "name": "Sleek Frozen Table",
    "price": "905.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support",
    "id": "22"
  },
  {
    "name": "Oriental Steel Shoes",
    "price": "832.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016",
    "id": "23"
  },
  {
    "name": "Electronic Steel Pizza",
    "price": "661.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients",
    "id": "24"
  },
  {
    "name": "Unbranded Bronze Ball",
    "price": "959.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
    "id": "25"
  },
  {
    "name": "Intelligent Cotton Car",
    "price": "220.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support",
    "id": "26"
  },
  {
    "name": "Practical Metal Table",
    "price": "919.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support",
    "id": "27"
  },
  {
    "name": "Modern Steel Computer",
    "price": "357.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
    "id": "28"
  },
  {
    "name": "Generic Frozen Fish",
    "price": "70.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
    "id": "29"
  },
  {
    "name": "Electronic Wooden Pants",
    "price": "122.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart",
    "id": "30"
  },
  {
    "name": "Bespoke Plastic Pants",
    "price": "660.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "The Football Is Good For Training And Recreational Purposes",
    "id": "31"
  },
  {
    "name": "Licensed Rubber Cheese",
    "price": "443.00",
    "deliveryFree": true,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart",
    "id": "32"
  },
  {
    "name": "Oriental Plastic Sausages",
    "price": "792.00",
    "deliveryFree": false,
    "coverImage": "http://loremflickr.com/640/480/abstract",
    "description":
        "New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart",
    "id": "33"
  },
];

class Store extends StatelessWidget {
  final void Function(String page) setCurrentPage;

  const Store({Key? key, required this.setCurrentPage}) : super(key: key);

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
              InputSearch(hintText: "Buscar..."),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomSwitch(),
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
                    "100 resultados",
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
                      onTap: () {
                        setCurrentPage("DescriptionOfPaints");
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
