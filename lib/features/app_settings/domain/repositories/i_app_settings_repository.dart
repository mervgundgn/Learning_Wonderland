abstract class IAppSettingsRepository {
  Future<bool> getNotificationEnabled();
  Future<void> setNotificationEnabled(bool isEnabled);
  Future<bool> getIsFirstLaunch();
  Future<void> setIsFirstLaunch(bool isFirstLaunch);
}