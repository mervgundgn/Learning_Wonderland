import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/theme/app_theme.dart';
import 'config/theme/app_colors.dart';
import 'config/theme/app_text_styles.dart';

// -------------------- Home Bloc --------------------
class HomeEvent {}
class LoadHomeData extends HomeEvent {}

class HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(HomeLoaded());
    });
  }
}

// -------------------- SplashScreen --------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).go('/home');
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavenderBlush,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Learning Wonderland",
              style: AppTextStyles.chewyTitleStyle,
            ),
            const SizedBox(height: 20.0),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- HomeScreen --------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadHomeData()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
              ),
            );
          } else if (state is HomeLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Harikalar Diyarı Haritası",
                  style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: Colors.white),
                ),
              ),
              body: Stack(
                children: [
                  Image.asset(
                    'assets/images/backgrounds/bacground_map.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    top: 100,
                    left: 50,
                    child: Text(
                      'Hello Kitty Modülü',
                      style: AppTextStyles.notoSansHighlightStyle,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 150,
                    child: Text(
                      'Cinnamoroll Modülü',
                      style: AppTextStyles.notoSansHighlightStyle,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is HomeError) {
            return Scaffold(
              body: Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.notoSansBodyStyle.copyWith(color: Colors.red),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(child: Text("Bilinmeyen Durum")),
            );
          }
        },
      ),
    );
  }
}

// -------------------- GoRouter --------------------
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

// -------------------- Main --------------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp.router(
    title: 'Learning Wonderland',
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
    theme: AppTheme.lightTheme, // LightTheme artık Google Fonts ile bağlandı
  ));
}
