import 'package:neobis_flutter_chapter8/data/data_sources/registration/models/api_registration_check_user_model.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/registration/models/api_registration_user_model.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/registration/service/service_api.dart';
import 'package:neobis_flutter_chapter8/domain/repositories/registration/registration_repository.dart';

class RegistrationDataRepository implements RegistrationRepository {
  final RegistrationServiceMobiMarketApi _service;
  RegistrationDataRepository(this._service);

  @override
  Future<void> registerUser({
    required String email,
    required String username,
    required String password,
  }) async {
    final userData = ApiRegistrationUserModel(
        email: email, username: username, password: password);

    await _service.registationUser(user: userData);
  }

  @override
  Future<void> checkUserNameAndMail(
      {required String email, required String username}) async {
    final userData =
        ApiRegistrationCheckUserModel(username: username, email: email);

    await _service.checkUser(user: userData);
  }
}
