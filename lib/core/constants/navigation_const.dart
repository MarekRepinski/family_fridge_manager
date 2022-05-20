import 'package:flutter/material.dart';

enum Pages {
  root,
  loading,
  login,
  home,
  addFridgeItem,
  fridgeItemDetail,
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
        return 'Home';
      case Pages.addFridgeItem:
        return 'Add Fridge Item';
      case Pages.fridgeItemDetail:
        return 'Fridge Item Detail';
    }
  }

  Icon get getDisplayIcon {
    switch (this) {
      case Pages.root:
        return const Icon(Icons.error);
      case Pages.loading:
        return const Icon(Icons.error);
      case Pages.login:
        return const Icon(Icons.error);
      case Pages.home:
        return const Icon(Icons.house_rounded);
      case Pages.addFridgeItem:
        return const Icon(Icons.icecream);
      case Pages.fridgeItemDetail:
        return const Icon(Icons.icecream);
    }
  }
}
