import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/src/user.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';


import '../../0110~投稿/１_camera.dart';
import '../../0111～　メイン教科/112 退避.dart';
import '../../0111～　メイン教科/113 camera画面.dart';
import '../../0111～　メイン教科/mein_kyouka.dart';
import '../../Googlemap_omise/map_1112.dart';
import '../../cat_list.dart';
import '../../chat/chat1.dart';
import '../../chat/firebase_auth.dart';
import '../../chat_firebase/main.dart';
import '../../favorite/favorite1020.dart';
import '../../favorite/favorite_gamen.dart';
import '../../main_sub.dart';
import '../../notlogin1226.dart';
import '../../popup_login/popup_screen.dart';
import '../../post1207/Q_kensaku1207.dart';
import '../../post1207/ken_day1208.dart';
import '../../post1207/post_page.dart';
import '../../recipe/my_account/my_account_page.dart';
import '../../setting/screen.dart';
import '../../thusand1028/auth_gate.dart';
import '../../thusand1028/sign_in.dart';
import '../../thusand1028/sign_up.dart';
import '../../work/work_auth.dart';
import '../../work/work_screen.dart';
import '../account/account_screen.dart';
import 'dashboard_screen.dart';


bool _loading = false; //テーブル読み込み中の状態を保有する
// static const String userId = 'test@apricotcomic.com'; //仮のユーザID。認証機能を実装したら、本物のIDに変更する。
final String? uid = getUid();//仮のユーザID。認証機能を実装したら、本物のIDに変更する。


class NavigatorItem {
  final String label;
  final Icon iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}




/*void scoreCalculator({int? score}) {
  switch (score) {
    case 3:
      a1=MyApp1;
      break;
    case 2:
      print('B判定');
      break;
    case 1:
      print('C判定');
      break;
  }
}*/
/*class DatabaseHelper{

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future _onSignInWithAnonymousUser() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signInAnonymously();

      return DashboardScreen(

      );
    } catch (e) {
      // await showsnac(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: Text('エラー'),
      //         content: Text(e.toString()),
      //       );
      //     });
    }
  }
}*/

  List<NavigatorItem> navigatorItems = [
    NavigatorItem("ホーム", Icon(
      Icons.cottage_outlined ,
      //color: Colors.pink,
      size: 26.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ), 0, ItemList()),
    NavigatorItem(
        "マップ", Icon(
      Icons.place_outlined,
     // color: Colors.pink,
      size: 26.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ), 1, camera0113()),
    NavigatorItem(
        "検索", Icon(
      Icons.add_circle_rounded,
       color: Colors.pink,
      size: 46.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ), 1, ken_day(title: '',)),
    NavigatorItem("案件",
        Icon(
      Icons.work_history_outlined ,
      //color: Colors.pink,
      size: 26.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ), 2,
       /* ChatPage(cardId: '', room:room )),*/
        CatList_work()),
    NavigatorItem(
        "マイページ", Icon(
      Icons.account_circle_outlined,
     // color: Colors.pink,
      size: 28.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ), 3, MyApp_setting()),
  ];


List<NavigatorItem> navigatorItems_not = [
  NavigatorItem("ホーム", Icon(
    Icons.cottage_outlined ,
    //color: Colors.pink,
    size: 26.0,
    semanticLabel: 'Text to announce in accessibility modes',
  ), 0, notCatList()),
  NavigatorItem(
      "フォロー", Icon(
    Icons.place_outlined,
    // color: Colors.pink,
    size: 26.0,
    semanticLabel: 'Text to announce in accessibility modes',
  ), 1, SignUp()),
  NavigatorItem(
      "", Icon(
    Icons.add_circle_rounded,
    color: Colors.pink,
    size: 46.0,
    semanticLabel: 'Text to announce in accessibility modes',
  ), 1, SignUp()),
  NavigatorItem("案件",
      Icon(
        Icons.work_history_outlined ,
        //color: Colors.pink,
        size: 26.0,
        semanticLabel: 'Text to announce in accessibility modes',
      ), 2,
      /* ChatPage(cardId: '', room:room )),*/
      SignUp()),
  NavigatorItem(
      "マイページ", Icon(
    Icons.account_circle_outlined,
    // color: Colors.pink,
    size: 26.0,
    semanticLabel: 'Text to announce in accessibility modes',
  ), 3, MyApp_setting()),
];
/*
List<NavigatorItem> navigatorItems_not = [
  NavigatorItem("Shop", Icon(
    Icons.favorite,
    color: Colors.pink,
    size: 26.0,
    semanticLabel: 'Text to announce in accessibility modes',
  ), 0, MyApp1()),
  NavigatorItem(
      "Explore", Icon(
    Icons.favorite,
    color: Colors.pink,
    size: 26.0,
    semanticLabel: 'Text to announce in accessibility modes',
  ), 1, SignIn()),
  NavigatorItem("Cart", Icon(
    Icons.favorite,
    color: Colors.pink,
    size: 26.0,
    semanticLabel: 'Text to announce in accessibility modes',
  ), 2,
      */
/* ChatPage(cardId: '', room:room )),*//*

      SignIn()),
  NavigatorItem(
      "Account", Icon(
    Icons.favorite,
    color: Colors.pink,
    size: 26.0,
    semanticLabel: 'Text to announce in accessibility modes',
  ), 3, MyApp_setting()),
];*/
