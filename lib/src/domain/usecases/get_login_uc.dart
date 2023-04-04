import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_login_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/login.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_login_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/login_response.dart';

class GetLoginUC implements IGetLoginUseCase {
  @override
  Future<LoginResponse> call({required Login data}) async {
    return await GetIt.I.get<ILoginRepository>().getLogin(data: data);
  }
}
