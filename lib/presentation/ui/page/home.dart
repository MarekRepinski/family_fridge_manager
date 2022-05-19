import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/data/services/database_service.dart';
import 'package:family_fridge_manager/presentation/controllers/home_controller.dart';
import 'package:family_fridge_manager/presentation/ui/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _controller = Get.put(HomeController());
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
          child: Column(
            children: [
              Text('home_title'.tr + _controller.getUserName(),
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 8,
              ),
              Obx(() {
                return _db.fridgeItemList.isEmpty
                    ? Text('home_fridge_empty'.tr)
                    : GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 170,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemCount: _db.fridgeItemList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return goodsTile(index, context);
                        },
                      );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'Add stuff',
          onPressed: () {
            Get.toNamed(Pages.addFridgeItem.name);
          }),
    );
  }

  Card goodsTile(int index, context) {
    String imgThumb = 'assets/blurThumb.jpg';
    _controller.setupItemCard(index);

    return Card(
      elevation: 8.0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: _controller.itemCard.colorIntense, width: 3)),
      color: Theme.of(context).primaryColor,
      shadowColor: _controller.itemCard.color,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
          // wrapp in Opacity
          width: 150.0,
          height: 200.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 2.0),
              child: Column(
                children: [
                  FittedBox(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.contain,
                    child: _db.fridgeItemList[index].picURL == ''
                        ? Image.asset(
                            imgThumb,
                            width: 150.0,
                            height: 110.0,
                            fit: BoxFit.scaleDown,
                          )
                        : Image.network(
                            _db.fridgeItemList[index].picURL,
                            width: 150.0,
                            height: 110.0,
                            fit: BoxFit.contain,
                          ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (_controller.itemCard.margin * 2.0),
                      ),
                      Icon(
                        _controller.itemCard.icon,
                        size: 15.0,
                      ),
                      SizedBox(
                        width: _controller.itemCard.margin * 2.0,
                      ),
                      Text(
                        _controller.itemCard.desc,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
