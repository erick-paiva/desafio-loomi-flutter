import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/components/input_text.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/signup.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_post_signup_uc.dart';
import 'package:loomi_flutter_boilerplate/src/components/input_password.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/login_page/login_page.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/custom_button.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';
import 'package:loomi_flutter_boilerplate/src/utils/validators.dart';

class SignupPage extends StatefulWidget {
  static const routeName = "signup";

  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void whenToRegister() async {
    var response = await GetIt.I.get<IPostSignupUseCase>()(
        data: Signup(
            email: _emailController.text,
            name: _nameController.text,
            password: _passwordController.text));

    Navigator.pushNamed(context, LoginPage.routeName,
        arguments: response.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.purple,
        body: Form(
          key: _formKey,
          child: Center(
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
                    margin: const EdgeInsets.only(left: 11),
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
                margin: const EdgeInsets.only(bottom: 40, top: 84),
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
                  controller: _nameController,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  validator: Validators.requiredValidator(attribute: "nome")),
              InputText(
                  labelText: "E-mail",
                  hintText: "e-mail",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                  validator: Validators.emailValidator()),
              InputPassword(
                  hintText: "senha",
                  labelText: "Senha",
                  validator: Validators.passwordValidator(),
                  controller: _passwordController),
              InputPassword(
                  hintText: "confirmar senha",
                  labelText: "Confirmar senha",
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                  validator: (value) => Validators.confirmPasswordValidator(
                      _passwordController.text, value!),
                  controller: _confirmPasswordController),
              CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    whenToRegister();
                  }
                },
                text: "Criar conta",
                expanded: true,
                backgroundColor: CustomColors.white,
                textStyle: TextStyle(color: CustomColors.purple),
                width: 240,
                height: 48,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 40, bottom: 20),
              ),
            ],
          ))),
        ));
  }
}
