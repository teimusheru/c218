
import 'package:b0110/setting/BANK/bank_hyouzi.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../0111～　メイン教科/firestore_kyoka.dart';
import '../chat/firebase_auth.dart';
import 'firestore_BANK.dart';
import 'firestore_JAPAN.dart';
import 'firestore_cats.dart';
import 'dart:developer';

import 'firestore_mypage.dart';
import 'firestore_shikaku.dart';


var now = DateTime.now();

final now1 ='${now.year}-${now.month}-${now.day}'; //2021-6-22

 DateTime todayDate = DateTime.now();
Timestamp nowTimeDate = Timestamp.fromDate(DateTime(todayDate.month));
Timestamp DateEnd = Timestamp.fromDate(DateTime.utc(todayDate.month + 1));
final String? uid = getUid();

var dateFormat = DateTime.now();
//上のときはでた　　Stringにするとくるくる

// catsテーブルへのアクセスをまとめたクラス
  class FirestoreHelper {
  // DbHelperをinstance化する
  static final FirestoreHelper instance = FirestoreHelper._createInstance();

  FirestoreHelper._createInstance();



  // catsテーブルのデータを全件取得する  1207
  selectAllCats1207() async {

    final db = FirebaseFirestore.instance;

    final snapshot =
    db.collection("users").doc("cats").collection("cats4")

/*        .where('workday', isEqualTo: now1)
        .where('ido', isEqualTo: japan)*/
        .withConverter(
      fromFirestore: Cats.fromFirestore,
      toFirestore: (Cats cats, _) => cats.toFirestore(),
    );

    final cats = await snapshot.get();
    return cats.docs;
  }
  // catsテーブルのデータを全件取得する
  selectAllCats(String? userId, String? japan) async {
    final now1 ='${now.year}-${now.month}-${now.day}'; //2021-6-22
    final db = FirebaseFirestore.instance;
    print(japan);
    final snapshot =
    db.collection("users").doc("cats").collection("cats4")
        .where('workday', isEqualTo: now1)
        .where('ido', isEqualTo: japan)
        .withConverter(
      fromFirestore: Cats.fromFirestore,
      toFirestore: (Cats cats, _) => cats.toFirestore(),
    );

    final cats = await snapshot.get();
    return cats.docs;
  }



  // catsテーブルのデータ日付データとる　　1102
  selectAllCats_day(String? userId, dateFormat,String? japan) async {

    DateTime todayDate = dateFormat;
    final now2 ='${todayDate.year}-${todayDate.month}-${todayDate.day}';

    final db = FirebaseFirestore.instance;
    final snapshot =
    db.collection("users").doc("cats").collection("cats4")
        .where('ido', isEqualTo: japan)
        .where('workday', isEqualTo: now2)

        .withConverter(
      fromFirestore: Cats.fromFirestore,
      toFirestore: (Cats cats, _) => cats.toFirestore(),
    );
    final cats = await snapshot.get();
    return cats.docs;
  }
  //0113 catsテーブルのデータを全件取得する
  selectAllkyoka() async {
    final now1 ='${now.year}-${now.month}-${now.day}'; //2021-6-22
    final db = FirebaseFirestore.instance;

    final snapshot =
    db.collection("cards")
        .withConverter(
      fromFirestore: kyoka.fromFirestore,
      toFirestore: (kyoka cats, _) => cats.toFirestore(),
    );

    final cats = await snapshot.get();
    return cats.docs;
  }
  //0119 catsテーブルのデータを全件取得する
  selectAllkyoka_kaitou(String? userId) async {
    final now1 ='${now.year}-${now.month}-${now.day}'; //2021-6-22
    final db = FirebaseFirestore.instance;

    final snapshot =
    db.collection("cards")
        .doc(userId).collection("notifications")
        .withConverter(
      fromFirestore: kyoka.fromFirestore,
      toFirestore: (kyoka cats, _) => cats.toFirestore(),
    );

    final cats = await snapshot.get();
    return cats.docs;
  }
  // catsテーブルのデータ  mapデータとる　　1102
  selectAllCats_map(String? userId, map1) async {
    DateTime todayDate = dateFormat;
    final now2 ='${todayDate.year}-${todayDate.month}-${todayDate.day}';

    final db = FirebaseFirestore.instance;
    final snapshot =
    db.collection("users").doc("cats").collection("cats4")
        .where('workday', isEqualTo: now2)
        .where('keido', isEqualTo: map1)
        .withConverter(
      fromFirestore: Cats.fromFirestore,
      toFirestore: (Cats cats, _) => cats.toFirestore(),
    );
    final cats = await snapshot.get();
    return cats.docs;
  }

// catsテーブルのデータ別日データとる 働くworktable　　1127
    BETUBI_Cats_LIST(String? userId) async {
      final db = FirebaseFirestore.instance;
      final snapshot =
      db.collection("users").doc("cats").collection("cats4")
          .where('id', isEqualTo: userId)    ///cansel_policy.dartで　固定値いれる
         /* .where("workday", isGreaterThanOrEqualTo: now1)*/
          /*.orderBy('workday', descending: true)*/

          .withConverter(
        fromFirestore: Cats.fromFirestore,
        toFirestore: (Cats cats, _) => cats.toFirestore(),
      );
      final cats = await snapshot.get();
      return cats.docs;
    }

   // _idをキーにして1件のデータを読み込む  //詳細画面shousai
    catData0114(String? userId, String? name, String? memo, String? imageURL) async {     // catsのキーはnameに変更している
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection("cards")
          .doc(userId)
          .withConverter(
        fromFirestore: kyoka.fromFirestore,
        toFirestore: (kyoka cats, _) => cats.toFirestore(),
      );
      final catdata = await docRef.get();
      final cat = catdata.data();
      return cat;
    }
    // 117_idをキーにして1件のデータを読み込む  //詳細画面shousai
    catData0117(String? userId) async {     // catsのキーはnameに変更している
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection("cards")
          .doc(userId)
          .withConverter(
        fromFirestore: kyoka.fromFirestore,
        toFirestore: (kyoka cats, _) => cats.toFirestore(),
      );
      final catdata = await docRef.get();
      final cat = catdata.data();
      return cat;
    }



    // catData0118  //詳細画面shousai
    catData0118(String? userId, String? name, String? memo, String? imageURL) async {
      // catsのキーはnameに変更している
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection("cards")
          .doc(userId)
          .collection("notifications")
          .withConverter(
        fromFirestore: kyoka.fromFirestore,
        toFirestore: (kyoka cats, _) => cats.toFirestore(),
      );
    }


// _idをキーにして1件のデータを読み込む  //詳細画面shousai
  catData(String? userId, String? name, String? memo, String? imageURL) async {     // catsのキーはnameに変更している
    final db = FirebaseFirestore.instance;
    final docRef = db
        .collection("users")
        .doc("cats")
        .collection("cats4")
        .doc(name)
        .withConverter(
      fromFirestore: Cats.fromFirestore,
      toFirestore: (Cats cats, _) => cats.toFirestore(),
    );
    final catdata = await docRef.get();
    final cat = catdata.data();
    return cat;
  }


// _idをキーにして1件のデータを読み込む  //meessage  1106
   messageData(String? userId, String? name) async {     // catsのキーはnameに変更している
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection("users")
          .doc("cats")
          .collection("cats4")
          .doc(name)
          .withConverter(
        fromFirestore: Cats.fromFirestore,
        toFirestore: (Cats cats, _) => cats.toFirestore(),
      );
      final catdata = await docRef.get();
      final cat = catdata.data();
      return cat;
    }


// _idをキーにして1件のデータを読み込む  //meessage  1109
    mypage(String? userId) async {     // catsのキーはnameに変更している
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection("cards")
          .doc(uid)
          .collection("notifications")
          .doc(uid)

          .withConverter(
        fromFirestore: Mypage.fromFirestore,
        toFirestore: (Mypage cats, _) => cats.toFirestore(),
      );
      final catdata = await docRef.get();
      final cat = catdata.data();
      return cat;
    }

    // _idをキーにして1件のデータを読み込む  //meessage  1206
    shikaku(String? userId) async {     // catsのキーはnameに変更している
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection("user2")
          .doc(uid)
          .collection("Shikaku")
          .doc(uid)

          .withConverter(
        fromFirestore: Shikaku.fromFirestore,
        toFirestore: (Shikaku cats, _) => cats.toFirestore(),
      );
      final catdata = await docRef.get();
      final cat = catdata.data();
      return cat;
    }

// _idをキーにして1件のデータを読み込む  //meessage  1125
    bank_hyouzi(String? userId) async {     // catsのキーはnameに変更している
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection("user2")
          .doc(uid)
          .collection("Bank")
          .doc(uid)

          .withConverter(
        fromFirestore: BANK.fromFirestore,
        toFirestore: (BANK cats, _) => cats.toFirestore(),
      );
      final catdata = await docRef.get();
      final cat = catdata.data();
      return cat;
    }

    // _idをキーにして1件のデータを読み込む  //japan  1206
    Japan_hyouzi(String? userId) async {     // catsのキーはnameに変更している
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection("user2")
          .doc(uid)
          .collection("Japan")
          .doc(uid)
/*.get();*/
          .withConverter(
        fromFirestore: JAPAN.fromFirestore,
        toFirestore: (JAPAN cats, _) => cats.toFirestore(),
      );
      final catdata = await docRef.get();
      final cat = catdata.data();
      return cat;
    }
    Worker_mypage(String? userId) async {
      final db = FirebaseFirestore.instance;
      final snapshot =
      db.collection("Workers")
          .doc("cats")
          .collection("cats4")
           ///cansel_policy.dartで　固定値いれる
      /* .where("workday", isGreaterThanOrEqualTo: now1)*/
      /*.orderBy('workday', descending: true)*/
          .withConverter(
        fromFirestore: Cats.fromFirestore,
        toFirestore: (Cats cats, _) => cats.toFirestore(),
      );
      final cats = await snapshot.get();
      return cats.docs;
    }

// catsテーブルへのアクセスをまとめたクラス  //meessage  1110

/*
    // LIKEテーブルのデータを全件取得する
    mypage(String userId) async {
    final db = FirebaseFirestore.instance;
    final snapshot =
    db.collection("cards")
        .doc(uid)


        .withConverter(
    fromFirestore: Mypage.fromFirestore,
    toFirestore: (Mypage cats, _) => cats.toFirestore(),
    );
    final cats = await snapshot.get();
    return cats.docs;


    }*/
// データをinsertする
  Future insert(Cats cats, String? userId) async {  // updateも同じ処理で行うことができるので、共用している
    final db = FirebaseFirestore.instance;
    final docRef = db
        .collection("users")
        .doc("cats")
        .collection("cats4")
        .doc(cats.name)
        .withConverter(
      fromFirestore: Cats.fromFirestore,
      toFirestore: (Cats cats, options) => cats.toFirestore(),
    );
    await docRef.set(cats);
  }

    // catsテーブルのデータ日付データとる　　1101 ido=1 にする
    Future update_work(String? name, String? userId) async {  // updateも同じ処理で行うことができるので、共用している
      final db = FirebaseFirestore.instance;
      return  db
   .collection('users')
          .doc("cats")
          .collection("cats4")
          .doc(name)
          .update({'ido': '1'});
    }




// データを削除する　　///1122
  Future delete_account(String? userId) {
    final db = FirebaseFirestore.instance;
    return db
        .collection("user2")
        .doc(uid)
        .delete()
        .then(
          (doc) => print("Document deleted"),
      onError: (e) => print("Error updating document $e"),
    );
  }


  //1012void main(date) { debugPrint('debug: $date'); }
}

