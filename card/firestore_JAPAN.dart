import 'package:cloud_firestore/cloud_firestore.dart';

//Mypageテーブルの定義
class JAPAN {

  String japan;





  JAPAN({

    required this.japan,






  });

  factory JAPAN.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return JAPAN(

      japan: data?['japan'],


    );
  }



  Map<String, dynamic> toFirestore() {
    return {

      "japan": japan,




    };
  }
}
