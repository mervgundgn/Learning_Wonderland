import 'package:equatable/equatable.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();

  @override
  List<Object?> get props => [];
}

class LoadAppSettings extends AppSettingsEvent {
  const LoadAppSettings();
}

class UpdateNotificationSettings extends AppSettingsEvent {
  final bool isEnabled;

  const UpdateNotificationSettings({required this.isEnabled});

  @override
  List<Object?> get props => [isEnabled];
}

class SetFirstLaunchStatus extends AppSettingsEvent {
  final bool isFirstLaunch;

  const SetFirstLaunchStatus({required this.isFirstLaunch});

  @override
  List<Object?> get props => [isFirstLaunch];
}
