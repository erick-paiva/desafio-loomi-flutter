import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';

abstract class ISearchPaintUseCase {
  Future<List<CartModel>> call({required String search});
}
