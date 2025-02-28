import 'dart:developer';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/functions/extenstions.dart';
import 'package:grocery_app/core/resources/color_manager.dart';
import 'package:grocery_app/features/home/presentation/manager/home_cubit.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/myTheme.dart';
import '../../../../views/common_widgets/appBar.dart';
import '../widgets/carousel.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/categories_view.dart';
import '../widgets/app_bar_body.dart';
import '../widgets/dropDownHomeMenu.dart';
import '../widgets/horizontal_product_list.dart';
import '../../../../core/widgets/see_all_view.dart';
import '../widgets/grid_categories.dart';
import '../widgets/search_text_filed.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [AppBarBody()];
            },
            body: SingleChildScrollView(
              child: Column(children: [
                SearchTextFiled(),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Carousel()),
                Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    SeeAllView(
                        context: context,
                        name: "Categories 🛍️",
                        onTapAction: () {
                          /// TODO: ALL Categories
                        }),
                    SizedBox(
                      height: 16,
                    ),
                    GridCategories(),
                    SeeAllView(
                        context: context,
                        name: "Best deals 🔥",
                        onTapAction: () {
                          /// TODO: ALL BEST DEALS
                        }),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Container(
                          height: 210,
                          //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: HorizontalProductList(
                              // page: 1,
                              // isSecondList: false,
                              )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
