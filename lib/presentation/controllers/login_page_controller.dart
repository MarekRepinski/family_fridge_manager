import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/presentation/controllers/authentication_controller.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  LoginPageController();

  FormType formType = FormType.login;
  late final AuthenticationController _authenticationController;
  RxString email = RxString('');
  RxString password = RxString('');
  RxString passwordRettype = RxString('');
  RxnString errorEmailText = RxnString(null);
  RxnString errorPasswordText = RxnString(null);
  RxnString errorPasswordRetypeText = RxnString('');

  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  @override
  void onInit() {
    super.onInit();
    _authenticationController = Get.find();
    debounce<String>(email, validations,
        time: const Duration(milliseconds: 500));
    debounce<String>(password, validations,
        time: const Duration(milliseconds: 500));
    debounce<String>(passwordRettype, validations,
        time: const Duration(milliseconds: 500));
  }

  void validations(String val) async {
    errorEmailText.value = null;
    errorPasswordText.value = null;
    submitFunc.value = null;
    if (formType == FormType.login) {
      if (email.value.length > 5 && emailCheck(email.value)) {
        submitFunc.value = submitFunction();
        errorEmailText.value = null;
      }
    } else if (formType == FormType.register) {
      if (email.value.length > 5 && emailCheck(email.value)) {
        if (passwordLenght(password.value)) {
          if (passwordCheck(password.value, passwordRettype.value)) {
            submitFunc.value = submitFunction();
            errorEmailText.value = null;
            errorPasswordText.value = null;
          }
        }
      }
    }
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

  void emailChanged(String val) {
    email.value = val;
  }

  void passwordChanged(String val) {
    password.value = val;
  }

  void passwordRettypeChanged(String val) {
    passwordRettype.value = val;
  }

  void changeFormType(FormType ft) {
    formType = ft;
  }

  Future<void> Function() submitFunction() {
    return () async {
      if (formType == FormType.login) {
        await loginUser(email.value, password.value);
      } else if (formType == FormType.register) {
        await registerUser(email.value, password.value);
      }
      Get.offNamed(Pages.splash.name);
    };
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await _authenticationController.signInWithEmail(email, password);
    } catch (e) {
      // print(e.toString());
      Get.defaultDialog(); // Needs to be here in order to open previous dialog. Bug?
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      await _authenticationController.registerInWithEmail(email, password);
    } catch (e) {
      // print(e.toString());
      Get.defaultDialog(); // Needs to be here in order to open previous dialog. Bug?
    }
  }
}

enum FormType { login, register }
