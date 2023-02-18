import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../item/colors.dart';
import 'navigator_item.dart';

class notlogin_DashboardScreen extends StatefulWidget {
  @override
  _notlogin_DashboardScreenState createState() => _notlogin_DashboardScreenState();
}



class _notlogin_DashboardScreenState extends State<notlogin_DashboardScreen> {
  int currentIndex = 0;






  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: navigatorItems_not[currentIndex].screen,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 30,
                offset: Offset(0, -12)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedItemColor: Colors.black,
            items: navigatorItems_not.map((e) {
              return getNavigationBarItem(
                  label: e.label, index: e.index, iconPath: e.iconPath);
            }).toList(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getNavigationBarItem(
      {required String label, required Icon iconPath, required int index}) {
    Color iconColor =
    index == currentIndex ? AppColors.primaryColor : Colors.black;
    return BottomNavigationBarItem(
        label: label,
        icon:iconPath
      /*icon: SvgPicture.asset(
        iconPath,
        color: iconColor,
      ),*/
    );
  }
}
