import 'package:flutter/material.dart';

import '../../features/categories/presentation/pages/categories.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/profile/presentation/pages/profile.dart';

class AppConstants {
  static const int listGenerate = 6;
  static const viewOptions = <Widget>[
    HomeView(),
    Categories(),
    Scaffold(),
    Profile(),
  ];
}
