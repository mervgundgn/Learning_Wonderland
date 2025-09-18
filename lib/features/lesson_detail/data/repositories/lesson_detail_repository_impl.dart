import 'package:learning_wonderland/features/lesson_detail/data/datasources/lesson_detail_local_datasource.dart';
import 'package:learning_wonderland/features/lesson_detail/data/repositories/i_lesson_detail_repository.dart';
import 'package:learning_wonderland/data/local/app_database.dart';

class LessonDetailRepositoryImpl implements ILessonDetailRepository {
  final ILessonDetailLocalDataSource localDataSource;

  LessonDetailRepositoryImpl({required this.localDataSource});

  @override
  Future<List<GameType>> getGameTypesForLesson(int lessonId) {

    return localDataSource.getGameTypesForLesson(lessonId);
  }
}