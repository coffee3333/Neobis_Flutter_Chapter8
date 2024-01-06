part of 'liked_bloc.dart';

@immutable
sealed class LikedBlocEvent {}

final class InitialEvent extends LikedBlocEvent {}

final class UpdateEvent extends LikedBlocEvent {}

final class DislikeEvent extends LikedBlocEvent {
  final int id;
  DislikeEvent({required this.id});
}
