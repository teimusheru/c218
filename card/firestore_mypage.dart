import 'package:cloud_firestore/cloud_firestore.dart';

//Mypageテーブルの定義
class Mypage {
String id;
String name;
String bio;

String denwa;
String yubin;
String adress;
String gender;
String shikaku;



  Mypage({
    required this.id,
    required this.name,
    required this.bio,

    required this.denwa,
    required this.yubin,
    required this.adress,
    required this.gender,
    required this.shikaku,



  });

  factory Mypage.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Mypage(
        id: data?['id'],
        name: data?['name'],
        bio: data?['bio'],
        denwa: data?['denwa'],
        yubin: data?['yubin'],
        adress: data?['adress'],
        gender: data?['gender'],
      shikaku: data?['shikaku'],


);
  }



  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "bio": bio,

      "denwa": denwa,
      "yubin": yubin,
      "adress": adress,
      "gender": gender,
      "shikaku": shikaku,

    };
  }
}
