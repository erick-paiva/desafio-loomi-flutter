import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/signup_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/repositories/i_signup_repository.dart';
import '../models/signup.dart';

part "signup_datasource.g.dart";

@RestApi()
abstract class SignupDatasource implements ISignupRepository {
  factory SignupDatasource(Dio dio, {String baseUrl}) = _SignupDatasource;

  @override
  @POST("/user")
  Future<SignupResponse> postSignup({@Body() required Signup data});
}
