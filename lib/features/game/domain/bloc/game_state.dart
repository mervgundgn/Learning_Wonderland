import 'package:equatable/equatable.dart';
import 'package:learning_wonderland/data/local/app_database.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object?> get props => [];
}

class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameLoaded extends GameState {
  final GameLevel gameLevel;
  final String currentQuestionContent;
  final List<String> options;
  final String? selectedAnswer;
  final bool? isCorrectAnswer;
  final int score;
  final int stars;
  final int currentQuestionIndex;
  final int totalQuestions;

  const GameLoaded({
    required this.gameLevel,
    required this.currentQuestionContent,
    required this.options,
    this.selectedAnswer,
    this.isCorrectAnswer,
    required this.score,
    required this.stars,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  List<Object?> get props => [
    gameLevel,
    currentQuestionContent,
    options,
    selectedAnswer,
    isCorrectAnswer,
    score,
    stars,
    currentQuestionIndex,
    totalQuestions,
  ];

  GameLoaded copyWith({
    GameLevel? gameLevel,
    String? currentQuestionContent,
    List<String>? options,
    String? selectedAnswer,
    bool? isCorrectAnswer,
    int? score,
    int? stars,
    int? currentQuestionIndex,
    int? totalQuestions,
  }) {
    return GameLoaded(
      gameLevel: gameLevel ?? this.gameLevel,
      currentQuestionContent: currentQuestionContent ?? this.currentQuestionContent,
      options: options ?? this.options,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      isCorrectAnswer: isCorrectAnswer ?? this.isCorrectAnswer,
      score: score ?? this.score,
      stars: stars ?? this.stars,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      totalQuestions: totalQuestions ?? this.totalQuestions,
    );
  }
}

class GameLevelCompleted extends GameState {
  final GameLevel gameLevel;
  final int finalScore;
  final int starsAwarded;

  const GameLevelCompleted({
    required this.gameLevel,
    required this.finalScore,
    required this.starsAwarded,
  });

  @override
  List<Object?> get props => [gameLevel, finalScore, starsAwarded];
}

class GameError extends GameState {
  final String message;

  const GameError({required this.message});

  @override
  List<Object?> get props => [message];
}
