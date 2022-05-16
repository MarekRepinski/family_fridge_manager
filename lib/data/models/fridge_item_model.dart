import 'package:cloud_firestore/cloud_firestore.dart';

class FridgeItemModel {
  final String desc;
  final DateTime bestBefore;
  final String owner;
  final String docID;
  final String? eatenBy;
  final bool promo;
  final String pic;

  FridgeItemModel({
    required this.desc,
    required this.bestBefore,
    required this.owner,
    required this.docID,
    this.eatenBy,
    required this.promo,
    required this.pic,
  });

  factory FridgeItemModel.fromSnapshot(DocumentSnapshot snap, String fridgeID, String docID) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    return FridgeItemModel(
      docID: docID,
      desc: data['desc'] ?? '',
      bestBefore: data['bestBefore'].toDate() ?? DateTime.now(),
      pic: data['pic'] ?? '',
      owner: data['owner'] ?? '',
      promo:  data['promo'] ?? false,
      eatenBy:  data['eatenBy'],
    );
  }
}
