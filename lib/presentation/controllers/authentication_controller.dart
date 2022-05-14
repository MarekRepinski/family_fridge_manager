import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/data/models/user_profile_model.dart';
import 'package:family_fridge_manager/data/services/firestore_connection.dart';
import 'package:family_fridge_manager/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  AuthenticationController(
      {required this.authenticationManager, required this.loginService});

  final AuthenticationManager authenticationManager;
  final LoginService loginService;

  Future<void> signInWithEmail(String email, String password) async {
    try {
      final response = await loginService.signInUser(email, password);
      authenticationManager.logIn(response!.uid,);
    } catch (e) {
      // print(e.toString());
      Get.defaultDialog(
          middleText: 'login_controller_user_not_found'.tr,
          textConfirm: 'login_controller_ok'.tr,
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      logout();
      rethrow;
    }
  }

  Future<void> registerInWithEmail(
      String name,
      String email,
      String password,
      {String fridgeID = ''}) async {
    try {
      final response = await loginService.createUser(email, password);
      String _uid = response!.uid;

      UserProfileModel newUser = UserProfileModel(
          uid: response.uid, name: name, fridgeID: fridgeID, owner: true);
      FirestoreConnection firestoreConnection =
          FirestoreConnection();
      await firestoreConnection.addUser(newUser);
      authenticationManager.logIn(_uid);
    } catch (e) {
      // print(e.toString());
      Get.defaultDialog(
          middleText: 'login_controller_registration_error'.tr,
          textConfirm: 'login_controller_ok'.tr,
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      logout();
      rethrow;
    }
  }

  void logout() async {
    try {
      await loginService.signOutUser();
      authenticationManager.logOut();
      Get.offAllNamed(Pages.home.name);
    } catch (e) {
      // print(e.toString());
    }
  }
}
