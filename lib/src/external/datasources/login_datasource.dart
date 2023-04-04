import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/repositories/i_login_repository.dart';
import '../models/login.dart';

part "login_datasource.g.dart";

@RestApi()
abstract class LoginDatasource implements ILoginRepository {
  factory LoginDatasource(Dio dio, {String baseUrl}) = _LoginDatasource;

  @override
  @GET("/login")
  Future<LoginResponse> getLogin({@Body() required Login data});
}
