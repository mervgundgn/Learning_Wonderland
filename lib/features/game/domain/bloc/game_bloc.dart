import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/data/local/app_database.dart';
import 'package:learning_wonderland/features/game_levels/domain/repositories/i_game_levels_repository.dart';
import 'package:learning_wonderland/features/game/domain/bloc/game_event.dart';
import 'package:learning_wonderland/features/game/domain/bloc/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final IGameLevelsRepository gameLevelsRepository;

  GameBloc({required this.gameLevelsRepository}) : super(GameInitial()) {
    on<LoadGameLevelContent>(_onLoadGameLevelContent);
    on<SubmitAnswer>(_onSubmitAnswer);
    on<NextQuestion>(_onNextQuestion);
    on<CompleteGameLevel>(_onCompleteGameLevel);
  }

  Future<void> _onLoadGameLevelContent(
      LoadGameLevelContent event, Emitter<GameState> emit) async {
    emit(GameLoading());
    try {
      const List<String> availableLetters = [
        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','R','S','T','U','V','Y','Z'
      ];
      final Random random = Random();

      final int totalQuestions = 5;
      final int currentQuestionIndex = 0;

      final String currentQuestionContent =
      availableLetters[random.nextInt(availableLetters.length)];

      final List<String> options = [currentQuestionContent];
      while (options.length < 4) {
        final String option = availableLetters[random.nextInt(availableLetters.length)];
        if (!options.contains(option)) options.add(option);
      }
      options.shuffle();

      emit(GameLoaded(
        gameLevel: event.gameLevel,
        currentQuestionContent: currentQuestionContent,
        options: options,
        score: 0,
        stars: 0,
        currentQuestionIndex: currentQuestionIndex,
        totalQuestions: totalQuestions,
      ));
    } catch (e) {
      emit(GameError(message: e.toString()));
    }
  }

  Future<void> _onSubmitAnswer(
      SubmitAnswer event, Emitter<GameState> emit) async {
    if (state is GameLoaded) {
      final currentState = state as GameLoaded;
      final bool isCorrect = event.selectedAnswer == currentState.currentQuestionContent;

      int newScore = currentState.score;
      int newStars = currentState.stars;
      if (isCorrect) {
        newScore += 10;
        newStars = min(newStars + 1, 3);
      }

      emit(currentState.copyWith(
        selectedAnswer: event.selectedAnswer,
        isCorrectAnswer: isCorrect,
        score: newScore,
        stars: newStars,
      ));

      // 1 saniyelik gecikmeli feedback
      Future.delayed(const Duration(seconds: 1)).then((_) {
        if (currentState.currentQuestionIndex < currentState.totalQuestions - 1) {
          add(const NextQuestion());
        } else {
          add(CompleteGameLevel(
            gameLevel: currentState.gameLevel,
            score: newScore,
            stars: newStars,
            isCompleted: true,
          ));
        }
      });
    }
  }

  Future<void> _onNextQuestion(
      NextQuestion event, Emitter<GameState> emit) async {
    if (state is GameLoaded) {
      final currentState = state as GameLoaded;
      final Random random = Random();
      const List<String> availableLetters = [
        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','R','S','T','U','V','Y','Z'
      ];

      final String currentQuestionContent =
      availableLetters[random.nextInt(availableLetters.length)];

      final List<String> options = [currentQuestionContent];
      while (options.length < 4) {
        final String option = availableLetters[random.nextInt(availableLetters.length)];
        if (!options.contains(option)) options.add(option);
      }
      options.shuffle();

      emit(currentState.copyWith(
        currentQuestionContent: currentQuestionContent,
        options: options,
        selectedAnswer: null,
        isCorrectAnswer: null,
        currentQuestionIndex: currentState.currentQuestionIndex + 1,
      ));
    }
  }

  Future<void> _onCompleteGameLevel(
      CompleteGameLevel event, Emitter<GameState> emit) async {
    try {
      await gameLevelsRepository.updateGameLevelProgress(
        event.gameLevel.id,
        event.score,
        event.stars,
        event.isCompleted,
      );

      emit(GameLevelCompleted(
        gameLevel: event.gameLevel,
        finalScore: event.score,
        starsAwarded: event.stars,
      ));
    } catch (e) {
      emit(GameError(message: e.toString()));
    }
  }
}
