import 'package:learning_wonderland/features/app_settings/data/datasources/app_settings_local_datasource.dart';
import 'package:learning_wonderland/features/app_settings/domain/repositories/i_app_settings_repository.dart';

class AppSettingsRepositoryImpl implements IAppSettingsRepository {
  final IAppSettingsLocalDataSource localDataSource;

  AppSettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> getNotificationEnabled() {
    return localDataSource.getNotificationEnabled();
  }

  @override
  Future<void> setNotificationEnabled(bool isEnabled) {
    return localDataSource.setNotificationEnabled(isEnabled);
  }

  @override
  Future<bool> getIsFirstLaunch() {
    return localDataSource.getIsFirstLaunch();
  }

  @override
  Future<void> setIsFirstLaunch(bool isFirstLaunch) {
    return localDataSource.setIsFirstLaunch(isFirstLaunch);
  }
}
