import 'package:flutter/material.dart';
import 'package:grocery_app/features/layout/presentation/widgets/mobile.dart';
import 'package:grocery_app/generated/assets.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Image.asset(Assets.imagesUser)),
        Expanded(flex: 1, child: LayoutMobileView()),
        Expanded(flex: 1, child: Image.asset(Assets.imagesUser)),
      ],
    );
  }
}
