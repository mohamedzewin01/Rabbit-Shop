import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/categories_view.dart';
import '../../../../generated/assets.dart';

class GridCategories extends StatelessWidget {
  const GridCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      // color: ColorManager.primaryColor,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 85),
        itemBuilder: (context, index) => categories[index],
      ),
    );
  }
}

List<Widget> categories = [
  CategoriesView(imagePath: Assets.imagesFish, catName: "Seafood"),
  CategoriesView(imagePath: Assets.imagesFalafel, catName: "Vegetables"),
  CategoriesView(imagePath: Assets.imagesBanana, catName: "Fruits"),
  CategoriesView(imagePath: Assets.imagesIceCream, catName: "Snacks"),
  CategoriesView(imagePath: Assets.imagesDish, catName: "Canned food"),
  CategoriesView(imagePath: Assets.imagesRice, catName: "Pasta, Rice"),
  CategoriesView(imagePath: Assets.imagesSavon, catName: "Home Supplie"),
  CategoriesView(imagePath: Assets.imagesMakeup, catName: "Woman care"),
  CategoriesView(imagePath: Assets.imagesMakeup, catName: "Woman care"),
  CategoriesView(imagePath: Assets.imagesIceCream, catName: "Snacks"),
  CategoriesView(imagePath: Assets.imagesDish, catName: "Canned food"),
  CategoriesView(imagePath: Assets.imagesMakeup, catName: "Woman care"),
];
