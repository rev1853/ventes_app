// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventes/core/page_route.dart';
import 'package:ventes/app/states/controllers/contact_state_controller.dart';
import 'package:ventes/app/states/controllers/customer_state_controller.dart';
import 'package:ventes/app/states/controllers/dashboard_state_controller.dart';
import 'package:ventes/app/resources/views/contact.dart';
import 'package:ventes/app/resources/views/customer.dart';
import 'package:ventes/app/resources/views/dashboard.dart';

class DashboardNavigator extends StatelessWidget {
  static const id = 1;
  DashboardNavigator({required this.navigatorKey});
  GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: DashboardView.route,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == DashboardView.route) {
          return ViewRoute(
            page: () => DashboardView(),
            bindings: [
              BindingsBuilder(() {
                Get.put(DashboardStateController());
              })
            ],
          );
        }

        if (routeSettings.name == ContactView.route) {
          return ViewRoute(
            page: () => ContactView(),
            bindings: [
              BindingsBuilder(() {
                Get.put(ContactStateController());
              })
            ],
          );
        }

        if (routeSettings.name == CustomerView.route) {
          return ViewRoute(
            page: () => CustomerView(),
            bindings: [
              BindingsBuilder(() {
                Get.put(CustomerStateController());
              })
            ],
          );
        }
      },
    );
  }
}
