import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../item/colors.dart';

import 'dashbord/auth_gate_dashbord.dart';
import 'dashbord/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  static var id;
  String iconPath = "assets/splash_precure.png";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const delay = const Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return AuthGate_dashbord/*DashboardScreen*/();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}

Widget splashScreenIcon() {
  String iconPath = "assets/images/splash_precure.png";
  return SvgPicture.asset(
    iconPath,
  );
}
