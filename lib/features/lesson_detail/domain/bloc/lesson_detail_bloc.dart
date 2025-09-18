import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/features/lesson_detail/data/repositories/i_lesson_detail_repository.dart';
import 'package:learning_wonderland/features/lesson_detail/domain/bloc/lesson_detail_event.dart';
import 'package:learning_wonderland/features/lesson_detail/domain/bloc/lesson_detail_state.dart';
import 'package:learning_wonderland/data/local/app_database.dart';

class LessonDetailBloc extends Bloc<LessonDetailEvent, LessonDetailState> {
  final ILessonDetailRepository lessonDetailRepository;

  LessonDetailBloc({required this.lessonDetailRepository})
      : super(LessonDetailInitial()) {

    on<LoadLessonGameTypes>((event, emit) async {
      emit(LessonDetailLoading());

      try {
        final List<GameType> gameTypes =
        await lessonDetailRepository.getGameTypesForLesson(event.lessonId);
        emit(LessonDetailLoaded(gameTypes: gameTypes));
      } catch (e) {
        emit(LessonDetailError(message: e.toString()));
      }
    });
  }
}