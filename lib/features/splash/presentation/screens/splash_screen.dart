import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_wonderland/config/router/app_router.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_bloc.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_event.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const splashScreenDuration = Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavenderBlush,
      body: BlocListener<AppSettingsBloc, AppSettingsState>(
        listener: (context, state) {
          if (state is AppSettingsLoaded) {
            Future.delayed(splashScreenDuration).then((_) {
              if (!mounted) return;

              if (state.isFirstLaunch) {
                GoRouter.of(context).goNamed(AppRouteName.home);
                context.read<AppSettingsBloc>().add(
                  const SetFirstLaunchStatus(isFirstLaunch: false),
                );
              } else {
                GoRouter.of(context).goNamed(AppRouteName.home);
              }
            });
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Learning Wonderland", style: AppTextStyles.chewyTitleStyle),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
