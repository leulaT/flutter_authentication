import 'package:flutter/material.dart';

class CustomizedTextFormField extends StatelessWidget {
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final String label;
  final Widget? suffixIcon;
  final bool? passwordVisibility;
  final String? Function(String?)? validator;
  const CustomizedTextFormField({
    super.key,
    required this.textInputAction,
    required this.keyboardType,
    required this.textEditingController,
    required this.label,
    this.validator,
    this.suffixIcon,
    this.passwordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      validator: validator,
      controller: textEditingController,
      textInputAction: textInputAction,
      // validator: ,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: passwordVisibility ?? false,
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: suffixIcon ?? const Text(''),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
