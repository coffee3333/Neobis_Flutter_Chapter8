import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter8/dependencies/container/di_container.dart';
import 'package:neobis_flutter_chapter8/domain/models/registeration/registration_model.dart';
import 'package:neobis_flutter_chapter8/domain/use_cases/registration/registration_use_case.dart';

part 'registration_password_state.dart';

class RegistrationPasswordCubit extends Cubit<RegistrationPasswordState> {
  RegistrationPasswordCubit() : super(RegistrationPasswordInitial());
  final _registrationUseCase = getIt.get<RegistrationUseCase>();

  void registerUser(
      {required String email,
      required String username,
      required String password}) async {
    final registrationModel =
        RegisterModel(email: email, username: username, password: password);

    try {
      await _registrationUseCase.call(registrationModel);
      emit(RegistrationUserSuccess());
    } catch (e) {
      print(e);
      emit(RegistrationUserError(errorText: "error"));
    }
  }
}
