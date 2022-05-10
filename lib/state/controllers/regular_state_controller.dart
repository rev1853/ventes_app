import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegularStateController extends GetxController {
  final GlobalKey appBarKey = GlobalKey();
  bool get isFixedBody => true;

  final _minHeight = 0.0.obs;
  double get minHeight => _minHeight.value;
  set minHeight(double value) => _minHeight.value = value;

  @override
  void onReady() {
    super.onReady();

    if (isFixedBody) {
      double distraction = (appBarKey.currentContext?.size?.height ?? 0) + 70;
      _minHeight.value = Get.height - distraction;
    }
  }
}