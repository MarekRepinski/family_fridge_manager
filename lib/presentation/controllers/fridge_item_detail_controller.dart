import 'package:family_fridge_manager/data/models/fridge_item_model.dart';
import 'package:family_fridge_manager/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FridgeItemDetailController extends GetxController {
  final DataBaseService _db = Get.find();
  Color color =  Colors.green;
  Color colorWithIntense = (Colors.green[300])!;
  RxBool notice = RxBool(false);
  Rx<IconData?> noticeIcon = Rx<IconData?>(null);
  RxnString noticeText = RxnString(null);
  Rx<Color> noticeTextColor = Rx<Color>(Colors.red);

  void setupItemCard(int index) {
    FridgeItemModel goods = _db.fridgeItemList[index];

    notice = RxBool(false);
    noticeIcon = Rx<IconData?>(null);
    noticeText = RxnString(null);
    noticeTextColor.value = Colors.red;

    int colorIntense = 300;
    int dateDiff = goods.bestBefore.difference(DateTime.now()).inDays;

    if (dateDiff > 7 || dateDiff < 0) {
      colorIntense = 500;
    }

    if (dateDiff > 1){
      color = Colors.green;
      colorWithIntense = (Colors.green[colorIntense])!;
    } else {
      if (dateDiff < 0){
        notice.value = true;
        noticeIcon.value = Icons.warning;
        noticeText.value = 'fridge_item_detail_overdue'.tr;
      } else {
        notice.value = true;
        noticeIcon.value = Icons.alarm;
        noticeText.value = 'fridge_item_detail_alarm'.tr;
      }
      color = Colors.red;
      colorWithIntense = (Colors.red[colorIntense])!;
    }

    if (goods.promo){
      notice.value = true;
      noticeIcon.value = Icons.priority_high;
      noticeText.value = 'fridge_item_detail_promo'.tr;
      noticeTextColor.value = Colors.black;
    }
  }

  void promoteFood(int index) async{
    await _db.promoFood();
    await _db.addNewMsgLog('log_msg_promoted', _db.fridgeItemList[index].desc);
    notice.value = true;
    noticeIcon.value = Icons.priority_high;
    noticeText.value = 'fridge_item_detail_promo'.tr;
    noticeTextColor.value = Colors.black;
  }

  void eatFood(bool trash, int index) async {
    String _foodName = _db.fridgeItemList[index].desc;
    await _db.eatFood(trash);
    if (trash){
      await _db.addNewMsgLog('log_msg_trashed', _foodName);
    } else {
      await _db.addNewMsgLog('log_msg_ate', _foodName);
    }
  }
}


