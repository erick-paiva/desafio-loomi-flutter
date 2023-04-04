import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_paint_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:retrofit/retrofit.dart';

part "paint_datasource.g.dart";

@RestApi()
abstract class PaintDatasource implements IPaintRepository {
  factory PaintDatasource(Dio dio, {String baseUrl}) = _PaintDatasource;

  @override
  @GET("/paint")
  Future<List<CartModel>> getPaint();

  @override
  @GET("/paint?search={search}")
  Future<List<CartModel>> searchPaint({@Path("search") required String search});
}
