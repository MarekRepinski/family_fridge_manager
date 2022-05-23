import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/data/services/database_service.dart';

// import 'package:family_fridge_manager/presentation/controllers/family_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Family extends StatelessWidget {
  Family({Key? key}) : super(key: key);

  // final FamilyController _controller = Get.put(FamilyController());
  final DataBaseService _db = Get.find();

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
                  Obx(() => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _db.familyMembersList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return familyCard(index, context);
                        })
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            tooltip: 'home_add_stuff'.tr,
            onPressed: () {
              Get.toNamed(Pages.addFamily.name);
            }),
      ),
    );
  }

  Padding familyCard(int index, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 10.0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          title: Text(
            _db.familyMembersList[index],
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
