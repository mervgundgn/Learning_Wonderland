import 'package:equatable/equatable.dart';
import 'package:learning_wonderland/data/local/app_database.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final dynamic mapData;
  final List<Lesson> lessonModules;

  HomeLoaded({required this.mapData, required this.lessonModules});

  @override
  List<Object?> get props => [mapData, lessonModules];
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
