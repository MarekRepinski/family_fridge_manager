import 'package:family_fridge_manager/data/services/services.dart';
import 'package:family_fridge_manager/presentation/controllers/fridge_item_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FridgeItemDetail extends StatelessWidget {
  FridgeItemDetail({Key? key}) : super(key: key);
  final FridgeItemDetailController _controller = Get.put(FridgeItemDetailController());
  final DataBaseService _db = Get.find();


  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: _db.currentIndex);
    return PageView.builder(
      controller: _pageController,
      itemCount: _db.fridgeItemList.length,
      itemBuilder: (context, position) {
        _controller.setupItemCard(position);
        return Scaffold(
          appBar: AppBar(
            title: Text('fridge_item_detail_title'.tr,),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8.0,
              shape:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: _controller.colorWithIntense, width: 3)
              ),
              color: Theme.of(context).primaryColor,
              shadowColor: _controller.color,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  child: Column(
                    children: [
                      Flexible(
                        child: FractionallySizedBox(
                          heightFactor: 1.0,
                          child: Image.network(
                            _db.fridgeItemList[position].picURL,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Text(_db.fridgeItemList[position].desc, style: Theme.of(context).textTheme.titleMedium,),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'fridge_item_detail_best_before'.tr +
                            _db.fridgeItemList[position].bestBefore.toString().substring(0, 10) +
                            _controller.overdue,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      // Text(owner, style: Theme.of(context).textTheme.bodyText1,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //         iconSize: 30.0,
                      //         color: widget.goods.promo ? Colors.white : Colors.black,
                      //         onPressed: () {
                      //           _showPromoDialog(context,);
                      //         },
                      //         icon: Icon(Icons.notification_important)
                      //     ),
                      //     SizedBox(width: MediaQuery.of(context).size.width * 0.40,),
                      //     IconButton(
                      //         iconSize: 30.0,
                      //         onPressed: () {
                      //           _showEatDialog(context, 'Eat');
                      //         },
                      //         icon: Icon(Icons.flatware)
                      //     ),
                      //     IconButton(
                      //         iconSize: 30.0,
                      //         onPressed: () {
                      //           _showEatDialog(context, 'Trash');
                      //         },
                      //         icon: Icon(Icons.delete)
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
