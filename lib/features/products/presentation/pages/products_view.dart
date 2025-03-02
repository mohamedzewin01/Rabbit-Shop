import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/presentation/widgets/product_card.dart';

import '../../../../models/dto/product.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRect(
        child: GridView.builder(
          itemCount: 20,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 200,
          ),
          itemBuilder: (context, index) => ProductCardWidget(
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
        ),
      ),
    );
  }
}
