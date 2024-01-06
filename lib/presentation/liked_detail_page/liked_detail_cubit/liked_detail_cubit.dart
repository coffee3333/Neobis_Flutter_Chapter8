import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'liked_detail_state.dart';

class LikedDetailCubit extends Cubit<LikedDetailState> {
  LikedDetailCubit() : super(LikedDetailInitial());
}
