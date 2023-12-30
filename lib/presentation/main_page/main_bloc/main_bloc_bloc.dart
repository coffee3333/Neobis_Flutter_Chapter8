import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBloc() : super(MainBlocInitial()) {
    on<MainBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
