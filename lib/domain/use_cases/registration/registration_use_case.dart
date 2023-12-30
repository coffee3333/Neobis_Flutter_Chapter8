import 'package:neobis_flutter_chapter8/domain/models/registeration/registration_check_model.dart';
import 'package:neobis_flutter_chapter8/domain/models/registeration/registration_model.dart';
import 'package:neobis_flutter_chapter8/domain/repositories/registration/registration_repository.dart';

class RegistrationUseCase {
  final RegistrationRepository _repository;

  RegistrationUseCase({required RegistrationRepository repository})
      : _repository = repository;

  Future<void> callChecker(RegisterCheckModel params) {
    return _repository.checkUserNameAndMail(
      username: params.username,
      email: params.email,
    );
  }

  Future<void> call(RegisterModel params) {
    return _repository.registerUser(
      username: params.username,
      password: params.password,
      email: params.email,
    );
  }
}
