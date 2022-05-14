import 'package:family_fridge_manager/data/services/services.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<AuthenticationManager>(() => AuthenticationManager(),
        fenix: true);
    Get.lazyPut<LoginService>(() => LoginService(), fenix: true);
    Get.lazyPut<DataBaseService>(() => DataBaseService(), fenix: true);
  }
}
