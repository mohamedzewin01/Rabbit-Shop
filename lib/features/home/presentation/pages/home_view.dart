import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/home/presentation/manager/home_cubit.dart';

import '../../../../core/widgets/see_all_view.dart';
import '../../../layout/presentation/cubit/layout_cubit.dart';
import '../widgets/app_bar_body.dart';
import '../widgets/carousel.dart';
import '../widgets/grid_categories.dart';
import '../widgets/horizontal_product_list.dart';
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
                          LayoutCubit.get(context).changeIndex(1);
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
                      child: SizedBox(
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
