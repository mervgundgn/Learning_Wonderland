import 'package:go_router/go_router.dart';
import 'package:learning_wonderland/features/home/presentation/screens/home_screen.dart';
import 'package:learning_wonderland/features/splash/presentation/screens/splash_screen.dart';
import 'package:learning_wonderland/features/lesson_detail/presentation/screens/lesson_detail_screen.dart';
import 'package:learning_wonderland/data/local/app_database.dart';
import 'package:learning_wonderland/features/game_levels/presentation/screens/game_levels_screen.dart';
import 'package:learning_wonderland/features/game/presentation/screens/game_screen.dart';
import 'package:learning_wonderland/features/app_settings/presentation/screens/settings_screen.dart';

class AppRouteName {
  static const splash = 'splash';
  static const home = 'home';
  static const lessonDetail = 'lessonDetail';
  static const gameLevels = 'gameLevels';
  static const game = 'game';
  static const settings = 'settings'; // Yeni sabit eklendi
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRouteName.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: AppRouteName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/lesson-detail',
        name: AppRouteName.lessonDetail,
        builder: (context, state) {
          final lesson = state.extra as Lesson;
          return LessonDetailScreen(lesson: lesson);
        },
      ),
      GoRoute(
        path: '/game-levels',
        name: AppRouteName.gameLevels,
        builder: (context, state) {
          final gameType = state.extra as GameType;
          return GameLevelsScreen(gameType: gameType);
        },
      ),
      GoRoute(
        path: '/game',
        name: AppRouteName.game,
        builder: (context, state) {
          final Map<String, dynamic> extras = state.extra as Map<String, dynamic>;
          final GameLevel gameLevel = extras['gameLevel'] as GameLevel;
          final GameType gameType = extras['gameType'] as GameType;
          return GameScreen(gameLevel: gameLevel, gameType: gameType);
        },
      ),
      GoRoute(
        path: '/settings',
        name: AppRouteName.settings,
        builder: (context, state) => const SettingsScreen(), // Yeni route eklendi
      ),
    ],
  );
}
