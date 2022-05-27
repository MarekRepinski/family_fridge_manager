import 'package:family_fridge_manager/data/services/services.dart';
import 'package:family_fridge_manager/presentation/controllers/fridge_item_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FridgeItemDetail extends StatelessWidget {
  FridgeItemDetail({Key? key}) : super(key: key);
  final FridgeItemDetailController _controller =
      Get.put(FridgeItemDetailController());
  final DataBaseService _db = Get.find();

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        PageController(initialPage: _db.currentIndex);

    if (_db.firstDetail) {
      _db.setFirstDetail();
      Get.snackbar(
          'fridge_item_detail_snackbar_title'.tr, // Title
          'fridge_item_detail_snackbar_msg'.tr, // Message
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.flatware),
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2),
          instantInit: false);
    }

    return PageView.builder(
      controller: _pageController,
      itemCount: _db.fridgeItemList.length,
      itemBuilder: (context, position) {
        _controller.setupItemCard(position);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'fridge_item_detail_title'.tr,
            ),
            // centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Get.bottomSheet(
                  bottomSheet(context, position),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                );
              },
              child: FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 0.95,
                child: Card(
                  elevation: 8.0,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: _controller.colorWithIntense, width: 3)),
                  color: Theme.of(context).primaryColor,
                  shadowColor: _controller.color,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Image.network(
                            _db.fridgeItemList[position].picURL,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          _db.fridgeItemList[position].desc,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'fridge_item_detail_best_before'.tr +
                              _db.fridgeItemList[position].bestBefore
                                  .toString()
                                  .substring(0, 10),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Obx(() {
                          if (_controller.notice.value) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _controller.noticeIcon.value,
                                  color: _controller.noticeTextColor.value,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  _controller.noticeText.value!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.merge(TextStyle(
                                          color:
                                              _controller.noticeTextColor.value,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            );
                          }
                          return Container();
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bottomSheet(context, int index) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('fridge_item_detail_settingsform_title'.tr,
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(
            height: 20.0,
          ),
          Text('fridge_item_detail_settingsform_headline'.tr,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _controller.promoteFood(index);
                  Get.back();
                  Get.snackbar(
                      'fridge_item_detail_settingsform_promoted'.tr, // Title
                      'null'.tr, // Message
                      colorText: Colors.black,
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(Icons.flatware),
                      backgroundColor: Colors.white,
                      duration: const Duration(seconds: 2),
                      instantInit: false);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.notification_important,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text('fridge_item_detail_settingsform_promo'.tr,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: 'fridge_item_detail_settingsform_alert'.tr,
                    middleText: 'fridge_item_detail_settingsform_alert_eat'.tr,
                    backgroundColor: Colors.white,
                    radius: 20,
                    buttonColor: Colors.red,
                    confirm: confirmButton(false, index),
                    cancel: cancelButton(),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.flatware,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text('fridge_item_detail_settingsform_eat'.tr,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: 'fridge_item_detail_settingsform_alert'.tr,
                    middleText:
                        'fridge_item_detail_settingsform_alert_trash'.tr,
                    backgroundColor: Colors.white,
                    radius: 20,
                    buttonColor: Colors.red,
                    confirm: confirmButton(true, index),
                    cancel: cancelButton(),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.delete,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text('fridge_item_detail_settingsform_trash'.tr,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget confirmButton(bool trashed, int index) {
    return ElevatedButton(
        onPressed: () {
          _controller.eatFood(trashed, index);
          Get.back();
          Get.back();
          Get.back();
        },
        child: Text('fridge_item_detail_settingsform_alert_confirm'.tr));
  }

  Widget cancelButton() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
          Get.back();
        },
        child: Text('fridge_item_detail_settingsform_alert_cancel'.tr));
  }
}
