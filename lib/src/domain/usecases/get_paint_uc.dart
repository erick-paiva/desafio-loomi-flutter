import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_paint_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paint_uc.dart';

class GetPaintUC implements IGetPaintUseCase {
  @override
  Future<List<CartModel>> call() async {
    return await GetIt.I.get<IPaintRepository>().getPaint();
  }
}
