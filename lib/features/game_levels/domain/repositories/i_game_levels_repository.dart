import 'package:learning_wonderland/data/local/app_database.dart'; // GameLevel modeli için

abstract class IGameLevelsRepository {
  Future<List<GameLevel>> getGameLevelsForGameType(int gameTypeId);
  Future<void> updateGameLevelProgress(
      int gameLevelId, int score, int starsAwarded, bool isCompleted);
}