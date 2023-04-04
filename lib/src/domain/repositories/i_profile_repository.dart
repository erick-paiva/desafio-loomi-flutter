import 'package:loomi_flutter_boilerplate/src/presentation/usecases/profile_response.dart';

abstract class IProfileRepository {
  Future<ProfileResponse> getProfile();
}
