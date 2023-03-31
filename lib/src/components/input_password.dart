import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/components/text_field_container.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class InputPassword extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? margin;
  const InputPassword({Key? key, this.labelText, this.hintText, this.margin})
      : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      margin: widget.margin,
      Labelchild: Text(widget.labelText ?? "",
          style: TextStyle(
              color: CustomColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
      child: TextFormField(
        obscureText: _isObscureText,
        style: TextStyle(color: CustomColors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isObscureText = !_isObscureText;
                });
              },
              child: Icon(
                _isObscureText ? Icons.visibility_off : Icons.visibility,
                color: CustomColors.white,
              ),
            ),
            hintStyle: TextStyle(color: CustomColors.white)),
      ),
    );
  }
}
