import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/core/resources/color_manager.dart';
import 'package:grocery_app/features/products/presentation/pages/products_view.dart';

import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../models/dto/product.dart';
import '../../../../utils/dimensions.dart';
import '../widgets/app_bar_categories.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    /// first items /// from chatgpt
    List<Tab> tabs = categoryItems.map(
      (tab) {
        return Tab(
          text: tab.title,
        );
      },
    ).toList();
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: AppBarCategories()),
              SliverFillRemaining(
                hasScrollBody: true,
                child: DefaultTabController(
                  length: tabs.length,
                  child: Column(
                    children: [
                      TabBar(
                        tabAlignment: TabAlignment.start,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: AppSize.s16),
                        unselectedLabelColor: ColorManager.placeHolderColor2,
                        unselectedLabelStyle: getSemiBoldStyle(
                          color: ColorManager.offwhite,
                          fontSize: AppSize.s16,
                        ),
                        labelStyle: getSemiBoldStyle(
                          color: ColorManager.primaryColor,
                          fontSize: AppSize.s18,
                        ),
                        isScrollable: true,
                        indicator: const UnderlineTabIndicator(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.s6),
                            topRight: Radius.circular(AppSize.s6),
                          ),
                          borderSide: BorderSide(
                            color: ColorManager.primaryColor,
                            width: 4,
                          ),
                        ),
                        indicatorColor: ColorManager.primaryColor,
                        indicatorWeight: 1,
                        splashBorderRadius: BorderRadius.circular(AppSize.s20),
                        physics: const BouncingScrollPhysics(),
                        tabs: tabs,
                        onTap: (value) {
                          // indexTab = value;
                        },
                      ),
                      const SizedBox(height: AppSize.s14),
                      Expanded(
                        child: TabBarView(
                          children: tabs.map((e) {
                            int currentIndex = tabs.indexOf(e);
                            return ProductsView();
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      // body: ListView.builder(
      //   itemCount:productList.length,
      //   itemBuilder: (context, index) {
      //     final Product product = productList[index];
      //     return ExpansionTile(
      //         shape: Border.all(color: Colors.red),
      //         title: Text(
      //           product.productname.toString(),
      //           style: TextStyle(fontSize: 14),
      //         ),
      //         children: [
      //           ListTile(
      //             onTap: () => {
      //               // Get.toNamed("/details",
      //               //     arguments: product)
      //             },
      //             leading: Container(
      //               height: 60,
      //               width: 60,
      //               decoration: BoxDecoration(
      //                   shape: BoxShape.circle,
      //                   color: Color(0xffE9F5FA)),
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   borderRadius:
      //                   BorderRadius.circular(50),
      //                 ),
      //                 child: CachedNetworkImage(
      //                   imageUrl: product.imagefrontsmallurl!,
      //                   width: 40,
      //                   height: 40,
      //                   filterQuality: FilterQuality.none,
      //                   //fit: BoxFit.cover,
      //                   errorWidget: (context, url, error) =>
      //                       Icon(Icons.error),
      //                 ),
      //               ),
      //             ),
      //             /*trailing:
      //                                   const Icon(Icons.keyboard_arrow_right),*/
      //           ),
      //         ]);
      //     //return ProductItem(product: product);
      //   },
      // )

      // Obx(
      //   () {
      //     if (_productViewModel.currentState is LoadedState) {
      //       return Row(
      //         children: [
      //           Container(
      //             width: 100,
      //             margin: const EdgeInsets.only(left: 16),
      //             height: double.infinity,
      //             decoration: BoxDecoration(
      //               color: Get.theme.cardColor,
      //             ),
      //             child: ListView.builder(
      //               physics: const BouncingScrollPhysics(),
      //               itemCount: CategorieViewModel.categoriesMockup.length,
      //               padding: const EdgeInsets.all(0),
      //               itemBuilder: (context, index) {
      //                 Categorie category =
      //                     CategorieViewModel.categoriesMockup[index];
      //                 return InkWell(
      //                   onTap: () {
      //                     selectedCategoryIndex = index;
      //                     _productViewModel.getAllProductList(1);
      //                   },
      //                   child: CategoryItem(
      //                     title: category.name,
      //                     icon: category.imagefrontsmallurl,
      //                     isSelected: selectedCategoryIndex == index,
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //           // Product List
      //           // Product List
      //           Expanded(
      //             child: GetBuilder<ProductViewModel>(
      //               builder: (productViewModel) {
      //                 if (productViewModel.currentState is LoadingState) {
      //                   return const CircularProgressIndicator();
      //                 } else if (productViewModel.currentState is LoadedState) {
      //                   final productList =
      //                       (productViewModel.currentState as LoadedState).data;
      //                   return ListView.builder(
      //                     itemCount: productList.length,
      //                     itemBuilder: (context, index) {
      //                       final Product product = productList[index];
      //                       return ExpansionTile(
      //                           shape: Border.all(color: Colors.transparent),
      //                           title: Text(
      //                             product.productname.toString(),
      //                             style: TextStyle(fontSize: 14),
      //                           ),
      //                           children: [
      //                             ListTile(
      //                               onTap: () => {
      //                                 Get.toNamed("/details",
      //                                     arguments: product)
      //                               },
      //                               leading: Container(
      //                                 height: 60,
      //                                 width: 60,
      //                                 decoration: BoxDecoration(
      //                                     shape: BoxShape.circle,
      //                                     color: Color(0xffE9F5FA)),
      //                                 child: Container(
      //                                   decoration: BoxDecoration(
      //                                     borderRadius:
      //                                         BorderRadius.circular(50),
      //                                   ),
      //                                   child: CachedNetworkImage(
      //                                     imageUrl: product.imagefrontsmallurl!,
      //                                     width: 40,
      //                                     height: 40,
      //                                     filterQuality: FilterQuality.none,
      //                                     //fit: BoxFit.cover,
      //                                     errorWidget: (context, url, error) =>
      //                                         Icon(Icons.error),
      //                                   ),
      //                                 ),
      //                               ),
      //                               /*trailing:
      //                                   const Icon(Icons.keyboard_arrow_right),*/
      //                             ),
      //                           ]);
      //                       //return ProductItem(product: product);
      //                     },
      //                   );
      //                 } else if (productViewModel.currentState
      //                     is FailureState) {
      //                   final message =
      //                       (productViewModel.currentState as FailureState)
      //                           .error;
      //                   return Center(
      //                     child: Text('Error: $message'),
      //                   );
      //                 } else {
      //                   return const CircularProgressIndicator();
      //                 }
      //               },
      //             ),
      //           ),
      //         ],
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }
}



class CategoryItem extends StatelessWidget {
  final String? title;
  final String? icon;
  final bool isSelected;

  const CategoryItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      /*margin: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeExtraSmall, horizontal: 2),*/
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: isSelected
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).cardColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Get.theme.cardColor.withOpacity(0.05)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  '$icon',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeExtraSmall),
                child: Text(
                  title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: isSelected
                        ? Get.theme.primaryColor
                        : Get
                            .theme.bottomNavigationBarTheme.unselectedItemColor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

List<Product> productList = [
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
  Product(
      id: '11',
      quantity: '5',
      price: '25',
      categories: 'sasa',
      discount: '25',
      imagefrontsmallurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagefronturl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      imagenutritionurl:
          'https://artawiya.com/fadaalhalj/api/v1/upload/7472tomtom.png',
      manufacturingplaces: 'sd',
      productname: 'mohammed',
      regularPrice: '55',
      stores: 'sadsa'),
];

List<CategoryItem> categoryItems = [
  CategoryItem(
    title: 'All',
    icon: 'sassd',
    isSelected: true,
  ),
  CategoryItem(
    title: 'Spicy',
    icon: 'sassd',
    isSelected: true,
  ),
  CategoryItem(
    title: 'Fruits',
    icon: 'sassd',
    isSelected: true,
  ),
  CategoryItem(
    title: 'Sweet',
    icon: 'sassd',
    isSelected: true,
  ),
  CategoryItem(
    title: 'Kitchen',
    icon: 'sassd',
    isSelected: true,
  ),
  CategoryItem(
    title: 'Esqsetional',
    icon: 'sassd',
    isSelected: true,
  ),
];
