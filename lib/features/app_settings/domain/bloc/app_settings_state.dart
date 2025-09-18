import 'package:equatable/equatable.dart';

abstract class AppSettingsState extends Equatable {
  const AppSettingsState();

  @override
  List<Object?> get props => [];
}

class AppSettingsInitial extends AppSettingsState {
  const AppSettingsInitial();
}

class AppSettingsLoading extends AppSettingsState {
  const AppSettingsLoading();
}

class AppSettingsLoaded extends AppSettingsState {
  final bool isNotificationEnabled;
  final bool isFirstLaunch;

  const AppSettingsLoaded({
    required this.isNotificationEnabled,
    required this.isFirstLaunch,
  });

  AppSettingsLoaded copyWith({
    bool? isNotificationEnabled,
    bool? isFirstLaunch,
  }) {
    return AppSettingsLoaded(
      isNotificationEnabled: isNotificationEnabled ?? this.isNotificationEnabled,
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
    );
  }

  @override
  List<Object?> get props => [isNotificationEnabled, isFirstLaunch];
}

class AppSettingsError extends AppSettingsState {
  final String message;

  const AppSettingsError({required this.message});

  @override
  List<Object?> get props => [message];
}
