import 'package:learning_wonderland/data/local/app_database.dart';

abstract class ILessonDetailRepository {
Future<List<GameType>> getGameTypesForLesson(int lessonId);

}