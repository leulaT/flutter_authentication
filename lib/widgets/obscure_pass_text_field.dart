import 'package:flutter/material.dart';

import 'customized_text_torm_field.dart';

class PassObscureHandlerWidget extends StatefulWidget {
  final String? label;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const PassObscureHandlerWidget({
    super.key,
    this.label,
    this.textInputAction,
    required this.controller,
    // this.textInputAction,
    this.validator,
  });

  @override
  State<PassObscureHandlerWidget> createState() =>
      _PassObscureHandlerWidgetState();
}

class _PassObscureHandlerWidgetState extends State<PassObscureHandlerWidget> {
  // late final passTxtFieldCont = TextEditingController();
  late bool _obscurePassword = true;

  @override
  void dispose() {
    // passTxtFieldCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomizedTextFormField(
      // onPress: onSuffixIconpressed,
      keyboardType: TextInputType.text,
      textEditingController: widget.controller,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      label: widget.label ?? 'password',
      validator: widget.validator,
      passwordVisibility: _obscurePassword,

      suffixIcon: IconButton(
        icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          _obscurePassword = !_obscurePassword;
          setState(() {});
        },
      ),
    );
  }
}
