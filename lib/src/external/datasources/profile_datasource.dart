import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_profile_repository.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/profile_response.dart';
import 'package:retrofit/retrofit.dart';

part "profile_datasource.g.dart";

@RestApi()
abstract class ProfileDatasource implements IProfileRepository {
  factory ProfileDatasource(Dio dio, {String baseUrl}) = _ProfileDatasource;

  @override
  @GET("/profile")
  Future<ProfileResponse> getProfile();
}
