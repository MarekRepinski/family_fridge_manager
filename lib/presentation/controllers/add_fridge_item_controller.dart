import 'dart:math';
import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/data/services/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFridgeItemController extends GetxController{
  final DataBaseService _db = Get.find();

  Rxn<XFile> image = Rxn(null);
  RxString error = RxString('');
  RxString description = RxString('');
  RxDouble slidervalue = RxDouble(1);
  RxDouble days = RxDouble(1);
  RxString showDayText = RxString('');

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future changeImage() async {
    image.value = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image.value != null) {
      error.value = '';
    }
  }

  void descriptionChanged(String val) {
    description.value = val;
  }

  void slidervalueChanged(double val) {
    slidervalue.value = val;
    setDays();
  }

  void setDays(){
    if (slidervalue.value == 1) {
      slidervalue.value = 1;
      showDayText.value = 'add_item_slider_1_day'.tr;
    } else if (slidervalue.value < 7) {
      days.value = slidervalue.value;
      showDayText.value = slidervalue.value.toInt().toString() + 'add_item_slider_days'.tr;
    } else if (slidervalue.value == 7) {
      days.value = slidervalue.value;
      showDayText.value = 'add_item_slider_1_week'.tr;
    } else if (slidervalue.value < 10) {
      days.value = (slidervalue.value-6) * 7;
      showDayText.value = (slidervalue.value-6).toInt().toString() + 'add_item_slider_weeks'.tr;
    } else if (slidervalue.value == 10) {
      days.value = 30;
      showDayText.value = 'add_item_slider_1_month'.tr;
    } else if (slidervalue.value < 14) {
      num temp = 3 * pow(2, (slidervalue.value - 11));
      days.value = temp * 30;
      showDayText.value = temp.toInt().toString() + 'add_item_slider_months'.tr;
    } else {
      days.value = 3650; // 10 years
      showDayText.value = 'add_item_slider_for_ever'.tr;
    }
  }

  void submit() async {
    if (image.value != null){
      //save to database
      await _db.addNewFridgeItem(description.value, days.value, image.value!.path);
      await _db.addNewMsgLog('log_msg_added');
      Get.offNamed(Pages.loading.name);
    } else {
      error.value = 'add_item_image_cant_be_empty'.tr;
    }
  }
}