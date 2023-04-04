import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_signup_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/signup.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_post_signup_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/signup_response.dart';

class PostSignupUC implements IPostSignupUseCase {
  @override
  Future<SignupResponse> call({required Signup data}) async {
    return await GetIt.I.get<ISignupRepository>().postSignup(data: data);
  }
}
