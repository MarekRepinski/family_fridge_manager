class FridgeItem {
  final String desc;
  final DateTime bestBefore;
  final String owner;
  final String docID;
  final String? eatenBy;
  final bool promo;
  final String fridgeID;
  final String pic;

  FridgeItem({
    required this.desc,
    required this.bestBefore,
    required this.owner,
    required this.docID,
    this.eatenBy,
    required this.promo,
    required this.fridgeID,
    required this.pic,
  });
}
