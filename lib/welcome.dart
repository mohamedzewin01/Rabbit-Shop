import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/core/resources/color_manager.dart';
import 'package:grocery_app/core/resources/routes_manager.dart';
import 'package:grocery_app/views/registration.dart';
import 'constants/assets.dart';
import 'generated/assets.dart';
import 'views/common_widgets/appBar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    image: AssetImage(Assets.imagesWelcomeBg),
                    fit: BoxFit.cover,
                  ))),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorManager.cardColor,

                            // Get.theme.cardColor,
                            radius: 36,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                Assets.assetsImagesAppIcon,
                                scale: 4.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Get your groceries delivered to your home",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              "The best delivery app in town for delivering your daily fresh groceries",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: ColorManager.primary),
                            ),
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,
                                      RoutesManager.registrationScreen);
                                },
                                style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  shape: StadiumBorder(),
                                  backgroundColor: ColorManager.primaryColor,
                                ),
                                child: Text(
                                  "Shop now",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
