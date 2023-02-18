
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../../chat/current_brightness.dart';
import '../../chat/current_brightness_reverse.dart';
import '../../intro/screen.dart';
import '../../thusand1028/account_registration.dart';
import '../../thusand1028/home_page.dart';
import '../../thusand1028/widgets/custom_progress_indicator.dart';
import 'dashboard_screen.dart';
import 'notlogin_dashbordscreen.dart';

// import 'package:google_sign_in/google_sign_in.dart';



class AuthGate_dashbord extends StatelessWidget {
  AuthGate_dashbord({Key? key}) : super(key: key);
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

  // Future<void> _onSignInGoogle() async {
  //   try {
  //     final googleLogin = GoogleSignIn(scopes: [
  //       'email',
  //       'https://www.googleapis.com/auth/contacts.readonly',
  //     ]);

  //     GoogleSignInAccount? signinAccount = await googleLogin.signIn();
  //     if (signinAccount == null) return;

  //     GoogleSignInAuthentication auth = await signinAccount.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       idToken: auth.idToken,
  //       accessToken: auth.accessToken,
  //     );
  //     FirebaseAuth.instance.signInWithCredential(credential);

  //     // Navigator.of(context).pushReplacement(
  //     //     MaterialPageRoute(
  //     //       builder: (_) => PhotoListScreen(),
  //     //     )
  //     // );
  //   } catch (e) {
  //     // await showDialog(
  //     //     context: context,
  //     //     builder: (context) {
  //     //       return AlertDialog(
  //     //         title: Text('エラー'),
  //     //         content: Text(e.toString()),
  //     //       );
  //     //     }
  //     // );
  //   }
  // }

  // Future<void> _onLoginButtonPressedEvent() async {
  //   GoogleSignIn _googleSignIn = GoogleSignIn();
  //   try {
  //     GoogleSignInAccount? result = await _googleSignIn.signIn();

  //     final name = result!.displayName;
  //     final email = result.email;
  //     final password = result.id;

  //     print(result);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        statusBarIconBrightness:
        currentBrightnessReverse(Theme.of(context).colorScheme),
        statusBarBrightness: currentBrightness(Theme.of(context).colorScheme),
        statusBarColor: Colors.transparent,
      ),
    );
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // return AccountRegistration();
        // if (true) {
        if (!snapshot.hasData) {

          return intro();
          return Scaffold(
            body: SafeArea(
              child: Form(
                // key: _formKey, //validation用
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //　~中略~

                        // ここから新規追加
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _onSignInWithAnonymousUser(),
                            child: Text('登録せず利用'),
                          ),
                        ),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: ElevatedButton(
                        //     onPressed: () => _onLoginButtonPressedEvent(),
                        //     child: Text('Google'),
                        //   ),
                        // ),
                        // SizedBox(height: 10),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: ElevatedButton(
                        //     onPressed: () => _onSignInGoogle(),
                        //     child: Text('Google'),
                        //   ),
                        // ),
                        SizedBox(height: 10),
                        /*     GoogleSignInButton(
                            clientId:
                                '277870400251-aaolhktu6ilde08bn6cuhpi7q8adgr48.apps.googleusercontent.com')
                        // ここまで新規追加*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          // return const SignInScreen(providerConfigs: [
          //   EmailProviderConfiguration(),
          //   GoogleProviderConfiguration(
          //       clientId:
          //           '277870400251-aaolhktu6ilde08bn6cuhpi7q8adgr48.apps.googleusercontent.com')
          // ]);
        }
        return FutureBuilder(
          future: users.doc(snapshot.data?.uid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('問題が発生しました');
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              return DashboardScreen();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return DashboardScreen(

              );
            }
            return const Scaffold(
              body: Center(
                child: CustomProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
