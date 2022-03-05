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
  Rx<String?> userID = Rxn<String?>();
  Rxn<UserProfileModel> userProfile = Rxn();

  String get firstName => userProfile.value?.firstName ?? 'Unknown';

  Future<void> setAllData() async {
    String? id = authenticationManager.checkLoginStatus();
    if (id != null) {
      userProfile.value = await getUserProfileModel(id);
    }
    super.onInit();
  }

  Future<String?> signInWithEmail(String email, String password) async {
    try {
      final response = await loginService.signInUser(email, password);
      userID.value = response!.uid;
      userProfile.value = await getUserProfileModel(userID.value.toString());

      authenticationManager.logIn(
          userID.value, userProfile.value!.userType.toString());

      return userID.value;
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

  Future<String?> registerInWithEmail(String email, String password) async {
    try {
      final response = await loginService.createUser(email, password);
      userID.value = response!.uid;

      UserProfileModel newUser = UserProfileModel(
          uid: response.uid,
          firstName: 'Kalle',
          lastName: 'Anka',
          userType: UserType.customer);
      FirestoreConnection firestoreConnection =
          FirestoreConnection(uid: userID.value.toString());
      await firestoreConnection.addUser(newUser);
      userProfile.value = newUser;

      authenticationManager.logIn(
          userID.value, userProfile.value!.userType.toString());

      return userID.value;
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
      userID.value = null;
      userProfile.value = null;
      authenticationManager.logOut();
      Get.offAllNamed(Pages.home.name);
    } catch (e) {
      // print(e.toString());
    }
  }

  Future<UserProfileModel> getUserProfileModel(String id) async {
    FirestoreConnection firestoreConnection = FirestoreConnection(uid: id);
    return await firestoreConnection.findUser();
  }
}
