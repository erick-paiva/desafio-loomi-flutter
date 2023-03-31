import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/components/text_field_container.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class InputText extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? margin;

  const InputText({super.key, this.hintText, this.labelText, this.margin});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 20, vertical: 21),
      Labelchild: Text(labelText ?? "",
          style: TextStyle(
              color: CustomColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
      child: TextFormField(
        style: TextStyle(color: CustomColors.white),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: CustomColors.white)),
      ),
    );
  }
}
