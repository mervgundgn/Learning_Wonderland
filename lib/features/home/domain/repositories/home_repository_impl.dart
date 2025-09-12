import 'package:learning_wonderland/features/home/domain/repositories/i_home_repository.dart';
import 'package:learning_wonderland/features/home/data/datasources/home_local_datasource.dart';
import 'package:async/async.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<void> initializeHomeData() async {
    return Future.value(null);
  }

  @override
  Future<dynamic> getMapData() async {
    return await localDataSource.getMapData();
  }

  @override
  Future<List<dynamic>> getLessonModules() async {
    return await localDataSource.getLessonModules();
  }

  @override
  Future<void> updateLessonModuleStatus(int moduleId, bool isUnlocked) async {
    await localDataSource.updateLessonModuleStatus(moduleId, isUnlocked);
  }

  @override
  Future<void> updateGameLevelProgress(int levelId, int score, bool isCompleted) async {
    await localDataSource.updateGameLevelProgress(levelId, score, isCompleted);
  }
}