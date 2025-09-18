import 'package:equatable/equatable.dart';
import 'package:learning_wonderland/data/local/app_database.dart'; // GameLevel modeli için

abstract class GameLevelsState extends Equatable {
  const GameLevelsState();

  @override
  List<Object?> get props => [];
}

class GameLevelsInitial extends GameLevelsState {}

class GameLevelsLoading extends GameLevelsState {}

class GameLevelsLoaded extends GameLevelsState {
  final List<GameLevel> gameLevels;

  const GameLevelsLoaded({required this.gameLevels});

  @override
  List<Object?> get props => [gameLevels];
}

class GameLevelsError extends GameLevelsState {
  final String message;

  const GameLevelsError({required this.message});

  @override
  List<Object?> get props => [message];
}
