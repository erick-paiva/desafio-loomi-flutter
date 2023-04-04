import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_cart_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/cart_response.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_post_cart_uc.dart';

class PostCartUC implements IPostCartUseCase {
  @override
  Future<CartResponse> call({required CartModel data}) async {
    return await GetIt.I.get<ICartRepository>().postCart(data: data);
  }
}
