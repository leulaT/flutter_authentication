import 'package:allena_tech/pages/home_page.dart';
import 'package:allena_tech/utils/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../widgets/buttonWidget.dart';
import '../widgets/custom_dialog.dart';

// import 'onboarding_welcome.dart';

class FacebookAuthentication extends StatelessWidget {
  static const String routeName = '/FacebookLoginPage';

  const FacebookAuthentication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        leading: IconButton(
          color: AppColor.kWhiteColor,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: RoundedButton(
          btnColor: AppColor.kBtnColor,
          text: 'Facebook',
          function: () async {
            try {
              final UserCredential userCredential = await signInWithFacebook();
              if (context.mounted) {
                //Save user Auth detail on locally
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage(
                              loggedFrom: 'Facebook',
                            )));
              }
            } catch (e) {
              MsgDialog.showMsgDialog(
                  context: context,
                  title: 'Authentication Failed!',
                  msg: '${e.toString()}');
            }
          },
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
