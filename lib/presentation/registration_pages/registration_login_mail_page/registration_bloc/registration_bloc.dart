import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
// import 'package:neobis_flutter_chapter8/dependencies/container/di_container.dart';
// import 'package:neobis_flutter_chapter8/domain/models/registeration/registration_check_model.dart';
// import 'package:neobis_flutter_chapter8/domain/use_cases/registration/registration_use_case.dart';

part 'registration_bloc_event.dart';
part 'registration_bloc_state.dart';

class RegistrationBloc
    extends Bloc<RegistrationBlocEvent, RegistrationBlocState> {
  RegistrationBloc() : super(RegistrationBlocInitial()) {
    on<MailAndUsernameCheckEvent>(_checkUserNameAndMail);
  }
  // late RegisterCheckModel _registrationCheckModel;
  // final _registrationUseCase = getIt.get<RegistrationUseCase>();

  void _checkUserNameAndMail(MailAndUsernameCheckEvent event,
      Emitter<RegistrationBlocState> emit) async {
    // final registrationCheckModel =
    //     RegisterCheckModel(email: event.email, username: event.userName);
    emit(CheckUserNameAndMailSuccessState());

    // try {
    //   await _registrationUseCase.callChecker(registrationCheckModel);
    //   emit(CheckUserNameAndMailSuccessState());
    // } catch (e) {
    //   print(e);
    //   emit(CheckUserNameAndMailErrorState(errorText: "error"));
    // }
  }
}
