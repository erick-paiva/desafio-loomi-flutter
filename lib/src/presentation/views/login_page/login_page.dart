import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/components/input_password.dart';
import 'package:loomi_flutter_boilerplate/src/components/input_text.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/login.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_login_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/home.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/signup_page/signup_page.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/custom_button.dart';
import 'package:loomi_flutter_boilerplate/src/utils/authentication.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';
import 'package:loomi_flutter_boilerplate/src/utils/validators.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void whenToConnect() async {
    var response = await GetIt.I.get<IGetLoginUseCase>()(
        data: Login(
            email: _emailController.text, password: _passwordController.text));

    Authentication.saveToken(response.accessToken);

    Navigator.pushNamed(context, Home.routeName, arguments: response.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
          decoration: BoxDecoration(color: CustomColors.purple),
          height: double.infinity,
          alignment: Alignment.center,
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
                InputText(
                  labelText: "E-mail",
                  hintText: "e-mail",
                  controller: _emailController,
                  validator: Validators.emailValidator(),
                  keyboardType: TextInputType.emailAddress,
                ),
                InputPassword(
                  hintText: "senha",
                  labelText: "Senha",
                  controller: _passwordController,
                  validator: Validators.passwordValidator(),
                ),
                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      whenToConnect();
                    }
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
                        Navigator.pushNamed(context, SignupPage.routeName);
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
            ),
          )),
    ));
  }
}
