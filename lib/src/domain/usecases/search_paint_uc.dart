import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_paint_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_search_paint_uc.dart';

class SearchPaintUC implements ISearchPaintUseCase {
  @override
  Future<List<CartModel>> call({required String search}) async {
    return await GetIt.I.get<IPaintRepository>().searchPaint(search: search);
  }
}
