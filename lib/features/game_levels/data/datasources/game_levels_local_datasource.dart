import 'package:drift/drift.dart';
import 'package:learning_wonderland/data/local/app_database.dart';

abstract class IGameLevelsLocalDataSource {
  Future<List<GameLevel>> getGameLevelsForGameType(int gameTypeId);
  Future<void> updateGameLevelProgress(
      int gameLevelId, int score, int starsAwarded, bool isCompleted);
}

class GameLevelsLocalDataSourceImpl implements IGameLevelsLocalDataSource {
  final AppDatabase appDatabase;

  GameLevelsLocalDataSourceImpl({required this.appDatabase});

  @override
  Future<List<GameLevel>> getGameLevelsForGameType(int gameTypeId) async {
    return await (appDatabase.select(appDatabase.gameLevels)
      ..where((tbl) => tbl.gameTypeId.equals(gameTypeId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.levelNumber)]))
        .get();
  }

  @override
  Future<void> updateGameLevelProgress(
      int gameLevelId, int score, int starsAwarded, bool isCompleted) async {
    await (appDatabase.update(appDatabase.gameLevels)
      ..where((tbl) => tbl.id.equals(gameLevelId)))
        .write(GameLevelsCompanion(
      score: Value(score),
      starsAwarded: Value(starsAwarded),
      isCompleted: Value(isCompleted),
    ));
  }
}