import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class CustomSwitch extends StatefulWidget {
  final void Function(bool) onChanged;
  final bool value;

  const CustomSwitch({Key? key, required this.onChanged, required this.value})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool light = false;

  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.amber;
      }
      return null;
    },
  );

  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.amber.withOpacity(0.54);
      }
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.value,
      activeColor: CustomColors.purple50,
      overlayColor: overlayColor,
      thumbColor: const MaterialStatePropertyAll(Color(0xff5B4DA7)),
      inactiveTrackColor: CustomColors.purple50,
      onChanged: (value) {
        widget.onChanged(value);
      },
    );
  }
}
