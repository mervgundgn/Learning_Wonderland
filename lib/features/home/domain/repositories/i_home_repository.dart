import 'dart:async';

import 'package:learning_wonderland/data/local/app_database.dart';

abstract class IHomeRepository {
  Future<void> initializeHomeData();
  Future<List<Lesson>> getLessonModules();
  Future<dynamic> getMapData();
  Future<void> updateLessonModuleStatus(int moduleId, bool isUnlocked);
  Future<void> updateGameLevelProgress(int levelId, int score, bool isCompleted);
}