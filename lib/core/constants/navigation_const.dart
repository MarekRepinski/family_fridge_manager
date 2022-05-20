import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Pages {
  root,
  loading,
  login,
  home,
  addFridgeItem,
  fridgeItemDetail,
  family,
  addFamily,
}

extension PagesExtension on Pages {
  String get name {
    switch (this) {
      case Pages.root:
        return '/';
      case Pages.loading:
        return '/loading';
      case Pages.login:
        return '/login';
      case Pages.home:
        return '/home';
      case Pages.addFridgeItem:
        return '/addFridgeItem';
      case Pages.fridgeItemDetail:
        return '/fridgeItemDetail';
      case Pages.family:
        return '/family';
      case Pages.addFamily:
        return '/addFamily';
    }
  }

  String get getDisplayName {
    switch (this) {
      case Pages.root:
        return '/';
      case Pages.loading:
        return 'Loading screen';
      case Pages.login:
        return 'Login';
      case Pages.home:
        return 'Family Fridge Manager';
      case Pages.addFridgeItem:
        return 'add_item_title'.tr;
      case Pages.fridgeItemDetail:
        return 'fridge_item_detail_title'.tr;
      case Pages.family:
        return 'family_title'.tr;
      case Pages.addFamily:
        return 'add_family_member_title'.tr;
    }
  }

  IconData get getDisplayIcon {
    switch (this) {
      case Pages.root:
        return Icons.error;
      case Pages.loading:
        return Icons.error;
      case Pages.login:
        return Icons.error;
      case Pages.home:
        return Icons.house_rounded;
      case Pages.addFridgeItem:
        return Icons.icecream;
      case Pages.fridgeItemDetail:
        return Icons.icecream;
      case Pages.family:
        return Icons.family_restroom;
      case Pages.addFamily:
        return Icons.family_restroom;
    }
  }
}
