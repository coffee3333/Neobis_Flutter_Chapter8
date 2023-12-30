import 'package:neobis_flutter_chapter8/domain/models/user/user_model.dart';

abstract class AuthenticationRepository {
  Future<User> authUser({
    required String username,
    required String password,
  });
}
