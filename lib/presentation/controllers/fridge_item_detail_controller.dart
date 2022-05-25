import 'package:family_fridge_manager/data/models/fridge_item_model.dart';
import 'package:family_fridge_manager/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FridgeItemDetailController extends GetxController {
  final DataBaseService _db = Get.find();
  String overdue = '';
  Color color =  Colors.green;
  Color colorWithIntense = (Colors.green[300])!;

  void setupItemCard(int index) {
    FridgeItemModel goods = _db.fridgeItemList[index];

    int colorIntense = 300;
    int dateDiff = goods.bestBefore.difference(DateTime.now()).inDays;

    if (dateDiff > 7 || dateDiff < 0) {
      colorIntense = 500;
    }

    overdue = 'null'.tr;
    if (dateDiff > 1){
      color = Colors.green;
      colorWithIntense = (Colors.green[colorIntense])!;
    } else {
      if (dateDiff < 0){
        overdue = 'fridge_item_detail_overdue'.tr;
      }
      color = Colors.red;
      colorWithIntense = (Colors.red[colorIntense])!;
    }
  }

  void promoteFood() async{
    await _db.promoFood();
    await _db.addNewMsgLog('log_msg_promoted');
  }

  void eatFood(bool trash) async {
    await _db.eatFood(trash);
    if (trash){
      await _db.addNewMsgLog('log_msg_trashed');
    } else {
      await _db.addNewMsgLog('log_msg_ate');
    }
  }
}


