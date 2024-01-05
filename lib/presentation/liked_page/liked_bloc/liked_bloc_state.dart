part of 'liked_bloc.dart';

@immutable
sealed class LikedBlocState {}

final class LikedBlocInitial extends LikedBlocState {}

final class LikedBlocLoading extends LikedBlocState {}

final class UpdatedState extends LikedBlocState {
  final List<dynamic> data;
  UpdatedState({required this.data});
}
