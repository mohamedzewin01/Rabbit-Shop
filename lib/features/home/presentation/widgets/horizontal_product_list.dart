import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/presentation/widgets/vegetable_card.dart';

import '../../../../models/dto/product.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        print("listView rebuild again");
        return FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  VegetableCardWidget(
                    product: Product(
                      id: ' 1',
                      productname: "Tomato",
                      quantity: '1',
                      price: '20',
                      imagefrontsmallurl:
                          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
                      imagefronturl:
                          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
