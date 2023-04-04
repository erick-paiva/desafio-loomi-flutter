import 'package:loomi_flutter_boilerplate/src/external/models/signup.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/signup_response.dart';

abstract class IPostSignupUseCase {
  Future<SignupResponse> call({required Signup data});
}
