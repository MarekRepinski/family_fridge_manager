import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    final _authenticationManager = Get.find<AuthenticationManager>();
    return _authenticationManager.isLogged.value
        ? null
        : RouteSettings(name: Pages.login.name);
  }
}