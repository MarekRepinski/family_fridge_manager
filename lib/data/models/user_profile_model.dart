import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  String uid;
  String name;
  String fridgeID;
  bool owner;

  UserProfileModel({
    required this.uid,
    required this.name,
    required this.fridgeID,
    required this.owner,
  });

  factory UserProfileModel.fromSnapshot(DocumentSnapshot snap, String uid) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    return UserProfileModel(
        uid: uid,
        name: data['name'] ?? '',
        fridgeID: data['fridgeID'] ?? '',
        owner:  data['owner'] ?? false,
    );
  }
}
