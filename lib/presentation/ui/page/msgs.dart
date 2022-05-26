import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/data/services/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Msgs extends StatelessWidget {
  Msgs({Key? key}) : super(key: key);

  // final MsgsController _controller = Get.put(MsgsController());
  final DataBaseService _db = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(Pages.msgs.getDisplayName),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Obx(() => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _db.msgLogsList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return msgCard(index, context);
                      })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget msgCard(int index, context) {
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
            DateFormat('yyyy-MM-dd HH:mm')
                .format(_db.msgLogsList[index].logDate),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: Text(
            _db.msgLogsList[index].userName +
                _db.msgLogsList[index].logMsg.tr + '"' +
                _db.msgLogsList[index].foodDesc + '"',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
