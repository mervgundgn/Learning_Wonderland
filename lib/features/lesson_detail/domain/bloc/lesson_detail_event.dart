import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

abstract class LessonDetailEvent extends Equatable {
  const LessonDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadLessonGameTypes extends LessonDetailEvent {
  final int lessonId;

  const LoadLessonGameTypes({required this.lessonId});

  @override
  List<Object?> get props => [lessonId];
}
