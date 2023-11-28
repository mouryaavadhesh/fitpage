import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NavigationUtils {
  static Future<T> push<T>(BuildContext context, Widget screen,
      {isBottomSheetEffectEnabled = false}) async {
    if (isBottomSheetEffectEnabled) {
      return await Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          settings: routeSettings(context, screen.runtimeType)));
    } else {
      return await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => screen,
          settings: routeSettings(context, screen.runtimeType)));
    }
  }

  static bool isLastScreen(BuildContext context, Type type) {
    String routesName = ModalRoute.of(context)?.settings.name ?? "/";
    List<String> routes = routesName.split("/");
    if (routes.length >= 2) {
      if (routes.reversed.toList()[1].trim() == type.toString()) {
        return true;
      }
    }
    return false;
  }

  static Future<T> pushReplacement<T>(
          BuildContext context, Widget screen) async =>
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => screen,
          settings: routeSettings(context, screen.runtimeType)));

  static void pop(BuildContext context, {dynamic result}) =>
      Navigator.of(context).pop(result);

  static Future<Object?> pushNamedAndRemoveUntil<T>(
          BuildContext context, String route) async =>
      await Navigator.of(context)
          .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);

  static RouteSettings routeSettings(BuildContext context, Type screen) {
    String routesName = ModalRoute.of(context)?.settings.name ?? "/";
    String currentRoutes = screen.toString();
    return RouteSettings(
        name: !routesName.isEmptyOrNull
            ? "$routesName/$currentRoutes"
            : "/$currentRoutes");
  }
}
