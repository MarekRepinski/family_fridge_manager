import 'dart:io';
import 'package:family_fridge_manager/data/models/fridge_item_model.dart';
import 'package:family_fridge_manager/data/models/msg_logs.dart';
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

  Future<List<String>> getFamilyMembers(fridgeID) async {
    try {
      var result = await userCollection
          .where('fridgeID', isEqualTo: fridgeID)
          .get();

      List<String> rc = [];
      for (var doc in result.docs){
        rc.add(doc['name']);
      }
      return rc;
    } catch(e){
      // print(e.toString());
      return ['error getting family'];
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
        'trashed': false,
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

  Future addMsgToLog(String msg, String userName, String foodName, String fridgeID) async {
    DocumentReference docRef = await fridgeCollection.doc(fridgeID).collection('logs').add({
      'msg': msg,
      'userName' : userName,
      'foodName' : foodName,
      'timeStamp': DateTime.now(),
    });
    return docRef.id;
  }

  Future eatFood(String uid, String fridgeID, String docID, bool trash) async {
    await fridgeCollection.doc(fridgeID).collection('goods').doc(docID).set({
      'eatenBy': uid,
      'trashed': trash,
    },
      SetOptions(merge: true),
    );
  }

  Future promoFood(String fridgeID, String docID) async {
    await fridgeCollection.doc(fridgeID).collection('goods').doc(docID).set({
      'promo': true,
    },
      SetOptions(merge: true),
    );
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
        promo: data['promo'] ?? false,
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

  List<MsgLogs> _msgLogListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return MsgLogs(
        logDate: data['timeStamp'].toDate() ?? DateTime(1891,2,15),
        logMsg: data['msg'] ?? '',
        userName: data['userName'] ?? '',
        foodDesc: data['foodDesc'] ?? '',
      );
    }).toList();
  }

  Stream<List<MsgLogs>> msgLogs(String fridgeID) {
    DateTime chkDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 14);

    return fridgeCollection
        .doc(fridgeID)
        .collection('logs')
        .where('timeStamp', isGreaterThanOrEqualTo: chkDate)
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .map(_msgLogListFromSnapshot);
  }
}
