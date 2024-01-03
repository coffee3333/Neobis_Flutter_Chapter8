import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/registration/models/api_registration_check_user_model.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/registration/models/api_registration_user_model.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/registration/registration_data_source.dart';
import 'package:neobis_flutter_chapter8/dependencies/container/di_container.dart';

class RegistrationServiceMobiMarketApi implements RegistrationDataSource {
  final dio = getIt.get<Dio>();

  @override
  Future registationUser({required ApiRegistrationUserModel user}) async {
    try {
      await dio.post(
        '/registration/register',
        data: user.toJson(),
      );
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  @override
  Future checkUser({required ApiRegistrationCheckUserModel user}) async {
    try {
      final resp = await dio.post(
        '/registration/credentialsCheck',
        data: user.toJson(),
      );
      print(resp);
    } catch (error) {
      rethrow;
    }
  }
}
