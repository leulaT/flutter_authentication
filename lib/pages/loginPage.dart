import 'package:allena_tech/pages/fb_login_page.dart';
import 'package:allena_tech/pages/google_signin_page.dart';
import 'package:allena_tech/pages/register_page.dart';
import 'package:allena_tech/utils/app_strings.dart';
import 'package:allena_tech/widgets/text_with_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../services/network_helper.dart';
import '../services/secure_storage.dart';
import '../utils/api_services.dart';
import '../utils/app_color.dart';
import '../utils/app_configs.dart';
import '../widgets/buttonWidget.dart';
import '../widgets/customSliverAppBar.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/customized_text_torm_field.dart';
import '../widgets/obscure_pass_text_field.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final emailTxtFieldCont = TextEditingController();
  late final passTxtFieldCont = TextEditingController();
  // late bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up controller when the widget is removed from the widget tree.
    emailTxtFieldCont.dispose();
    passTxtFieldCont.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  storeToken({required token}) async {
    await SecureStorage.storeToken(key: 'userToken', value: token);
    // Provider.of<UserProvider>(context, listen: false)
    //     .addCurrentUser(CurrentUser(userToken: currentUser.userToken));
  }

  void signInSwagar() async {
    Map<String, String> userCredential = {
      "username": emailTxtFieldCont.text.toString(),
      "password": passTxtFieldCont.text.toString()
    };

    try {
      var data = await NetworkHelper.httpPost(
        url: ApiServices.loginUrl,
        body: userCredential,
      );

      MsgDialog.showMsgDialog(
          context: context, title: 'Registration', msg: data);
    } catch (e) {
      MsgDialog.showMsgDialog(
          context: context, title: 'Registration Failed', msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        // controller: _autoScrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(
            appBarSubTitle: AppStrings.signIntoAccount,
            appBarTitle: AppStrings.signIntoAccount,
          ),
          //Screen BreakPoint: for extra large and medium
          SliverPadding(
            padding: screenWidth >= 768
                ? EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.15,
                    vertical: screenHeight * 0.15)
                : const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (BuildContext context, int index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomizedTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textEditingController: emailTxtFieldCont,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.toString().length < 3) {
                                return 'Please enter valid name';
                              }
                              return null;
                            },
                            label: 'email',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PassObscureHandlerWidget(
                            textInputAction: TextInputAction.done,
                            controller: passTxtFieldCont,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            function: () => {
                              //make login request if valid
                              if (_formKey.currentState!.validate())
                                {signInSwagar()}
                              //todo::login logic goes here
                            },
                            text: 'Login',
                            // key: ,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Or login with',
                                style: AppConfig.kSemiBoldTxtStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, GoogleAuthentication.routeName);
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppConfig.googleLogoImgPath,
                                      height: 25,
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Google',
                                      style: AppConfig.kSemiBoldTxtStyle,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,
                                      FacebookAuthentication.routeName);
                                  //todo::implement facebook authentication here
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppConfig.fbLogoImgPath,
                                      height: 25,
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Facebook',
                                      style: AppConfig.kSemiBoldTxtStyle
                                          .copyWith(color: AppColor.kFbColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.1,
                          ),
                          RowTexBotton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegisterPage.routeName);
                            },
                            btnText: AppStrings.register,
                            detailInfo: AppStrings.dontHaveAccount,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
