import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/bottom_navbar.dart';
import 'package:e_commerce/views/pages/landing_page.dart';
import 'package:e_commerce/views/pages/auth_page.dart';
import 'package:e_commerce/views/pages/product_details.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.bottomNavbarPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavbarPage(),
        settings: settings,
      );
    case AppRoutes.registerPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.productDetailsRout:
      final product = settings.arguments as Product;
      return CupertinoPageRoute(
        builder: (_) => ProductDetails(
          product: product,
        ),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPAge(),
        settings: settings,
      );
  }
}
