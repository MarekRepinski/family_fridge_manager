import 'dart:io';

import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/presentation/controllers/add_fridge_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFridgeItem extends StatelessWidget {
  AddFridgeItem({Key? key}) : super(key: key);
  final AddFridgeItemController _controller =
      Get.put(AddFridgeItemController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'add_item_title'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(children: [
              const SizedBox(
                height: 20.0,
              ),
              Obx(() {
                return _controller.image.value == null
                    ? const Placeholder(
                        fallbackHeight: 200,
                        fallbackWidth: double.infinity,
                      )
                    : Image.file(
                        File(_controller.image.value!.path),
                        height: 200.0,
                        fit: BoxFit.contain,
                      );
              }),
              const SizedBox(
                height: 10.0,
              ),
              TextButton.icon(
                onPressed: _controller.changeImage,
                icon: const Icon(Icons.camera_alt),
                label: Text(
                  'add_item_photo'.tr,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                initialValue: '',
                decoration: FFMInputTheme.ffmInputDecoration(
                  'add_item_description',
                  Icons.edit,
                ),
                onChanged: _controller.descriptionChanged,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Obx(() {
                return Text(
                  'add_item_keep_for'.tr + _controller.showDayText.value,
                  style: Theme.of(context).textTheme.caption,
                );
              }),
              SliderTheme(
                data: const SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10)),
                child: Obx(() {
                  return Slider(
                    value: (_controller.slidervalue.value).toDouble(),
                    activeColor: Colors.green[
                        (100 * (_controller.slidervalue.value / 2).round())
                            .toInt()],
                    inactiveColor: Colors.red[(900 -
                            (100 * (_controller.slidervalue.value / 2).round()))
                        .toInt()],
                    min: 1,
                    max: 14,
                    divisions: 13,
                    label: _controller.showDayText.value,
                    onChanged: _controller.slidervalueChanged,
                  );
                }),
              ),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: _controller.submit,
              ),
              const SizedBox(height: 12.0),
              Obx((){
                return Text(
                  _controller.error.value,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0),
                );
              }),
            ]),
          ),
        ),
      ),
    ));
  }
}
