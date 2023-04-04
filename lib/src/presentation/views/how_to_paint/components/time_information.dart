import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

class TimeInformation extends StatelessWidget {
  const TimeInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 77, bottom: 86),
      child: Column(
        children: [
          SvgPicture.asset(
            getAssetVectorUrl("time.svg"),
            width: 48,
            height: 48,
          ),
          const SizedBox(height: 10),
          Text("Aguarde 2 horas",
              style: TextStyle(
                  color: CustomColors.black10,
                  fontSize: 22,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
