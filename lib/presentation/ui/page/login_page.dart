import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/presentation/controllers/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late LoginPageController _loginPageController;

  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    _loginPageController = Get.put(LoginPageController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _formType == FormType.login
              ? Text('login_title_login'.tr,)
              : Text('login_title_register'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: _formType == FormType.login ? loginForm() : registerForm(),
        ),
      ),
    );
  }

  Column loginForm() {
    _loginPageController.changeFormType(FormType.login);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          return TextFormField(
            onChanged: _loginPageController.emailChanged,
            decoration: FFMInputTheme.ffmInputDecoration(
                'login_email'.tr,
                Icons.person,
                _loginPageController.errorEmailText.value),
          );
        }),
        const SizedBox(
          height: 8,
        ),
        Obx(() {
          return TextFormField(
            obscureText: true,
            onChanged: _loginPageController.passwordChanged,
            decoration: FFMInputTheme.ffmInputDecoration(
                'login_password'.tr,
                Icons.lock,
                _loginPageController.errorPasswordText.value),
          );
        }),
        Obx(() {
          return ElevatedButton(
            onPressed: _loginPageController.submitFunc.value,
            child: Text('login_button'.tr),
          );
        }),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.register;
            });
          },
          child: Text('login_new_account'.tr),
        ),
      ],
    );
  }

  SingleChildScrollView registerForm() {
    _loginPageController.changeFormType(FormType.register);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 64,
          ),
          Obx(() {
            return TextFormField(
              onChanged: _loginPageController.nameChanged,
              decoration: FFMInputTheme.ffmInputDecoration(
                  'register_name'.tr,
                  Icons.person,
                  _loginPageController.errorNameText.value),
            );
          }),
          const SizedBox(
            height: 8,
          ),
          Obx(() {
            return TextFormField(
              onChanged: _loginPageController.emailChanged,
              decoration: FFMInputTheme.ffmInputDecoration(
                  'register_email'.tr,
                  Icons.person,
                  _loginPageController.errorEmailText.value),
            );
          }),
          const SizedBox(
            height: 8,
          ),
          Obx(() {
            return TextFormField(
              obscureText: true,
              onChanged: _loginPageController.passwordChanged,
              decoration: FFMInputTheme.ffmInputDecoration(
                  'register_password'.tr,
                  Icons.lock,
                  _loginPageController.errorPasswordText.value),
            );
          }),
          const SizedBox(
            height: 8,
          ),
          Obx(() {
            return TextFormField(
              obscureText: true,
              onChanged: _loginPageController.passwordRettypeChanged,
              decoration: FFMInputTheme.ffmInputDecoration(
                  'register_retype_password'.tr,
                  Icons.lock,
                  _loginPageController.errorPasswordRetypeText.value),
            );
          }),
          Obx(() {
            return ElevatedButton(
              onPressed: _loginPageController.submitFunc.value,
              child: Text('register_button'.tr),
            );
          }),
          TextButton(
            onPressed: () {
              setState(() {
                _formType = FormType.login;
              });
            },
            child: Text('register_login'.tr),
          ),
        ],
      ),
    );
  }
}
