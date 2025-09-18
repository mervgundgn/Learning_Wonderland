import 'package:shared_preferences/shared_preferences.dart';

abstract class IAppSettingsLocalDataSource {
  Future<bool> getNotificationEnabled();
  Future<void> setNotificationEnabled(bool isEnabled);
  Future<bool> getIsFirstLaunch();
  Future<void> setIsFirstLaunch(bool isFirstLaunch);
}

class AppSettingsLocalDataSourceImpl implements IAppSettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  AppSettingsLocalDataSourceImpl({required this.sharedPreferences});

  static const String _keyNotificationEnabled = 'notification_enabled';
  static const String _keyIsFirstLaunch = 'is_first_launch';

  @override
  Future<bool> getNotificationEnabled() async {
    return sharedPreferences.getBool(_keyNotificationEnabled) ?? true; // Varsayılan olarak açık
  }

  @override
  Future<void> setNotificationEnabled(bool isEnabled) async {
    await sharedPreferences.setBool(_keyNotificationEnabled, isEnabled);
  }

  @override
  Future<bool> getIsFirstLaunch() async {
    return sharedPreferences.getBool(_keyIsFirstLaunch) ?? true; // Varsayılan olarak ilk açılış
  }

  @override
  Future<void> setIsFirstLaunch(bool isFirstLaunch) async {
    await sharedPreferences.setBool(_keyIsFirstLaunch, isFirstLaunch);
  }
}