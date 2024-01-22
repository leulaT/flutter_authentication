import 'package:allena_tech/widgets/buttonWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/app_color.dart';
import '../utils/firebase_opt.dart';
import '../widgets/custom_dialog.dart';
import 'loginPage.dart';

class GoogleAuthentication extends StatefulWidget {
  static const String routeName = '/GoogleSignin';

  const GoogleAuthentication({super.key});

  @override
  State<GoogleAuthentication> createState() => _GoogleAuthenticationState();
}

class _GoogleAuthenticationState extends State<GoogleAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.kWhiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          height: 60,
          child: RoundedButton(
            text: 'Google',
            btnColor: AppColor.kBtnColor,
            function: () async {
              try {
                final UserCredential userCredential = await signInWithGoogle();
                if (context.mounted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                }
              } catch (e) {
                print(e);
                MsgDialog.showMsgDialog(
                    context: context,
                    title: 'User Authentication',
                    msg: '${e.toString()}');
              }
            },
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId: (DefaultFirebaseOptions.currentPlatform ==
                    DefaultFirebaseOptions.ios)
                ? DefaultFirebaseOptions.currentPlatform.iosClientId
                : DefaultFirebaseOptions.currentPlatform.androidClientId)
        .signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
