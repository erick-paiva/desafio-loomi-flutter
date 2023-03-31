import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/custom_loader_screen/custom_loader_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/description_of_paints/description_of_paints.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/example_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/home/home.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/login/login.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/signup/signup.dart';

final Map<String, WidgetBuilder> routes = {
  ExampleScreen.routeName: (_) => const ExampleScreen(),
  Login.routeName: (_) => const Login(),
  Signup.routeName: (_) => const Signup(),
  Home.routeName: (_) => const Home(),
  CustomLoaderScreen.routeName: (_) => const CustomLoaderScreen(),
};
