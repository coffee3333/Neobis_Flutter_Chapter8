import 'package:neobis_flutter_chapter8/mobi_market/domain/models/user/user_model.dart';
import 'package:neobis_flutter_chapter8/mobi_market/domain/repositories/registration/registration_repository.dart';

class RegistrationDataRepository implements RegistrationRepository {
  @override
  Future<User> registerUser({
    required String email,
    required String username,
    required String password,
  }) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
