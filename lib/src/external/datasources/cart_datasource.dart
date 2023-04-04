import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_cart_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/cart_response.dart';
import 'package:retrofit/retrofit.dart';

part "cart_datasource.g.dart";

@RestApi()
abstract class CartDatasource implements ICartRepository {
  factory CartDatasource(Dio dio, {String baseUrl}) = _CartDatasource;

  @override
  @POST("/cart")
  Future<CartResponse> postCart({@Body() required CartModel data});
}
