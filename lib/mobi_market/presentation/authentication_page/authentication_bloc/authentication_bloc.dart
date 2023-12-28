import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter8/mobi_market/dependencies/container/di_container.dart';
import 'package:neobis_flutter_chapter8/mobi_market/domain/models/authentication/authentication_model.dart';
import 'package:neobis_flutter_chapter8/mobi_market/domain/use_cases/authentication/authentication_use_case.dart';

part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  AuthenticationBloc() : super(AuthenticationBlocInitial()) {
    on<AuthenticationEvent>(_authenticateUser);
  }
  final authenticationUseCase = getIt.get<AuthenticationUseCase>();

  void _authenticateUser(
      AuthenticationEvent event, Emitter<AuthenticationBlocState> emit) async {
    final authenticationModel =
        AuthenticationModel(username: event.userName, password: event.password);
    try {
      await authenticationUseCase.call(authenticationModel);
      emit(AuthenticationSuccessState());
    } catch (e) {
      emit(AuthenticationErrorState(error: true, errorText: "asdasd"));
    }
  }
}
