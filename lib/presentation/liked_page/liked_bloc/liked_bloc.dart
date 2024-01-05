import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'liked_bloc_event.dart';
part 'liked_bloc_state.dart';

class LikedBloc extends Bloc<LikedBlocEvent, LikedBlocState> {
  LikedBloc() : super(LikedBlocInitial()) {
    on<UpdateEvent>(updateData);
  }

  final data = [
    {
      "image": "string",
      "numberOfLikes": 0,
      "price": 0,
      "productName": "string",
      "product_id": 0
    }
  ];

  void updateData(UpdateEvent event, Emitter<LikedBlocState> emit) async {
    emit(LikedBlocLoading());
    Future.delayed(
      const Duration(seconds: 1),
    );
    emit(UpdatedState(data: data));
  }
}
