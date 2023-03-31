import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_flutter_boilerplate/src/components/input_text.dart';
import 'package:loomi_flutter_boilerplate/src/components/text_field_container.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/home.dart';
import 'package:loomi_flutter_boilerplate/src/components/input_password.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/login/login.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/signup/signup.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/custom_button.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/search_bar_component.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  static const routeName = "signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.purple,
        body: Center(
            child: Container(
                child: SingleChildScrollView(
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  getAssetVectorUrl(
                    "bucket-and-paint.svg",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 11),
                  child: Text(
                    "SóTintas",
                    style: Fonts.headline1.copyWith(
                        color: CustomColors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40, top: 84),
              child: Text(
                "Criar conta",
                style: Fonts.headline1.copyWith(
                    fontSize: 22,
                    color: CustomColors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            InputText(
                labelText: "Nome",
                hintText: "nome",
                margin: EdgeInsets.symmetric(horizontal: 20)),
            InputText(
                labelText: "E-mail",
                hintText: "e-mail",
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 17)),
            InputPassword(hintText: "senha", labelText: "Senha"),
            InputPassword(
                hintText: "confirmar senha",
                labelText: "Confirmar senha",
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 17)),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, Login.routeName);
              },
              text: "Criar conta",
              expanded: true,
              backgroundColor: CustomColors.white,
              textStyle: TextStyle(color: CustomColors.purple),
              width: 240,
              height: 48,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
            ),
          ],
        )))));
  }
}
