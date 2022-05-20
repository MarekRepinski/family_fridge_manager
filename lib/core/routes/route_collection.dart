import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/core/routes/middlewares/authentication_middelware.dart';
import 'package:family_fridge_manager/presentation/ui/page/pages.dart';
import 'package:get/get.dart';

class RouteCollection {
  RouteCollection._();

  static final routeCollection = [
    GetPage(
      name: Pages.loading.name,
      page: () => LoadingPage(),
    ),
    GetPage(
      name: Pages.home.name,
      page: () => HomePage(),
      middlewares: [AuthenticationMiddleware(),],
    ),
    GetPage(
        name: Pages.login.name,
        page: () => const LoginPage(),
    ),
    GetPage(
        name: Pages.addFridgeItem.name,
        page: () => AddFridgeItem(),
    ),
    GetPage(
        name: Pages.fridgeItemDetail.name,
        page: () => FridgeItemDetail(),
    ),
  ];
}
