import 'package:loomi_flutter_boilerplate/src/presentation/usecases/login_response.dart';

import '../../external/models/login.dart';

abstract class IGetLoginUseCase {
  Future<LoginResponse> call({required Login data});
}
