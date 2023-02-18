import 'package:cloud_firestore/cloud_firestore.dart';

//Mypageテーブルの定義
class BANK {
  String id;
  String name;
  String bank;

  String sitencode;
  String kozasyu;
  String meigi;





  BANK({
    required this.id,
    required this.name,
    required this.bank,

    required this.sitencode,
    required this.kozasyu,
    required this.meigi,





  });

  factory BANK.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return BANK(
      id: data?['id'],
      name: data?['name'],
      bank: data?['bank'],
      sitencode: data?['sitencode'],
      kozasyu: data?['kozasyu'],
      meigi: data?['meigi'],




    );
  }



  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "bank": bank,

      "sitencode": sitencode,
      "kozasyu": kozasyu,
      "meigi": meigi,



    };
  }
}
