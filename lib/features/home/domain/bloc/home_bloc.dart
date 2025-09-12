import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../repositories/i_home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      try {
        emit(HomeLoading());
        final mapData = await homeRepository.getMapData();
        final lessonModules = await homeRepository.getLessonModules();
        emit(HomeLoaded(mapData: mapData, lessonModules: lessonModules));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    });

    on<SelectLessonModule>((event, emit) async {
      // İleride ders modülü seçimi için işlemler eklenecek
    });
  }
}
