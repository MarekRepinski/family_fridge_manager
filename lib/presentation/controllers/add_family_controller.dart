import 'package:family_fridge_manager/data/services/database_service.dart';
import 'package:family_fridge_manager/presentation/controllers/authentication_controller.dart';
import 'package:get/get.dart';

class AddFamilyController extends GetxController {
  late final AuthenticationController _authenticationController;
  final DataBaseService _db = Get.find();

  RxString name = RxString('');
  RxString email = RxString('');
  RxString password = RxString('');
  RxString passwordRettype = RxString('');
  RxnString errorEmailText = RxnString(null);
  RxnString errorNameText = RxnString(null);
  RxnString errorPasswordText = RxnString(null);
  RxnString errorPasswordRetypeText = RxnString('');

  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  @override
  void onInit() {
    super.onInit();
    _authenticationController = Get.find();
    debounce<String>(name, validations,
        time: const Duration(milliseconds: 500));
    debounce<String>(email, validations,
        time: const Duration(milliseconds: 500));
    debounce<String>(password, validations,
        time: const Duration(milliseconds: 500));
    debounce<String>(passwordRettype, validations,
        time: const Duration(milliseconds: 500));
  }

  void validations(String val) async {
    errorNameText.value = null;
    errorEmailText.value = null;
    errorPasswordText.value = null;
    submitFunc.value = null;
    if (nameCheck(name.value) &&
        email.value.length > 5 &&
        emailCheck(email.value) &&
        passwordLenght(password.value) &&
        passwordCheck(password.value, passwordRettype.value)) {
      submitFunc.value = submitFunction();
      errorNameText.value = null;
      errorEmailText.value = null;
      errorPasswordText.value = null;
    }
  }

  bool nameCheck(String val) {
    if (val.isNotEmpty && val != '') {
      return true;
    }
    errorNameText.value = 'registerform_name_empty';
    return false;
  }

  bool emailCheck(String val) {
    if (!val.isEmail) {
      errorEmailText.value = 'loginform_email_format'.tr;
      return false;
    }
    return true;
  }

  bool passwordLenght(String val) {
    if (val.length < 8) {
      errorPasswordText.value = 'registerform_password_short'.tr;
      return false;
    }
    return true;
  }

  bool passwordCheck(String password, String passwordRetype) {
    if (password != passwordRetype) {
      errorPasswordText.value = 'registerform_password_no_match'.tr;
      return false;
    }
    return true;
  }

  void nameChanged(String val) {
    name.value = val;
  }

  void emailChanged(String val) {
    email.value = val;
  }

  void passwordChanged(String val) {
    password.value = val;
  }

  void passwordRettypeChanged(String val) {
    passwordRettype.value = val;
  }

  Future<void> Function() submitFunction() {
    return () async {
      await addUser(name.value, email.value, password.value);
      _db.refreshFamilyMemberList();
      Get.back();
    };
  }

  Future<void> addUser(String name, String email, String password) async {
    try {
      await _authenticationController.addUserWithEmail(name, email, password,
          fridgeID: _db.currentUser!.fridgeID);
    } catch (e) {
      // print(e.toString());
      Get.defaultDialog(); // Needs to be here in order to open previous dialog. Bug?
    }
  }
}
