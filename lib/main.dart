import 'package:flutter/material.dart';
import 'package:learning_wonderland/config/theme/app_theme.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';

void main() {
  runApp(const LearningWonderlandApp());
}

class LearningWonderlandApp extends StatelessWidget {
  const LearningWonderlandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Wonderland',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Text(
          'Learning Wonderland',
          style: AppStyles.chewyTitleStyle,
        ),
      ),
    );

    throw UnimplementedError();
  }
}