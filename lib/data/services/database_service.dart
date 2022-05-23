import 'package:family_fridge_manager/data/models/fridge_item_model.dart';
import 'package:family_fridge_manager/data/models/msg_logs.dart';
import 'package:family_fridge_manager/data/models/user_profile_model.dart';
import 'package:family_fridge_manager/data/services/authentication_manager.dart';
import 'package:family_fridge_manager/data/services/firestore_connection.dart';
import 'package:get/get.dart';

class DataBaseService extends GetxController {
  final AuthenticationManager _authenticationManager = Get.find();
  final FirestoreConnection _fs = FirestoreConnection();
  UserProfileModel? currentUser;
  final fridgeItemList = <FridgeItemModel>[].obs;
  final msgLogsList = <MsgLogs>[].obs;
  RxList<String> familyMembersList = <String>[].obs;
  int currentIndex = 0;

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  void setCurrentItem(int index) {
    currentIndex = index;
  }

  Future<void> getUserProfileModel() async {
    String? id = _authenticationManager.checkLoginStatus();
    if (id != null) {
      currentUser = await _fs.getUserProfileModel(id);
      fridgeItemList.bindStream(_fs.fridgeItems(currentUser!.fridgeID));
      msgLogsList.bindStream(_fs.msgLogs(currentUser!.fridgeID));
      familyMembersList.value =
          await _fs.getFamilyMembers(currentUser!.fridgeID);
    } else {
      currentUser = null;
    }
  }

  Future<void> refreshFamilyMemberList() async {
    familyMembersList.value = await _fs.getFamilyMembers(currentUser!.fridgeID);
  }

  Future<void> addNewFridgeItem(
    String desc,
    double bestBefore,
    String imgPath,
  ) async {
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
  }

  Future<void> addNewMsgLog(String msg) async {
    await _fs.addMsgToLog(
      msg,
      currentUser!.fridgeID,
    );
  }

  Future<void> promoFood(String docID) async {
    await _fs.promoFood(
      currentUser!.fridgeID,
      docID,
    );
  }

  Future<void> eatFood(String docID, bool trash) async {
    await _fs.eatFood(
      currentUser!.uid,
      currentUser!.fridgeID,
      docID,
      trash,
    );
  }
}
