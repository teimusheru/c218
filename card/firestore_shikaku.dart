import 'package:cloud_firestore/cloud_firestore.dart';

//Mypageテーブルの定義
class Shikaku {
String id;




Shikaku({
    required this.id,





  });

  factory Shikaku.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Shikaku(
        id: data?['id'],




);
  }



  Map<String, dynamic> toFirestore() {
    return {
      "id": id,



    };
  }
}
