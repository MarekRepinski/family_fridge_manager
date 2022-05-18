import 'package:family_fridge_manager/data/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final DataBaseService _db = Get.find();

  String getUserName(){
    if (_db.currentUser != null){
      return _db.currentUser!.name;
    }
    return 'NULL';
  }
}