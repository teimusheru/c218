import 'dart:convert';
import 'dart:math';

import 'package:b0110/card/firestore_JAPAN.dart';
import 'package:b0110/syousai.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_tab_bar/indicator/custom_indicator.dart';
import 'package:intl/intl.dart';


import 'Googlemap_omise/bottmo.dart';
import 'card/firestore_cats.dart';
import 'cat_detail.dart';
import 'cat_detail_edit.dart';

import 'card/firestore_helper.dart';
import 'catlist_day.dart';  //日付ごとの
import 'chat/firebase_auth.dart';
import 'favorite/favorite_gamen.dart';
import 'item/app_text.dart';
import 'item/colors.dart';
import 'item/grocery_item.dart';
import 'item/grocery_item_card_widget.dart';
import 'main_sub.dart';
import 'map.dart';
import 'Googlemap_omise/map_1112.dart';
import 'map1116.dart';
import 'mymap1115.dart';
import 'notoubo1226.dart';


///1226 type 'String' is not a subtype of type 'int' of 'index'
///json だめだ
// catテーブルの内容全件を一覧表示するクラス
class notCatList extends StatefulWidget {






  const notCatList({Key? key,




  })
      : super(key: key);

  @override
  _CatListPageState createState() => _CatListPageState();
}

class _CatListPageState extends State<notCatList> {
  List<DocumentSnapshot> catSnapshot = [];
  List<Cats> catList = []; //catsテーブルの全件を保有する
  bool isLoading = false; //テーブル読み込み中の状態を保有する
  // static const String userId = 'test@apricotcomic.com'; //仮のユーザID。認証機能を実装したら、本物のIDに変更する。
  final String? userId = getUid();//仮のユーザID。認証機能を実装したら、本物のIDに変更する。


// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、初期処理としてCatsの全データを取得する。
  @override
  void initState() {
    super.initState();
    setState(() => isLoading = true);

    setState(() => isLoading = false);
    setState(() => isLoading = true);
    // ローカルJSONをロード


    setState(() => isLoading = false);

  }





  final double width = 484;
  final double height = 840;
  final Color borderColor = Color(0xffE2E2E2);
  final double borderRadius = 10;



  @override
  Widget build(BuildContext context) {


    CalendarAgendaController _calendarAgendaControllerAppBar =
    CalendarAgendaController();
    CalendarAgendaController _calendarAgendaControllerNotAppBar =
    CalendarAgendaController();

    DateTime _selectedDateAppBBar;
    DateTime _selectedDateNotAppBBar;

    Random random = new Random();

    final int pageCount = 4;
    late PageController _controller = PageController(initialPage: 3);
    CustomTabBarController _tabBarController = CustomTabBarController();

    @override
    void initState() {
      super.initState();
      _selectedDateAppBBar = DateTime.now();
      _selectedDateNotAppBBar = DateTime.now();
    }


    ///1023

    //  final cat = catList;
    late DateTime dateFormat;
    String? title;


    return Scaffold(

      ///tab スライド日付
      appBar: CalendarAgenda(

        controller: _calendarAgendaControllerAppBar,

        appbar: true,
        selectedDayPosition: SelectedDayPosition.left,



        weekDay: WeekDay.long,
        fullCalendarScroll: FullCalendarScroll.horizontal,
        fullCalendarDay: WeekDay.long,
        backgroundColor: Colors.grey,   //元の背景
        dateColor:Colors.white,   //選択いがいの日数

        selectedDateColor: Colors.green.shade900,  //now  日
        locale: 'ja_JP',
        initialDate: DateTime.now(),
        calendarEventColor: Colors.green,
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime.now().add(Duration(days: 180)),
        events: List.generate(
            100,
                (index) =>
                DateTime.now()
                    .subtract(Duration(days: index * random.nextInt(5)))),
        onDateSelected: (date) {
          setState(() {
            _selectedDateAppBBar = date;

            ///dateを　２０２２年１１月１日　
            setState(() {
              //dateFormat = DateFormat("yyyyMMdd").format(_selectedDateAppBBar)  ;
            });
            //debugPrint('debug: $date');  ///デバッグ確認方法1012
            //これが変数になってるのでは　1023
            debugPrint('debug: $_selectedDateAppBBar');

            /*Navigator.of(context).push(   // ページ遷移をNavigatorで設定
              MaterialPageRoute(

                builder: (context) => CatList_day(
                    dateFormat: dateFormat,
                    date: date,



                )

              ),
            );*/


          });
          //FirestoreHelper(date);


        },
        calendarLogo: Image.network(
          'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
          scale: 5.0,
        ),
        selectedDayLogo: NetworkImage(
          'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
          scale: 15.0,
        ),

      ),///


      body:

      isLoading                               //「読み込み中」だったら「グルグル」が表示される
          ? const Center(
        child: CircularProgressIndicator(),   // これが「グルグル」の処理
      )
          : SizedBox(
        /*  height: 400,*/
        child: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),



                    SizedBox(
                      height: 15,
                    ),

                    //料理
                    Text("★あなた様が必要とされています！！"),
                    getHorizontalItemSlider(groceries4),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries1),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(bestSelling),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries),
                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries7),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries1),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries),
                    SizedBox(
                      height: 15,
                    ),

                    getHorizontalItemSlider(bestSelling),
                    SizedBox(
                      height: 15,
                    ),

                    getHorizontalItemSlider(groceries),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries8),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries1),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries1),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(bestSelling),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(exclusiveOffers),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries1),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries7),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries4),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(exclusiveOffers),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries1),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries7),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries2),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries1),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries8),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries4),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries6),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries7),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(exclusiveOffers),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries4),
                    SizedBox(
                      height: 15,
                    ),
                    getHorizontalItemSlider(groceries6),
                    SizedBox(
                      height: 15,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),

      ),
      /* floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, */// <-
      /*floatingActionButton: FloatingActionButton(                   // ＋ボタンを下に表示する
        child: const Icon(Icons.flight_rounded),
        backgroundColor: Colors.orange,///language   flight_takeoff_rounded                // ボタンの形を指定
        onPressed: () async {                                       // ＋ボタンを押したときの処理を設定
          await Navigator.of(context).push(                         // ページ遷移をNavigatorで設定
            MaterialPageRoute(
                builder: (context) =>  MyApp1201() // 詳細更新画面（元ネタがないから新規登録）を表示するcat_detail_edit.dartへ遷移
            ),
          );

          initState();
          JapanData();

        },
      ),*/
    );
  }
  /* Widget imageWidget() {
    return Container(
      child: Image.asset(item.imagePath),
    );
  }*/

  Widget getHorizontalItemSlider(List<Book> items) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 230,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async { // cardをtapしたときの処理を設定
              await Navigator.of(context).push( // ページ遷移をNavigatorで設定
                MaterialPageRoute(

                  builder:


                      (context) => notoubo_screen(




                    // cardのデータの詳細を表示するcat_detail.dartへ遷移
                  ),
                ),
              );
              // getCatsList();    // データが更新されているかもしれないので、catsテーブル全件読み直し
            },
            child: GroceryItemCardWidget(
              item: items![index],
              heroSuffix: "home_screen",
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 12,
          );
        },
      ),
    );
  }
  ///
  Widget addWidget() {
    return Container(
      height: 40,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: AppColors.primaryColor),
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }

}




