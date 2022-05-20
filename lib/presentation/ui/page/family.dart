import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Family extends StatelessWidget {
  const Family({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(Pages.family.getDisplayName),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('family_headline'.tr,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('family_sub_headline'.tr,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 8,
                  ),
                  // ListView.builder(
                  //   physics: BouncingScrollPhysics(),
                  //   itemBuilder: itemBuilder,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
