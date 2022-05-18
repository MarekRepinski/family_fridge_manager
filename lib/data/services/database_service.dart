import 'package:family_fridge_manager/data/models/fridge_item_model.dart';
import 'package:family_fridge_manager/data/models/user_profile_model.dart';
import 'package:family_fridge_manager/data/services/authentication_manager.dart';
import 'package:family_fridge_manager/data/services/firestore_connection.dart';
import 'package:get/get.dart';

class DataBaseService extends GetxController {
  final AuthenticationManager _authenticationManager = Get.find();
  final FirestoreConnection _fs = FirestoreConnection();
  UserProfileModel? currentUser;
  List<UserProfileModel>? itemList;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> getUserProfileModel() async {
    String? id = _authenticationManager.checkLoginStatus();
    if (id != null) {
      currentUser = await _fs.getUserProfileModel(id);
    } else {
      currentUser = null;
    }
  }

  Future<void> addNewFridgeItem(
    String desc,
    double bestBefore,
    String imgPath,
  ) async {
    if(currentUser != null){
      _fs.addNewItem(
          FridgeItemModel(
              desc: desc,
              bestBefore: DateTime.now().add(Duration(days: bestBefore.toInt())),
              owner: currentUser!.uid,
              docID: '',
              eatenBy: '',
              promo: false,
              picURL: ''),
          currentUser!.fridgeID,
          imgPath);
    } else {
    }
  }
}
