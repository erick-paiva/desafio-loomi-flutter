import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/custom_loader_screen/custom_loader_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/description_of_paints/description_of_paints.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/example_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/home.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/login_page/login_page.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/signup_page/signup_page.dart';

final Map<String, WidgetBuilder> routes = {
  ExampleScreen.routeName: (_) => const ExampleScreen(),
  LoginPage.routeName: (_) => LoginPage(),
  SignupPage.routeName: (_) => SignupPage(),
  Home.routeName: (_) => const Home(),
  CustomLoaderScreen.routeName: (_) => const CustomLoaderScreen(),
};
