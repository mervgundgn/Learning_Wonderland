import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/features/app_settings/domain/repositories/i_app_settings_repository.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_event.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final IAppSettingsRepository appSettingsRepository;

  AppSettingsBloc({required this.appSettingsRepository}) : super(const AppSettingsInitial()) {
    on<LoadAppSettings>(_onLoadAppSettings);
    on<UpdateNotificationSettings>(_onUpdateNotificationSettings);
    on<SetFirstLaunchStatus>(_onSetFirstLaunchStatus);
  }

  Future<void> _onLoadAppSettings(LoadAppSettings event, Emitter<AppSettingsState> emit) async {
    emit(const AppSettingsLoading());
    try {
      final isNotificationEnabled = await appSettingsRepository.getNotificationEnabled();
      final isFirstLaunch = await appSettingsRepository.getIsFirstLaunch();
      emit(AppSettingsLoaded(
        isNotificationEnabled: isNotificationEnabled,
        isFirstLaunch: isFirstLaunch,
      ));
    } catch (e) {
      emit(AppSettingsError(message: e.toString()));
    }
  }

  Future<void> _onUpdateNotificationSettings(UpdateNotificationSettings event, Emitter<AppSettingsState> emit) async {
    try {
      await appSettingsRepository.setNotificationEnabled(event.isEnabled);

      if (state is AppSettingsLoaded) {
        emit((state as AppSettingsLoaded).copyWith(isNotificationEnabled: event.isEnabled));
      } else {
        add(const LoadAppSettings());
      }
    } catch (e) {
      emit(AppSettingsError(message: e.toString()));
    }
  }

  Future<void> _onSetFirstLaunchStatus(SetFirstLaunchStatus event, Emitter<AppSettingsState> emit) async {
    try {
      await appSettingsRepository.setIsFirstLaunch(event.isFirstLaunch);

      if (state is AppSettingsLoaded) {
        emit((state as AppSettingsLoaded).copyWith(isFirstLaunch: event.isFirstLaunch));
      } else {
        add(const LoadAppSettings());
      }
    } catch (e) {
      emit(AppSettingsError(message: e.toString()));
    }
  }
}
