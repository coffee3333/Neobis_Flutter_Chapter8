import 'package:neobis_flutter_chapter8/data/data_sources/authentication/models/api_authentication_user_model.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/authentication/service/service_api.dart';
import 'package:neobis_flutter_chapter8/data/mappers/user_mapper.dart';
import 'package:neobis_flutter_chapter8/domain/models/user/user_model.dart';
import 'package:neobis_flutter_chapter8/domain/repositories/authentication/authentication_repository.dart';

class AuthenticationDataRepository implements AuthenticationRepository {
  final AuthenticationServiceMobiMarketApi _service;

  AuthenticationDataRepository(this._service);

  @override
  Future<User> authUser(
      {required String username, required String password}) async {
    final userData =
        ApiAuthenticationUserModel(username: username, password: password);

    await _service.authenticationUser(user: userData);

    return UserMapper.fromApi(userData.username);
  }
}
