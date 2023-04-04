import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';

abstract class IGetPaintUseCase {
  Future<List<CartModel>> call();
}
