import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';

abstract class IPaintRepository {
  Future<List<CartModel>> getPaint();

  Future<List<CartModel>> searchPaint({required String search});
}
