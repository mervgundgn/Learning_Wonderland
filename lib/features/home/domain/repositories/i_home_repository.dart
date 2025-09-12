import 'dart:async';

abstract class IHomeRepository {
  Future<void> initializeHomeData();
  Future<List<dynamic>> getLessonModules();
  Future<dynamic> getMapData();
  Future<void> updateLessonModuleStatus(int moduleId, bool isUnlocked);
  Future<void> updateGameLevelProgress(int levelId, int score, bool isCompleted);
}