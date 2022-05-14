import 'package:family_fridge_manager/data/services/database_service.dart';
import 'package:family_fridge_manager/presentation/controllers/loading_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({Key? key}) : super(key: key);
  final DataBaseService dbService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LoadingPageController(),
        builder: (context) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('splash_view_text'.tr),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

