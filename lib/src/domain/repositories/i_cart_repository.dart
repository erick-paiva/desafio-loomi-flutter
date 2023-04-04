import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/cart_response.dart';

abstract class ICartRepository {
  Future<CartResponse> postCart({required CartModel data});
}
