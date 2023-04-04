import 'package:flutter/material.dart';

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
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(margin: const EdgeInsets.only(left: 15), child: Labelchild),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 11),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: child,
          )
        ]));
  }
}
