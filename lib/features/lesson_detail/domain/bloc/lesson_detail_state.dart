import 'package:equatable/equatable.dart';
import 'package:learning_wonderland/data/local/app_database.dart';

abstract class LessonDetailState extends Equatable {
  const LessonDetailState();

  @override
  List<Object?> get props => [];
}

class LessonDetailInitial extends LessonDetailState {}

class LessonDetailLoading extends LessonDetailState {}

class LessonDetailLoaded extends LessonDetailState {
  final List<GameType> gameTypes;

  const LessonDetailLoaded({required this.gameTypes});

  @override
  List<Object?> get props => [gameTypes];
}

class LessonDetailError extends LessonDetailState {
  final String message;

  const LessonDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}