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
      "price": 16000,
      "productName": "BMW M4 Coupe: A Two-Door",
      "product_id": 1
    },
    {
      "image": "string",
      "numberOfLikes": 0,
      "price": 20000,
      "productName": "BMW M4 Coupe: A Two-Door",
      "product_id": 2
    },
    {
      "image": "string",
      "numberOfLikes": 0,
      "price": 86000,
      "productName": "BMW M4 Coupe: A Two-Door",
      "product_id": 3
    },
    {
      "image": "string",
      "numberOfLikes": 0,
      "price": 23000,
      "productName": "BMW M4 Coupe: A Two-Door",
      "product_id": 4
    },
  ];

  void updateData(UpdateEvent event, Emitter<LikedBlocState> emit) async {
    emit(LikedBlocLoading());
    await Future.delayed(
      const Duration(seconds: 2),
    );

    emit(UpdatedState(data: data));
    // emit(LikedBlocInitial());
  }
}
