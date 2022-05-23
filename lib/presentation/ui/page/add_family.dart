import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/presentation/controllers/add_family_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFamily extends StatelessWidget {
  AddFamily({Key? key}) : super(key: key);
  final AddFamilyController _controller = Get.put(AddFamilyController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Pages.addFamily.getDisplayName),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 64,
                ),
                Obx(() {
                  return TextFormField(
                    onChanged: _controller.nameChanged,
                    decoration: FFMInputTheme.ffmInputDecoration(
                        'register_name'.tr,
                        Icons.person,
                        errorText: _controller.errorNameText.value),
                  );
                }),
                const SizedBox(
                  height: 8,
                ),
                Obx(() {
                  return TextFormField(
                    onChanged: _controller.emailChanged,
                    decoration: FFMInputTheme.ffmInputDecoration(
                        'register_email'.tr,
                        Icons.person,
                        errorText: _controller.errorEmailText.value),
                  );
                }),
                const SizedBox(
                  height: 8,
                ),
                Obx(() {
                  return TextFormField(
                    obscureText: true,
                    onChanged: _controller.passwordChanged,
                    decoration: FFMInputTheme.ffmInputDecoration(
                        'register_password'.tr,
                        Icons.lock,
                        errorText: _controller.errorPasswordText.value),
                  );
                }),
                const SizedBox(
                  height: 8,
                ),
                Obx(() {
                  return TextFormField(
                    obscureText: true,
                    onChanged: _controller.passwordRettypeChanged,
                    decoration: FFMInputTheme.ffmInputDecoration(
                        'register_retype_password'.tr,
                        Icons.lock,
                        errorText: _controller.errorPasswordRetypeText.value),
                  );
                }),
                Obx(() {
                  return ElevatedButton(
                    onPressed: _controller.submitFunc.value,
                    child: Text('register_button'.tr),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
