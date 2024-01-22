import 'package:allena_tech/pages/loginPage.dart';
import 'package:allena_tech/services/network_helper.dart';
import 'package:allena_tech/utils/api_services.dart';
import 'package:allena_tech/utils/app_configs.dart';
import 'package:allena_tech/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/buttonWidget.dart';
import '../widgets/customSliverAppBar.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/customized_text_torm_field.dart';
import '../widgets/obscure_pass_text_field.dart';
import '../widgets/text_with_btn.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/RegisterPage';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late final emailTxtFieldCont = TextEditingController();
  late final passTxtFieldCont = TextEditingController();
  late final passConfirmeTxtFieldCont = TextEditingController();
  late final nameTxtFieldCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up controller when the widget is removed from the widget tree.
    emailTxtFieldCont.dispose();
    passConfirmeTxtFieldCont.dispose();
    nameTxtFieldCont.dispose();
    passTxtFieldCont.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // Start listening to changes.
    // emailTxtFieldCont.addListener();
    // passTxtFieldCont.addListener();
    // passConfirmeTxtFieldCont.addListener();
    // nameTxtFieldCont.addListener();
    super.initState();
  }

  void registerNewUser() async {
    var user = User(
        confirmPassword: passConfirmeTxtFieldCont.text,
        email: emailTxtFieldCont.text,
        firstName: nameTxtFieldCont.text,
        lastName: '',
        password: passTxtFieldCont.text);

    try {
      var data = await NetworkHelper.httpPost(
        url: ApiServices.registerUrl,
        // headers: {},
        body: user.toJson(),
      );
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
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            appBarSubTitle: AppStrings.createAccount,
            appBarTitle: AppStrings.register,
            iconWidget: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPress: () => Navigator.pop(context),
          ),
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
                          CustomizedTextFormField(
                            keyboardType: TextInputType.text,
                            textEditingController: nameTxtFieldCont,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.toString().length < 3) {
                                return 'Please enter valid name';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            label: 'name',
                          ),
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
                                  value.toString().length < 5 ||
                                  !(value.characters.contains('@'))) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            label: 'email',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PassObscureHandlerWidget(
                            controller: passTxtFieldCont,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PassObscureHandlerWidget(
                            label: 'confirm-password',
                            controller: passConfirmeTxtFieldCont,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            function: () {
                              if (_formKey.currentState!.validate()) {
                                registerNewUser();
                              }

                              //incase form is invalid
                              // registerNewUser(body:User.toJ)
                            },
                            text: 'Register',
                            // key: ,
                          ),
                          SizedBox(
                            height: screenHeight * 0.1,
                          ),
                          RowTexBotton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginPage.routeName);
                            },
                            btnText: AppStrings.login,
                            detailInfo: AppStrings.iHaveAcount,
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
