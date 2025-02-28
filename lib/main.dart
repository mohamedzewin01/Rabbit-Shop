import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grocery_app/core/resources/routes_manager.dart';
import 'package:grocery_app/utils/helper.dart';
import 'package:grocery_app/utils/myTheme.dart';
import 'core/di/di.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';
import 'localization/locale_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.cacheInitialization();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            locale: locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('ar'),
            ],
            theme: AppThemes.lightTheme1,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: RoutesManager.splashScreen,
            // home: SplashScreen(),
          );
        },
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ThemeProvider(
//         initTheme: AppThemes.lightTheme1,
//         builder: (context, myTheme) {
//           return GetMaterialApp(
//             title: "holmon",
//             theme: myTheme,
//             initialRoute: "/splash",
//             getPages: MyRoutes.pages,
//           );
//         });
//   }
// }
