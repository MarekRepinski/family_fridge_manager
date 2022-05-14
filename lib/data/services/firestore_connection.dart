import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_fridge_manager/data/models/user_profile_model.dart';

class FirestoreConnection {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference fridgeRef =
      FirebaseFirestore.instance.collection('fridges');

  Future<UserProfileModel> getUserProfileModel(String uid) async {
    var result = await userRef.doc(uid).get();
    return UserProfileModel.fromSnapshot(result, uid);
  }

  Future addUser(UserProfileModel userProfileModel) async {
    if (userProfileModel.fridgeID == '') {
      DocumentReference docRef =
          await fridgeRef.add({'timestamp': DateTime.now()});
      userProfileModel.fridgeID = docRef.id;
    }
    await userRef.doc(userProfileModel.uid).set({
      'name': userProfileModel.name,
      'fridgeID': userProfileModel.fridgeID,
      'owner': userProfileModel.owner,
    });
  }
}
