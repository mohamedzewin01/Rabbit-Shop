import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grocery_app/core/resources/color_manager.dart';

import '../../../../generated/assets.dart';
import '../../../../models/dto/product.dart';
import '../../../../views/common_widgets/appBar.dart';

class VegetableDetailScreen extends StatelessWidget {
  const VegetableDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(product.productname ?? ''),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: InkWell(
              customBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(Assets.imagesBack)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              ColorManager.white,
                              ColorManager.white2,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        // color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                width: 4, color: ColorManager.primaryColor),
                            left: BorderSide(
                                width: .5, color: ColorManager.primaryColor),
                            right: BorderSide(
                                width: .5, color: ColorManager.primaryColor)),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 140.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Hero(
                        tag: product.id!,
                        child: CachedNetworkImage(
                          imageUrl: product.imagefronturl ?? "",
                          width: 140,
                          height: 180,
                          filterQuality: FilterQuality.low,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${product.price ?? 0.00} SAR",
                          style: TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          product.productname ?? "????",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Quantity : ${product.quantity}",
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "tags: ${product.categories}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => CachedNetworkImage(
                imageUrl: product.imagefronturl ?? "",
                width: 140,
                height: 180,
                filterQuality: FilterQuality.low,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: ColorManager.primaryColor.withAlpha(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("Total price (with tax)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 4,
                          ),
                          Text("${product.price ?? 10.00}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
