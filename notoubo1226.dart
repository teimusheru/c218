// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:b0110/thusand1028/sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_maps_webservice/places.dart'  hide Location;
import 'package:location/location.dart';


import '../cat_list.dart';
import '../item/app_text.dart';
import '../main_sub.dart';
import '../screens/dashbord/auth_gate_dashbord.dart';
import 'Googlemap_omise/api_key.dart';


// Center of the Google Map
const initialPosition = LatLng(34.45270708266024, 135.3883495577179);
// Hue used by the Google Map Markers to match the theme
const _pinkHue = 350.0;
// Places API client used for Place Photos
final _placesApiClient = new GoogleMapsPlaces(apiKey: googleMapsApiKey);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const notoubo_screen());
}

class notoubo_screen extends StatelessWidget {
  const notoubo_screen({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'マップ',
      home: const HomePage(title: 'マップ'),
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({required this.title, super.key});
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child:  Center(


                child: Container(
                  child: Icon(
                    Icons.favorite_border,
                    color:  null,
                    size: 100,
                  ),
                )

            ),
          ),


          AppText(
            text:'下記ボタンから登録情報をお願いいたします。お手数をおかけしますが２分で完了いたします。',
            fontSize: 20,
            fontWeight: FontWeight.bold,


          ),


          ///  横　coloum 参考

          SizedBox(
            height: 40,
          ),
          ///住所
/*        AppText(
        text:'下記ボタンからお仕事を探してください。日付ごとにさがすことができます。',
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF7C7C7C),
        ),*/

          Row(   mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(



                onPressed: () async {                     // cardをtapしたときの処理を設定
                  await Navigator.of(context).push(   // ページ遷移をNavigatorで設定
                    MaterialPageRoute(
                      builder: (context) => SignUp(



                      ),
                    ),);




                },//ボタン
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, //ボタンの背景色
                    minimumSize: Size(40, 70)),
                child: Text(
                  '登録してみる ' ,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), // ボタンのテキストの色
                    fontSize: 22,
                  ),
                ),

              ),

            ],

          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),

    );


  }

}