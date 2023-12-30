import 'package:neobis_flutter_chapter8/data/data_sources/authentication/models/api_authentication_user_model.dart';

abstract class AuthenticationDataSource {
  Future<void> authenticationUser({
    required ApiAuthenticationUserModel user,
  });
}
