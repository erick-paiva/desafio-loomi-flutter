import 'package:loomi_flutter_boilerplate/src/external/models/login.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/login_response.dart';

abstract class ILoginRepository {
  Future<LoginResponse> getLogin({required Login data});
}
