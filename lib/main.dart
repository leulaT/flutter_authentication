import 'package:allena_tech/pages/fb_login_page.dart';
import 'package:allena_tech/pages/loginPage.dart';
import 'package:allena_tech/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/google_signin_page.dart';
import 'provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          // home: const GoogleAuthentication(),
          initialRoute: '/',
          routes: {
            LoginPage.routeName: (context) => const LoginPage(),
            RegisterPage.routeName: (context) => const RegisterPage(),
            GoogleAuthentication.routeName: (context) =>
                const GoogleAuthentication(),
            FacebookAuthentication.routeName: (context) =>
                const FacebookAuthentication(),
          }),
    );
  }
}
