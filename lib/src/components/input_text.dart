import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/components/text_field_container.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class InputText extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? margin;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const InputText(
      {super.key,
      this.hintText,
      this.labelText,
      this.margin,
      this.validator,
      this.keyboardType,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      margin:
          margin ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
      Labelchild: Text(labelText ?? "",
          style: TextStyle(
              color: CustomColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: TextStyle(color: CustomColors.white),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: CustomColors.white),
          fillColor: CustomColors.purple50,
          filled: true,
        ),
      ),
    );
  }
}
