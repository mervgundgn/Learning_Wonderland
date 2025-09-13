import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';
import 'package:learning_wonderland/features/home/data/datasources/home_local_datasource.dart';
import 'package:learning_wonderland/features/home/data/repositories/home_repository_impl.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_bloc.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_event.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_state.dart';
import 'package:learning_wonderland/data/local/app_database.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeRepository = HomeRepositoryImpl(
      localDataSource: HomeLocalDataSourceImpl(appDatabase: AppDatabase()),
    );

    return BlocProvider(
      create: (_) => HomeBloc(homeRepository: homeRepository)..add(LoadHomeData()),
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
                    child: Text('Hello Kitty Modülü', style: AppTextStyles.notoSansHighlightStyle),
                  ),
                  Positioned(
                    top: 200,
                    left: 150,
                    child: Text('Cinnamoroll Modülü', style: AppTextStyles.notoSansHighlightStyle),
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
            return const Scaffold(body: Center(child: Text("Bilinmeyen Durum")));
          }
        },
      ),
    );
  }
}
