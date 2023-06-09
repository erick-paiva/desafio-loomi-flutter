import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class InputSearch extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final void Function(String) onChanged;

  const InputSearch(
      {super.key,
      this.hintText,
      this.labelText,
      this.margin,
      this.controller,
      required this.onChanged});

  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  Timer? _debounce;

  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 550),
      () {
        widget.onChanged(value);
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      margin: widget.margin ??
          const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      Labelchild: Text(widget.labelText ?? "",
          style: TextStyle(
              color: CustomColors.black10,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
      child: TextFormField(
        onChanged: (value) {
          _onSearchChanged(value);
        },
        onFieldSubmitted: (value) {
          _onSearchChanged(value);
        },
        controller: widget.controller,
        style: TextStyle(color: CustomColors.black10),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: const Icon(Icons.search, size: 30),
            border: InputBorder.none,
            hintText: widget.hintText,
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
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(margin: const EdgeInsets.only(left: 15), child: Labelchild),
          Container(
            width: double.infinity,
            height: 56,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 11),
            padding: const EdgeInsets.symmetric(
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
