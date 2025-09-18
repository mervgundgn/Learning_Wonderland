import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_bloc.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_event.dart';
import 'package:learning_wonderland/features/app_settings/domain/bloc/app_settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ayarlar',
          style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        builder: (context, state) {
          if (state is AppSettingsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              ),
            );
          } else if (state is AppSettingsLoaded) {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: Text(
                    'Bildirimleri Aç/Kapat',
                    style: AppTextStyles.notoSansBodyStyle,
                  ),
                  trailing: Switch(
                    value: state.isNotificationEnabled,
                    onChanged: (bool value) {
                      context.read<AppSettingsBloc>().add(
                        UpdateNotificationSettings(isEnabled: value),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is AppSettingsError) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.notoSansBodyStyle.copyWith(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
