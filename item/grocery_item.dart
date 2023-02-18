
import 'package:cloud_firestore/cloud_firestore.dart';

// catsテーブルの定義
class Book {
  int id;       //←SQLiteの時はintだったが、Firestoreでは特に使わないのでStringに変更
  String name;
  String description;
  int price;
  dynamic imagePath;
 //←SQLiteでは自動で設定されたが、Firestoreではそういう機能はなく、自力で設定する

  Book({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,

  });
// ↓公式ドキュメントを参考に、以下の処理を追加
  factory Book.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Book(
        id: data?['id'],
        name: data?['name'],
        description: data?['description'],
        price: data?['price'],
        imagePath: data?['imagePath'],
       );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "imagePath": imagePath,

    };
  }
//↑追加ここまで
// copy,fromJson,toJsonは削除
}
  final now = DateTime.now();
  //String date = DateFormat(‘yyyy-MM-dd’).format(now);


class GroceryItem {
  final int? id;
  final dynamic name;
  final String? description;
  final double? price;
  final dynamic imagePath;



  GroceryItem(
      {this.id, this.name, this.description, this.price, this.imagePath});
}




var demoItems = [
  Book(
      id: 1,
      name: "【貝塚市】住宅型有料老人ホームでパートの介護職員の募集です！4h～OK☆",
      description: "${now.month}/${now.day}, 11:00~14:00",
      price: 7600,
      imagePath: "assets/images/grocery_images/abc.png"),
  Book(
      id: 2,
      name: "【八尾市】週1日から相談OK☆残業少なめで働きやすい環境が整っています♪",
      description: "${now.month}/${now.day},  9:00~18:00",
      price: 5800,
      imagePath: "assets/images/grocery_images/kaigo1.png"),
  Book(
      id: 3,
      name: "待遇面充実◎貝塚市の介護付有料老人ホームにて介護職員の募集です！",
      description: "${now.month}/${now.day},  10:00~16:00",
      price: 4800,
      imagePath: "assets/images/grocery_images/kaigo7.jpg"),
  Book(
      id: 4,
      name: "残業少なめ♪住宅型有料老人ホームにてパートの介護職員の募集です！",
      description: "${now.month}/${now.day},  8:00~14:00",
      price: 10800,
      imagePath: "assets/images/grocery_images/kaigo2.png"),
  Book(
      id: 5,
      name: "【泉佐野市】週3日から相談OK！訪問介護事業所にてパート介護職員の募集！",
      description: "${now.month}/${now.day},  19:00~7:00",
      price: 6600,
      imagePath: "assets/images/grocery_images/kaigo8.jpg"),
  Book(
      id: 6,
      name: "【東京都】病院で正社員のケアマネージャーの募集！利用可能な託児所有◎",
      description: "${now.month}/${now.day},  11:00~14:00",
      price: 5200,
      imagePath: "assets/images/grocery_images/kaigo4.png"),
];

var exclusiveOffers = [demoItems[5], demoItems[1]];

var bestSelling = [demoItems[2], demoItems[3]];

var groceries = [demoItems[4], demoItems[1]];

var groceries1 = [demoItems[2], demoItems[5]];

var groceries2 = [demoItems[3], demoItems[5]];

var groceries3 = [demoItems[2], demoItems[4]];

var groceries4 = [demoItems[0], demoItems[2]];

var groceries5 = [demoItems[0], demoItems[3]];

var groceries6 = [demoItems[1], demoItems[0]];

var groceries7 = [demoItems[5], demoItems[0]];

var groceries8 = [demoItems[1], demoItems[4]];

var beverages = [
  GroceryItem(
      id: 7,
      name: "Dite Coke",
      description: "355ml, Price",
      price: 1.99,
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  GroceryItem(
      id: 8,
      name: "Sprite Can",
      description: "325ml, Price",
      price: 1.50,
      imagePath: "assets/images/beverages_images/sprite.png"),
  GroceryItem(
      id: 8,
      name: "Apple Juice",
      description: "2L, Price",
      price: 15.99,
      imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
  GroceryItem(
      id: 9,
      name: "Orange Juice",
      description: "2L, Price",
      price: 1.50,
      imagePath: "assets/images/beverages_images/orange_juice.png"),
  GroceryItem(
      id: 10,
      name: "Coca Cola Can",
      description: "325ml, Price",
      price: 4.99,
      imagePath: "assets/images/beverages_images/coca_cola.png"),
  GroceryItem(
      id: 11,
      name: "Pepsi Can",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/beverages_images/pepsi.png"),
];
