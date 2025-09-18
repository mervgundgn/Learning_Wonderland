import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// AppRouteName sınıfını kullanmak için bu import gereklidir!
import 'package:learning_wonderland/config/router/app_router.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';
import 'package:learning_wonderland/data/local/app_database.dart';
import 'package:learning_wonderland/features/game_levels/data/datasources/game_levels_local_datasource.dart';
import 'package:learning_wonderland/features/game_levels/data/repositories/game_levels_repository_impl.dart';
import 'package:learning_wonderland/features/game_levels/domain/bloc/game_levels_bloc.dart';
import 'package:learning_wonderland/features/game_levels/domain/bloc/game_levels_event.dart';
import 'package:learning_wonderland/features/game_levels/domain/bloc/game_levels_state.dart';

class GameLevelsScreen extends StatelessWidget {
  final GameType gameType;

  const GameLevelsScreen({
    super.key,
    required this.gameType,
  });

  @override
  Widget build(BuildContext context) {
    final gameLevelsRepository = GameLevelsRepositoryImpl(
      localDataSource: GameLevelsLocalDataSourceImpl(appDatabase: AppDatabase()),
    );

    return BlocProvider(
      create: (_) => GameLevelsBloc(gameLevelsRepository: gameLevelsRepository)
        ..add(LoadGameLevels(gameTypeId: gameType.id)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            gameType.name,
            style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.secondaryColor,
        ),
        backgroundColor: AppColors.lavenderBlush,
        body: BlocBuilder<GameLevelsBloc, GameLevelsState>(
          builder: (context, state) {
            if (state is GameLevelsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
              );
            } else if (state is GameLevelsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Game Type: ${gameType.name}',
                      style: AppTextStyles.chewyTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Description: ${gameType.description ?? "No description available"}',
                      style: AppTextStyles.notoSansBodyStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Levels: ',
                      style: AppTextStyles.bubblegumSansSubtitleStyle
                          .copyWith(color: AppColors.darkGrey),
                    ),
                    const SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (state as GameLevelsLoaded).gameLevels.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        final gameLevel = (state as GameLevelsLoaded).gameLevels[index];
                        final bool isCompleted = gameLevel.isCompleted;
                        final int stars = gameLevel.starsAwarded;

                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).goNamed(
                              AppRouteName.game, // AppRouteName doğru şekilde kullanıldı
                              extra: {
                                'gameLevel': gameLevel,
                                'gameType': gameType,
                              },
                            );
                          },
                          child: Card(
                            color: isCompleted
                                ? AppColors.accentGreen.withOpacity(0.7)
                                : AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: isCompleted
                                  ? const BorderSide(color: AppColors.mediumPurple, width: 2)
                                  : BorderSide.none,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${gameLevel.levelNumber}',
                                    style: AppTextStyles.notoSansHighlightStyle.copyWith(
                                      color: isCompleted ? AppColors.white : AppColors.mediumPurple,
                                    ),
                                  ),
                                  if (isCompleted) ...[
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(3, (starIndex) {
                                        return Icon(
                                          starIndex < stars ? Icons.star : Icons.star_border,
                                          color: starIndex < stars
                                              ? AppColors.accentYellow
                                              : AppColors.white.withOpacity(0.7),
                                          size: 16,
                                        );
                                      }),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          final router = GoRouter.of(context);
                          if (router.canPop()) {
                            router.pop();
                          } else {
                            router.goNamed(AppRouteName.home);
                          }
                        },
                        child: const Text('Go Back'),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is GameLevelsError) {
              return Center(
                child: Text(
                  (state as GameLevelsError).message,
                  style: AppTextStyles.notoSansBodyStyle.copyWith(color: Colors.red),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}