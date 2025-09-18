import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';
import 'package:learning_wonderland/data/local/app_database.dart';
import 'package:learning_wonderland/features/app_settings/data/datasources/app_settings_local_datasource.dart';
import 'package:learning_wonderland/features/app_settings/data/repositories/app_settings_repository_impl.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_bloc.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final appDatabase = AppDatabase();
  await appDatabase.addInitialLessonData();

  final sharedPreferences = await SharedPreferences.getInstance();

  final appSettingsLocalDataSource = AppSettingsLocalDataSourceImpl(
    sharedPreferences: sharedPreferences,
  );

  final appSettingsRepository = AppSettingsRepositoryImpl(
    localDataSource: appSettingsLocalDataSource,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppSettingsBloc(
            appSettingsRepository: appSettingsRepository,
          )..add(const LoadAppSettings()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Learning Wonderland',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: AppTheme.lightTheme,
    );
  }
}
