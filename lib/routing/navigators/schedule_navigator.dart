// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventes/app/network/services/schedule_service.dart';
import 'package:ventes/app/network/services/type_service.dart';
import 'package:ventes/app/network/services/user_service.dart';
import 'package:ventes/app/resources/views/schedule_form/update/schedule_fu.dart';
import 'package:ventes/core/page_route.dart';
import 'package:ventes/app/states/controllers/daily_schedule_state_controller.dart';
import 'package:ventes/app/states/controllers/schedule_fc_state_controller.dart';
import 'package:ventes/app/states/controllers/schedule_fu_state_controller.dart';
import 'package:ventes/app/states/controllers/schedule_state_controller.dart';
import 'package:ventes/app/resources/views/daily_schedule/daily_schedule.dart';
import 'package:ventes/app/resources/views/schedule/schedule.dart';
import 'package:ventes/app/resources/views/schedule_form/create/schedule_fc.dart';
import 'package:ventes/app/resources/widgets/regular_dropdown.dart';
import 'package:ventes/core/view_navigator.dart';

class ScheduleNavigator extends ViewNavigator {
  static const id = 3;
  ScheduleNavigator({required GlobalKey<NavigatorState> navigatorKey}) : super(navigatorKey: navigatorKey);
  @override
  String get initialRoute => ScheduleView.route;

  @override
  Map<String, ViewRoute Function(Map? args)> get routes => {
        ScheduleView.route: (args) => ViewRoute(
              page: () => ScheduleView(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => ScheduleService());
                Get.lazyPut(() => TypeService());
                Get.lazyPut(() => ScheduleStateController());
              }),
            ),
        DailyScheduleView.route: (args) => ViewRoute(
              page: () => DailyScheduleView(
                date: args!["date"],
              ),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => TypeService());
                Get.lazyPut(() => ScheduleService());
                Get.lazyPut(() => DailyScheduleStateController());
              }),
            ),
        ScheduleFormCreateView.route: (args) => ViewRoute(
              page: () => ScheduleFormCreateView(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => UserService());
                Get.lazyPut(() => TypeService());
                Get.lazyPut(() => ScheduleService());
                Get.lazyPut(() => ScheduleFormCreateStateController());
              }),
            ),
        ScheduleFormUpdateView.route: (args) => ViewRoute(
              page: () => ScheduleFormUpdateView(
                scheduleId: args!['scheduleId'],
              ),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => UserService());
                Get.lazyPut(() => TypeService());
                Get.lazyPut(() => ScheduleService());
                Get.lazyPut(() => ScheduleFormUpdateStateController());
              }),
            ),
      };
}
