import 'package:flutter/material.dart';

import 'app_text.dart';
import 'colors.dart';
import 'grocery_item.dart';


class GroceryItemCardWidget extends StatelessWidget {
  GroceryItemCardWidget({Key? key, required this.item, required this.heroSuffix})
      : super(key: key);
  final Book item;
  final String? heroSuffix;


  final double width = 174;
  final double height = 1680;
  final Color borderColor = Color(0xffE2E2E2);
  final double borderRadius = 28;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Padding(  //枠線とのpadding
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Center(
                child: Hero(
                  tag: "GroceryItem:" + item.name + "-" + (heroSuffix ?? ""),
                  child: imageWidget(),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            AppText(
              text: item.name,
              fontSize: 12,
              fontWeight: FontWeight.bold,


            ),
            AppText(
              text: item.description,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7C7C7C),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                AppText(
                  text: "￥${item.price.toStringAsFixed(0)}",
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                ),
                Spacer(),
                addWidget()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      child: Image.asset(item.imagePath),
    );
  }

  Widget addWidget() {
    return Container(
      height: 40,
      width: 40,
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

// 表示する情報
Map movies = {
  0: {'title': '鬼滅の刃', 'box_office': '390.0'},
  1: {'title': '千と千尋の神隠し', 'box_office': '316.8'},
  2: {'title': 'タイタニック', 'box_office': '262.0'},
  3: {'title': 'アナと雪の女王', 'box_office': '255.0'},
  4: {'title': '君の名は。', 'box_office': '250.3'},
};
