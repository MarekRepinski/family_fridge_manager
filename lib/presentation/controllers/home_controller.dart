import 'package:family_fridge_manager/data/models/fridge_item_model.dart';
import 'package:family_fridge_manager/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final DataBaseService _db = Get.find();
  ItemCard itemCard = ItemCard(
      desc: '',
      color: Colors.green,
      colorIntense: (Colors.green[300])!,
      icon: Icons.restaurant,
      margin: 2.0);

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  String getUserName() {
    if (_db.currentUser != null) {
      return _db.currentUser!.name;
    }
    return 'NULL';
  }

  void setupItemCard(int index) {
    final FridgeItemModel goods = _db.fridgeItemList[index];

    itemCard.margin = 5.0;
    if (goods.desc.length > 10) {
      itemCard.desc = goods.desc.substring(0, 9) + '..';
      itemCard.margin = 2.0;
    } else {
      itemCard.desc = goods.desc;
    }

    int colorIntense = 300;
    int dateDiff = goods.bestBefore.difference(DateTime.now()).inDays;

    if (dateDiff > 7 || dateDiff < 0) {
      colorIntense = 500;
    }

    if (dateDiff > 1) {
      itemCard.color = Colors.green;
      itemCard.colorIntense = (Colors.green[colorIntense])!;
    } else {
      itemCard.color = Colors.red;
      itemCard.colorIntense = (Colors.red[colorIntense])!;
    }

    if (goods.promo) {
      itemCard.icon = Icons.priority_high;
    } else if (dateDiff < 0) {
      itemCard.icon = Icons.warning;
    } else if (dateDiff < 2) {
      itemCard.icon = Icons.alarm;
    } else {
      itemCard.icon = Icons.restaurant;
    }
  }
}

class ItemCard {
  String desc;
  Color color;
  Color colorIntense;
  IconData icon;
  double margin;

  ItemCard({
    required this.desc,
    required this.color,
    required this.colorIntense,
    required this.icon,
    required this.margin,
  });
}
