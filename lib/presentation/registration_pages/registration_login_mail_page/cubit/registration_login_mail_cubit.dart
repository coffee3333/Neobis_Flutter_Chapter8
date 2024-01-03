import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter8/dependencies/container/di_container.dart';
import 'package:neobis_flutter_chapter8/domain/models/registeration/registration_check_model.dart';
import 'package:neobis_flutter_chapter8/domain/use_cases/registration/registration_use_case.dart';

part 'registration_login_mail_state.dart';

class RegistrationLoginMailCubit extends Cubit<RegistrationLoginMailState> {
  RegistrationLoginMailCubit() : super(RegistrationLoginMailInitial());

  final _registrationUseCase = getIt.get<RegistrationUseCase>();

  void checkUser({required String email, required String username}) async {
    final registrationCheckModel =
        RegisterCheckModel(email: email, username: username);
    // emit(CheckUserErrorState(errorText: "error"));

    try {
      await _registrationUseCase.callChecker(registrationCheckModel);
      emit(CheckUserSuccessState());
    } catch (e) {
      emit(CheckUserErrorState(errorText: "error"));
    }
  }
}
