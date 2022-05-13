import 'dart:developer';
import 'package:family_fridge_manager/presentation/bindings/root_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/constants.dart';
import 'core/routes/route_collection.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(Get.deviceLocale.toString());
    return GetMaterialApp(
      translations: FFMTranslations(),
      title: 'Family Fridge Manager',
      locale: Get.deviceLocale,
      initialBinding: RootBindings(),
      fallbackLocale: const Locale('en', 'US'),
      theme: basicTheme(),
      initialRoute: Pages.loading.name,
      getPages: RouteCollection.routeCollection,
    );
  }
}

