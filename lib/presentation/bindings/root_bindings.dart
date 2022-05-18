import 'package:family_fridge_manager/data/services/services.dart';
import 'package:family_fridge_manager/presentation/controllers/authentication_controller.dart';
import 'package:get/instance_manager.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
        AuthenticationController(
            authenticationManager: Get.find<AuthenticationManager>(),
            loginService: Get.find<LoginService>()),
        permanent: true);
    Get.put(
        DataBaseService(), permanent: true);
  }
}
