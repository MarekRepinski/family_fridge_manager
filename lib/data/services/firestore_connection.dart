import 'dart:io';
import 'package:family_fridge_manager/data/models/fridge_item_model.dart';
import 'package:family_fridge_manager/data/models/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreConnection {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference fridgeCollection =
      FirebaseFirestore.instance.collection('fridges');
  final _fs = FirebaseStorage.instance;

  Future<UserProfileModel?> getUserProfileModel(String uid) async {
    try{
      var result = await userCollection.doc(uid).get();
      UserProfileModel user= UserProfileModel.fromSnapshot(result, uid);
      return user;
    } catch (e){
      // print(e.toString());
      return null;
    }
  }

  Future addUser(UserProfileModel userProfileModel) async {
    try{
      if (userProfileModel.fridgeID == '') {
        DocumentReference docRef =
        await fridgeCollection.add({'timestamp': DateTime.now()});
        userProfileModel.fridgeID = docRef.id;
      }
      await userCollection.doc(userProfileModel.uid).set({
        'name': userProfileModel.name,
        'fridgeID': userProfileModel.fridgeID,
        'owner': userProfileModel.owner,
      });
    } catch (e) {
      // print(e.toString());
    }
  }

  Future addNewItem(FridgeItemModel newItem, String fridgeID, String imgPath) async {
    try{
      final _picFolder = _fs.ref().child('ffm/pictures/');

      DocumentReference docRef = await fridgeCollection.doc(fridgeID).collection('goods').add({
        'desc': newItem.desc,
        'bestBefore': newItem.bestBefore,
        'owner': newItem.owner,
        'picURL': newItem.picURL,
        'eatenBy': newItem.eatenBy,
        'promo': newItem.promo,
      });

      UploadTask ulTask = _picFolder.child(docRef.id).putFile(File(imgPath));
      String dlURL = await (await ulTask).ref.getDownloadURL();

      await fridgeCollection.doc(fridgeID).collection('goods').doc(docRef.id).set({
        'picURL': dlURL,
      },
        SetOptions(merge: true),
      );
    } catch (e) {
      // print(e.toString());
    }
  }

  List<FridgeItemModel> _fridgeItemModelFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return FridgeItemModel(
        desc: data['desc'] ?? '',
        bestBefore: data['bestBefore'].toDate() ?? DateTime.now(),
        owner: data['owner'] ?? '',
        docID: document.id,
        picURL: data['picURL'] ?? '',
        promo: data['promoted'] ?? false,
      );
    }).toList();
  }

  Stream<List<FridgeItemModel>> fridgeItems(fridgeID) {
    return fridgeCollection
        .doc(fridgeID)
        .collection('goods')
        .where('eatenBy', isEqualTo: '')
        .orderBy('bestBefore')
        .snapshots()
        .map(_fridgeItemModelFromSnapshot);
  }

}
