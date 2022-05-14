import 'package:family_fridge_manager/data/services/database_service.dart';
import 'package:family_fridge_manager/presentation/ui/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final DataBaseService _db = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Family Fridge Manager'),
        actions: [
          Builder(builder: (context) {
            return TextButton.icon(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(Icons.settings),
              label: Text('null'.tr),
            );
          }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_db.currentUser!.uid.toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'Add stuff',
          onPressed: () {}
      ),
    );
  }
}
