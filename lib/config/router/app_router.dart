import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_wonderland/features/splash/presentation/screens/splash_screen.dart';
import '../theme/app_text_styles.dart';

class AppRouteName {
  static const String splash = "splash";
  static const String home = "home";
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRouteName.splash,
        builder: (context, state) {
          // SplashScreen sınıfı tanımlı olmalı
          return SplashScreen();
        },
      ),
      GoRoute(
        path: '/home',
        name: AppRouteName.home,
        builder: (context, state) {
          // HomeScreen sınıfı tanımlı olmalı
          return HomeScreen();
        },
      ),
    ],
  );
}

// SplashScreen örneği
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // GoRouter kullanarak home sayfasına geçiş
      AppRouter.router.goNamed(AppRouteName.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash Screen")),
    );
  }
}

// HomeScreen örneği
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Screen")),
    );
  }
}