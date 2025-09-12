import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadHomeData extends HomeEvent {}

class SelectLessonModule extends HomeEvent {
  final String moduleId;

  SelectLessonModule({required this.moduleId});

  @override
  List<Object?> get props => [moduleId];
}
