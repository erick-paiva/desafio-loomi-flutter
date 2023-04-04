import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

class Information extends StatelessWidget {
  final String number;
  final String title;
  final String? img;
  final String description;

  const Information({
    super.key,
    required this.number,
    required this.title,
    this.img,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(number,
                  style: TextStyle(
                      color: CustomColors.purple,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 27),
              Text(title,
                  style: TextStyle(
                      color: CustomColors.black10,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 27),
              img != null
                  ? SvgPicture.asset(
                      getAssetVectorUrl(img!),
                      width: 24,
                      height: 24,
                    )
                  : const SizedBox(width: 27),
            ],
          ),
          const SizedBox(height: 19),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 20),
            child: Text(description,
                style: TextStyle(color: CustomColors.black10, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
