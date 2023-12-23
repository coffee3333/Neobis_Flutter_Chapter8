import 'package:neobis_flutter_chapter8/mobi_market/domain/models/user/user_model.dart';

abstract class RegistrationRepository {
  Future<User> registerUser({
    required String email,
    required String username,
    required String password,
  });
}
