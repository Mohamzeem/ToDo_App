import 'package:flutter/material.dart';
import 'package:todo_app/view/task/screens/tabs_page.dart';
import '../view/bin_recycle/bin_recycle_page.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BinRecyclePage.id:
        return MaterialPageRoute(
          builder: (_) => const BinRecyclePage(),
        );
      case TabsPage.id:
        return MaterialPageRoute(
          builder: (_) => const TabsPage(),
        );
      default:
        return null;
    }
  }
}
