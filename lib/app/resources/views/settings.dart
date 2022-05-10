// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ventes/app/state/controllers/settings_state_controller.dart';
import 'package:ventes/core/regular_view.dart';

class SettingsView extends View<SettingsStateController> {
  static const String route = "/settings";
  SettingsView() {
    state = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
