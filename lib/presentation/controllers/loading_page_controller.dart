import 'package:family_fridge_manager/core/constants/navigation_const.dart';
import 'package:family_fridge_manager/presentation/controllers/authentication_controller.dart';
import 'package:get/get.dart';

class LoadingPageController extends GetxController{
  final AuthenticationController _authenticationController = Get.find();

  @override
  void onInit() async {
    super.onInit();
    await _authenticationController.setAllData();
    if (_authenticationController.userProfile.value != null){
      // Load all data
    }
    // await Future.delayed(const Duration(seconds: 5));
    Get.offNamed(Pages.home.name);
  }
}