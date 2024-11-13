import 'package:flutter/material.dart';

abstract class AppRouter {
  static Future<void> navigateTo(BuildContext context, Widget page) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
  }

  static Future<void> navigateAndPop(BuildContext context, Widget page) {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static Future<void> navigateAndFinish(BuildContext context, Widget page) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  static Future<void> newNavigate(context, page) {
    return Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(builder: (context) => page()));
  }

  static void pop(BuildContext context) {
    return Navigator.pop(context);
  }
}
