import 'package:family_fridge_manager/data/models/user_profile_model.dart';
import 'package:family_fridge_manager/data/services/authentication_manager.dart';
import 'package:family_fridge_manager/data/services/firestore_connection.dart';
import 'package:get/get.dart';

class DataBaseService extends GetxController {
  final AuthenticationManager _authenticationManager = Get.find();
  final FirestoreConnection _fs = Get.find();
  UserProfileModel? currentUser;
  List<UserProfileModel>? itemList;

  void changeCurrentUser(UserProfileModel upm){
    currentUser = upm;
  }

  Future<UserProfileModel?> getUserProfileModel() async {
    String? id = _authenticationManager.checkLoginStatus();
    if (id != null) {
      currentUser = await _fs.getUserProfileModel(id);
    }
    currentUser = null;
    return null;
  }
}