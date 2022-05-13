import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/core/routes/middlewares/authentication_middelware.dart';
import 'package:family_fridge_manager/presentation/ui/page/home.dart';
import 'package:family_fridge_manager/presentation/ui/page/login_page.dart';
import 'package:family_fridge_manager/presentation/ui/page/loading_page.dart';
import 'package:get/get.dart';

class RouteCollection {
  RouteCollection._();

  static final routeCollection = [
    GetPage(
      name: Pages.loading.name,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: Pages.home.name,
      page: () => const HomePage(),
      middlewares: [AuthenticationMiddleware(),],
    ),
    GetPage(
        name: Pages.login.name,
        page: () => const LoginPage(),
    ),
  ];
}
