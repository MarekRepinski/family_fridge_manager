import 'package:family_fridge_manager/app.dart';
import 'package:family_fridge_manager/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  DependencyInjection.init();

  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget splashScreen = SplashScreenView(
      navigateRoute: const App(),
      duration: 5000,
      imageSize: 200,
      imageSrc: "assets/cartoon_fridge.png",
      text: "What's in your Fridge?",
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: const Color(0xFFE2DDFC),
    );

    return
      MaterialApp(
        title: 'Family Fridge Manager',
        home: splashScreen,
      );
  }
}