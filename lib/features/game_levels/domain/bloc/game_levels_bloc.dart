import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/features/game_levels/domain/repositories/i_game_levels_repository.dart'; // 💡 Doğru repository import edildi
import 'package:learning_wonderland/features/game_levels/domain/bloc/game_levels_event.dart';
import 'package:learning_wonderland/features/game_levels/domain/bloc/game_levels_state.dart';
import 'package:learning_wonderland/data/local/app_database.dart'; // GameLevel modeli için


class GameLevelsBloc extends Bloc<GameLevelsEvent, GameLevelsState> {
  final IGameLevelsRepository gameLevelsRepository; // 💡 Tip IGameLevelsRepository olarak düzeltildi

  GameLevelsBloc({required this.gameLevelsRepository})
      : super(GameLevelsInitial()) {
    on<LoadGameLevels>(_onLoadGameLevels);
    on<UpdateGameLevel>(_onUpdateGameLevel);
  }

  Future<void> _onLoadGameLevels(
      LoadGameLevels event, Emitter<GameLevelsState> emit) async {
    emit(GameLevelsLoading());
    try {
      final gameLevels =
      await gameLevelsRepository.getGameLevelsForGameType(event.gameTypeId);
      emit(GameLevelsLoaded(gameLevels: gameLevels));
    } catch (e) {
      emit(GameLevelsError(message: e.toString()));
    }
  }

  Future<void> _onUpdateGameLevel(
      UpdateGameLevel event, Emitter<GameLevelsState> emit) async {
    try {
      await gameLevelsRepository.updateGameLevelProgress(
          event.gameLevelId, event.score, event.starsAwarded, event.isCompleted);

      // Eğer mevcut state GameLevelsLoaded ise, seviyeleri yeniden yükle
      if (state is GameLevelsLoaded) {
        final currentState = state as GameLevelsLoaded;
        if (currentState.gameLevels.isNotEmpty) {
          final gameTypeId = currentState.gameLevels.first.gameTypeId;
          add(LoadGameLevels(gameTypeId: gameTypeId));
        }
      }
    } catch (e) {
      emit(GameLevelsError(message: e.toString()));
    }
  }
}