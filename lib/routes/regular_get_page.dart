// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegularGetPage extends GetPage {
  RegularGetPage({
    required String name,
    required Widget Function() page,
    List<Bindings> bindings = const [],
    List<GetMiddleware>? middlewares,
  }) : super(
          name: name,
          page: page,
          transition: Transition.rightToLeft,
          transitionDuration: Duration(
            milliseconds: 300,
          ),
          bindings: bindings,
          middlewares: middlewares,
        );
}

class RegularGetRoute extends GetPageRoute {
  RegularGetRoute({
    required Widget Function() page,
    List<Bindings> bindings = const [],
    List<GetMiddleware>? middlewares,
    Bindings? binding,
  }) : super(
          page: page,
          transition: Transition.rightToLeft,
          transitionDuration: Duration(
            milliseconds: 300,
          ),
          bindings: bindings,
          binding: binding,
          middlewares: middlewares,
        );
}
