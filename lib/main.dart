import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/router/app_router.dart';
import 'data/local/app_database.dart';
import 'config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final database = AppDatabase();

  await database.addInitialLessonData();

  runApp(const MyApp());
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
