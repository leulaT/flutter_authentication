import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class RowTexBotton extends StatelessWidget {
  final VoidCallback onPressed;
  final String detailInfo;
  final String btnText;
  const RowTexBotton(
      {super.key,
      required this.onPressed,
      required this.detailInfo,
      required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(detailInfo),
        TextButton(
          onPressed: onPressed,
          child: Text(
            btnText,
            style: const TextStyle(
                color: AppColor.kBtnColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
