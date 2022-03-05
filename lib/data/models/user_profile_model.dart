import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  String uid;
  String firstName;
  String lastName;
  UserType userType;

  UserProfileModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.userType,
  });

  factory UserProfileModel.fromSnapshot(DocumentSnapshot snap, String uid) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    return UserProfileModel(
        uid: uid,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        userType: UserType.values.firstWhere(
            (e) => e.toString() == data['usertype'],
            orElse: () => UserType.customer));
  }
}

enum UserType { admin, cleaner, customer }
