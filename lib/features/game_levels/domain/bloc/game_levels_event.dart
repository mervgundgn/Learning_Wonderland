import 'package:equatable/equatable.dart';

abstract class GameLevelsEvent extends Equatable {
  const GameLevelsEvent();

  @override
  List<Object?> get props => [];
}

class LoadGameLevels extends GameLevelsEvent {
  final int gameTypeId;

  const LoadGameLevels({required this.gameTypeId});

  @override
  List<Object?> get props => [gameTypeId];
}

class UpdateGameLevel extends GameLevelsEvent {
  final int gameLevelId;
  final int score;
  final int starsAwarded;
  final bool isCompleted;

  const UpdateGameLevel({
    required this.gameLevelId,
    required this.score,
    required this.starsAwarded,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [gameLevelId, score, starsAwarded, isCompleted];
}
