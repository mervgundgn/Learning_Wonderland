import 'dart:async';
import 'package:learning_wonderland/data/local/app_database.dart';
import 'package:drift/drift.dart';

abstract class IHomeLocalDataSource {
  Future<dynamic> getMapData();
  Future<List<dynamic>> getLessonModules();
  Future<void> updateLessonModuleStatus(int moduleId, bool isUnlocked);
  Future<void> updateGameLevelProgress(int levelId, int score, bool isCompleted);
}

class HomeLocalDataSourceImpl implements IHomeLocalDataSource {
  final AppDatabase appDatabase;

  HomeLocalDataSourceImpl({required this.appDatabase});

  @override
  Future<dynamic> getMapData() async {
    final lessons = await appDatabase.select(appDatabase.lessons).get();
    if (lessons.isNotEmpty) {
      return {'mapImageUrl': 'assets/images/backgrounds/bacground_map.png'};
    }
    return {};
  }

  @override
  Future<List<dynamic>> getLessonModules() async {
    return await appDatabase.select(appDatabase.lessons).get();
  }

  @override
  Future<void> updateLessonModuleStatus(int moduleId, bool isUnlocked) async {
    await (appDatabase.update(appDatabase.lessons)
      ..where((tbl) => tbl.id.equals(moduleId)))
        .write(LessonsCompanion(isUnlocked: Value(isUnlocked)));
  }

  @override
  Future<void> updateGameLevelProgress(int levelId, int score, bool isCompleted) async {
    await (appDatabase.update(appDatabase.gameLevels)
      ..where((tbl) => tbl.id.equals(levelId)))
        .write(GameLevelsCompanion(
      score: Value(score),
      isCompleted: Value(isCompleted),
    ));
  }
}
