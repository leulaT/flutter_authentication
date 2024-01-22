import 'package:flutter/material.dart';

class SplashPAge extends StatefulWidget {
  static const String routeName = '/SplashPage';

  const SplashPAge({super.key});

  @override
  State<SplashPAge> createState() => _SplashPAgeState();
}

class _SplashPAgeState extends State<SplashPAge> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
