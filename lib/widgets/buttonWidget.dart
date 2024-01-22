import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback function;
  final Color? btnColor;
  final Color? txtColor;
  final String? imagePath;

  const RoundedButton(
      {super.key,
      this.imagePath,
      this.text,
      required this.function,
      this.btnColor,
      this.txtColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: btnColor ?? AppColor.kBtnColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text ?? 'Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                    // fontSize: con.maxHeight * 0.5,
                    fontSize: 20,
                    color: txtColor ?? Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
