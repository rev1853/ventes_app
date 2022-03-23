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
          transition: Transition.fade,
          bindings: bindings,
          middlewares: middlewares,
        );
}