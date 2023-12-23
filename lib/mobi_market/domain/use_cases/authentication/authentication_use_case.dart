import 'package:neobis_flutter_chapter8/mobi_market/domain/models/authentication/authentication_model.dart';
import 'package:neobis_flutter_chapter8/mobi_market/domain/models/user/user_model.dart';
import 'package:neobis_flutter_chapter8/mobi_market/domain/repositories/authentication/authentication_repository.dart';

class AuthenticationUseCase {
  final AuthenticationRepository _repository;

  AuthenticationUseCase({required AuthenticationRepository repository})
      : _repository = repository;

  Future<User> call(AuthenticationModel params) {
    return _repository.authUser(
        username: params.username, password: params.password);
  }
}
