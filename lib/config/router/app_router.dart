import 'package:go_router/go_router.dart';
import 'package:learning_wonderland/features/home/presentation/screens/home_screen.dart';
import 'package:learning_wonderland/features/splash/presentation/screens/splash_screen.dart';

class AppRouteName {
  static const splash = 'splash';
  static const home = 'home';
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
    ],
  );
}
