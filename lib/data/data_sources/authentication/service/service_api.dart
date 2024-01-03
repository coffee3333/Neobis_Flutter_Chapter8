import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/authentication/authentication_data_source.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/authentication/models/api_authentication_user_model.dart';
import 'package:neobis_flutter_chapter8/dependencies/container/di_container.dart';

class AuthenticationServiceMobiMarketApi implements AuthenticationDataSource {
  @override
  Future<void> authenticationUser({
    required ApiAuthenticationUserModel user,
  }) async {
    try {
      await getIt.get<Dio>().post(
            '/registration/log',
            data: user.toJson(),
          );
    } catch (error) {
      rethrow;
    }
  }
}
