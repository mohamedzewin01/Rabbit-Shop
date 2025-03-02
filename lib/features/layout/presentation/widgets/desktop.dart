import 'package:flutter/material.dart';
import 'package:grocery_app/features/layout/presentation/widgets/mobile.dart';
import 'package:grocery_app/generated/assets.dart';

import '../../../../core/resources/color_manager.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Scaffold(
              backgroundColor: ColorManager.primaryColor,
              body: Center(
                child: Image.asset(
                  Assets.imagesAppIcon,
                  scale: 2.5,
                ),
              ),
            )),
        Expanded(flex: 5, child: LayoutMobileView()),
        Expanded(
            flex: 1,
            child: Scaffold(
              backgroundColor: ColorManager.primaryColor,
              body: Center(
                child: Image.asset(
                  Assets.imagesAppIcon,
                  scale: 2.5,
                ),
              ),
            )),
      ],
    );
  }
}
