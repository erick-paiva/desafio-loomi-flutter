import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class InputSearch extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? margin;

  const InputSearch({super.key, this.hintText, this.labelText, this.margin});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      Labelchild: Text(labelText ?? "",
          style: TextStyle(
              color: CustomColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
      child: TextFormField(
        style: TextStyle(color: CustomColors.white),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(Icons.search, size: 30),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: CustomColors.gray70)),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  final Widget? Labelchild;
  final EdgeInsetsGeometry? margin;
  const TextFieldContainer({
    Key? key,
    this.child,
    this.Labelchild,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin != null ? margin : EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(margin: EdgeInsets.only(left: 15), child: Labelchild),
          Container(
            width: double.infinity,
            height: 56,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 11),
            padding: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: CustomColors.white,
                border: Border.all(width: 1, color: CustomColors.gray70)),
            child: child,
          )
        ]));
  }
}
