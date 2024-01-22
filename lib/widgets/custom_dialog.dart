import 'package:flutter/material.dart';

///informative dialog
class MsgDialog {
  static void showMsgDialog({
    required context,
    required String title,
    required String msg,
  }) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(msg),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(MsgDialog);
                  },
                  child: const Text("Ok"),
                )
              ],
            ));
  }
}
