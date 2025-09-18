import 'package:learning_wonderland/data/local/app_database.dart';
import 'package:drift/drift.dart';


abstract class ILessonDetailLocalDataSource {
  Future<List<GameType>> getGameTypesForLesson(int lessonId);
}


class LessonDetailLocalDataSourceImpl implements ILessonDetailLocalDataSource {
  final AppDatabase appDatabase;


  LessonDetailLocalDataSourceImpl({required this.appDatabase});


  @override
  Future<List<GameType>> getGameTypesForLesson(int lessonId) async {
    final gameTypesData = await (appDatabase.select(appDatabase.gameTypes)
      ..where((tbl) => tbl.lessonId.equals(lessonId)))
        .get();

    return gameTypesData
        .map((e) => GameType(
      id: e.id,
      lessonId: e.lessonId,
      name: e.name,
      description: e.description,
      iconPath: e.iconPath,
      orderIndex: e.orderIndex,
    ))
        .toList();
  }
}
