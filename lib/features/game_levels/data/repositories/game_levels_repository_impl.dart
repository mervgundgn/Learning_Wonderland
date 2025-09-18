import 'package:learning_wonderland/features/game_levels/data/datasources/game_levels_local_datasource.dart'
as local_ds; // Alias kullanarak isim çakışmasını önleriz
import 'package:learning_wonderland/features/game_levels/domain/repositories/i_game_levels_repository.dart';
import 'package:learning_wonderland/data/local/app_database.dart'; // GameLevel modeli için

class GameLevelsRepositoryImpl implements IGameLevelsRepository {
  final local_ds.IGameLevelsLocalDataSource localDataSource;

  GameLevelsRepositoryImpl({required this.localDataSource});

  @override
  Future<List<GameLevel>> getGameLevelsForGameType(int gameTypeId) async {
    return await localDataSource.getGameLevelsForGameType(gameTypeId);
  }

  @override
  Future<void> updateGameLevelProgress(
      int gameLevelId, int score, int starsAwarded, bool isCompleted) async {
    await localDataSource.updateGameLevelProgress(
        gameLevelId, score, starsAwarded, isCompleted);
  }
}