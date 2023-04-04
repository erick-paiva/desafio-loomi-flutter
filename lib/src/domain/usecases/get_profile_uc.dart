import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_profile_repository.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_profile_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/profile_response.dart';

class GetProfileUC implements IGetProfileUseCase {
  @override
  Future<ProfileResponse> call() async {
    return await GetIt.I.get<IProfileRepository>().getProfile();
  }
}
