import 'package:neobis_flutter_chapter8/data/data_sources/registration/models/api_registration_check_user_model.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/registration/models/api_registration_user_model.dart';

abstract class RegistrationDataSource {
  Future<void> registationUser({required ApiRegistrationUserModel user});

  Future<void> checkUser({required ApiRegistrationCheckUserModel user});
}
