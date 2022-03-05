import 'package:flutter/material.dart';

enum Pages {
  root,
  splash,
  login,
  home,
}

extension PagesExtension on Pages {
  String get name {
    switch (this) {
      case Pages.root:
        return '/';
      case Pages.splash:
        return '/splash';
      case Pages.login:
        return '/login';
      case Pages.home:
        return '/home';
    }
  }

  String get getDisplayName {
    switch (this) {
      case Pages.root:
        return '/';
      case Pages.splash:
        return 'Splash screen';
      case Pages.login:
        return 'Login';
      case Pages.home:
        return 'Home';
    }
  }

  Icon get getDisplayIcon {
    switch (this) {
      case Pages.root:
        return const Icon(Icons.error);
      case Pages.splash:
        return const Icon(Icons.error);
      case Pages.login:
        return const Icon(Icons.error);
      case Pages.home:
        return const Icon(Icons.house_rounded);
    }
  }
}
