import 'package:family_fridge_manager/app.dart';
import 'package:family_fridge_manager/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  DependencyInjection.init();

  runApp(const App());
}
