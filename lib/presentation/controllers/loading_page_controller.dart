import 'package:family_fridge_manager/core/constants/navigation_const.dart';
import 'package:family_fridge_manager/data/services/database_service.dart';
import 'package:get/get.dart';

class LoadingPageController extends GetxController{
  final DataBaseService _dataBaseService = Get.find();

  @override
  void onInit() async {
    super.onInit();
    await _dataBaseService.getUserProfileModel();
    _dataBaseService.setShowSplash();
    Get.offNamed(Pages.home.name);
  }
}