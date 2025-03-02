import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/dto/product.dart';

class VegetableCardWidget extends StatelessWidget {
  final Product product;

  const VegetableCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffF1F1F5)),
            borderRadius: BorderRadius.circular(8)),
        width: (MediaQuery.of(context).size.width / 2) - 34,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Hero(
                  tag: product.id!,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png' ??
                            "",
                    width: 120,
                    height: 120,
                    filterQuality: FilterQuality.none,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.price ?? "10da",
                    style: TextStyle(
                      color: Color(0xffFF324B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.regularPrice ?? "20da",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Get.theme.colorScheme.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      product.discount ?? "20%",
                      style: TextStyle(
                          color: Color.fromARGB(255, 27, 133, 185),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.productname ?? "????",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 48,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
            ),
          ),
          Positioned(
            top: 0, // to shift little up
            left: 0,
            child: Container(
                width: 40,
                height: 40,
                //color: Colors.amber.shade100,
                decoration: BoxDecoration(
                    color: Color(0xffE9F5FA),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(8))),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(product.discount ?? "20%",
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Get.theme.primaryColor)),
                    Text("OFF",
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Get.theme.primaryColor))
                  ],
                )),
          )
        ]),
      ),
    );
  }
}
