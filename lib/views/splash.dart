import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/core/resources/color_manager.dart';

import '../constants/assets.dart';
import '../core/resources/routes_manager.dart';
import '../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    movedToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: Image.asset(
          Assets.assetsImagesAppIcon,
          scale: 2.5,
        ),
      ),
    );
  }

  void movedToNextPage() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, RoutesManager.welcomeScreen);
        }
      },
    );
  }
}
