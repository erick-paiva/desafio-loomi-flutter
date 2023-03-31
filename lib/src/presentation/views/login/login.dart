import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_flutter_boilerplate/src/components/input_text.dart';
import 'package:loomi_flutter_boilerplate/src/components/text_field_container.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/home.dart';
import 'package:loomi_flutter_boilerplate/src/components/input_password.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/signup/signup.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/custom_button.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/search_bar_component.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';
import '../../../utils/helpers/assets_helper.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static const routeName = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: CustomColors.purple),
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
                            color: CustomColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40, top: 84),
                  child: Text(
                    "Entrar na plataforma",
                    style: Fonts.headline1.copyWith(
                        fontSize: 22,
                        color: CustomColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InputText(labelText: "E-mail", hintText: "e-mail"),
                InputPassword(hintText: "senha", labelText: "Senha"),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, Home.routeName);
                  },
                  text: "Login",
                  expanded: true,
                  backgroundColor: CustomColors.white,
                  textStyle: TextStyle(color: CustomColors.purple),
                  width: 240,
                  height: 48,
                  padding: EdgeInsets.all(0),
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Signup.routeName);
                      },
                      child: Text(
                        "Criar conta",
                        style: TextStyle(
                            fontSize: 16, color: CustomColors.purple50),
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
