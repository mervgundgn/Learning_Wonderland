import 'package:equatable/equatable.dart';
import 'package:learning_wonderland/data/local/app_database.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

class LoadGameLevelContent extends GameEvent {
  final GameLevel gameLevel;

  const LoadGameLevelContent({required this.gameLevel});

  @override
  List<Object?> get props => [gameLevel];
}

class SubmitAnswer extends GameEvent {
  final String selectedAnswer;

  const SubmitAnswer({required this.selectedAnswer});

  @override
  List<Object?> get props => [selectedAnswer];
}

class CompleteGameLevel extends GameEvent {
  final GameLevel gameLevel;
  final int score;
  final int stars;
  final bool isCompleted;

  const CompleteGameLevel({
    required this.gameLevel,
    required this.score,
    required this.stars,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [gameLevel, score, stars, isCompleted];
}

// Yeni event: bir sonraki soruya geçmek için
class NextQuestion extends GameEvent {
  const NextQuestion();

  @override
  List<Object?> get props => [];
}
