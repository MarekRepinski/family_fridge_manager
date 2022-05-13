import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_fridge_manager/data/models/user_profile_model.dart';

class FirestoreConnection {
  final String uid;
  FirestoreConnection({required this.uid});

  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('users');

  Future<UserProfileModel> findUser() async {
    var result = await userRef.doc(uid).get();
    return UserProfileModel.fromSnapshot(result, uid);
  }

  Future addUser(UserProfileModel userProfileModel) async {
    if (userProfileModel.fridgeID == ''){
      // Create fridge
    }
    await userRef.doc(uid).set({
      'name': userProfileModel.name,
      'fridgeID': userProfileModel.fridgeID,
      'owner': userProfileModel.owner,
    });
  }
}
