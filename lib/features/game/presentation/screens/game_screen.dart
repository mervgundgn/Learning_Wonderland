import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/config/router/app_router.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';
import 'package:learning_wonderland/data/local/app_database.dart';
import 'package:learning_wonderland/features/game_levels/data/datasources/game_levels_local_datasource.dart';
import 'package:learning_wonderland/features/game_levels/data/repositories/game_levels_repository_impl.dart';
import 'package:learning_wonderland/features/game/domain/bloc/game_bloc.dart';
import 'package:learning_wonderland/features/game/domain/bloc/game_event.dart';
import 'package:learning_wonderland/features/game/domain/bloc/game_state.dart';

class GameScreen extends StatefulWidget {
  final GameLevel gameLevel;
  final GameType gameType;

  const GameScreen({
    super.key,
    required this.gameLevel,
    required this.gameType,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final gameLevelsRepository = GameLevelsRepositoryImpl(
      localDataSource: GameLevelsLocalDataSourceImpl(appDatabase: AppDatabase()),
    );

    return BlocProvider<GameBloc>(
      create: (context) => GameBloc(gameLevelsRepository: gameLevelsRepository)
        ..add(LoadGameLevelContent(gameLevel: widget.gameLevel)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Level ${widget.gameLevel.levelNumber} - ${widget.gameType.name}',
            style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: Colors.white),
          ),
          backgroundColor: AppColors.accentPurple,
        ),
        backgroundColor: AppColors.lavenderBlush,
        body: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if (state is GameLevelCompleted) {
              Future.delayed(const Duration(milliseconds: 1000)).then((_) {
                GoRouter.of(context).goNamed(AppRouteName.gameLevels, extra: widget.gameType);
              });
            }
          },
          builder: (context, state) {
            if (state is GameLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
              );
            } else if (state is GameLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Görsel Harf Tanıma Oyunu',
                        style: AppTextStyles.chewyTitleStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Soru ${state.currentQuestionIndex + 1} / ${state.totalQuestions}',
                        style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: AppColors.darkGrey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            state.currentQuestionContent,
                            style: AppTextStyles.chewyTitleStyle.copyWith(fontSize: 120, color: AppColors.mediumPurple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Seçenekler:',
                        style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: AppColors.darkGrey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.options.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 2.0,
                        ),
                        itemBuilder: (context, index) {
                          final option = state.options[index];
                          final bool isSelected = state.selectedAnswer == option;
                          final bool? isCorrect = state.isCorrectAnswer;

                          Color cardColor = AppColors.white;
                          Color textColor = AppColors.darkGrey;
                          BorderSide borderSide = BorderSide.none;

                          if (isSelected) {
                            if (isCorrect == true) {
                              cardColor = AppColors.accentGreen.withOpacity(0.7);
                              textColor = AppColors.white;
                              borderSide = const BorderSide(color: AppColors.mediumPurple, width: 2);
                            } else if (isCorrect == false) {
                              cardColor = Colors.redAccent.withOpacity(0.7);
                              textColor = AppColors.white;
                              borderSide = const BorderSide(color: AppColors.darkGrey, width: 2);
                            } else {
                              cardColor = AppColors.secondaryColor.withOpacity(0.7);
                              textColor = AppColors.darkGrey;
                              borderSide = const BorderSide(color: AppColors.primaryColor, width: 1);
                            }
                          }

                          return GestureDetector(
                            onTap: state.selectedAnswer == null
                                ? () {
                              context.read<GameBloc>().add(SubmitAnswer(selectedAnswer: option));
                            }
                                : null,
                            child: Card(
                              color: cardColor,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: borderSide,
                              ),
                              child: Center(
                                child: Text(
                                  option,
                                  style: AppTextStyles.notoSansHighlightStyle.copyWith(
                                    color: textColor,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Score: ${state.score}',
                            style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: AppColors.darkGrey),
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: List.generate(3, (index) {
                              return Icon(
                                index < state.stars ? Icons.star : Icons.star_border,
                                color: AppColors.accentYellow,
                                size: 24,
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: (state.selectedAnswer != null &&
                            state.currentQuestionIndex == state.totalQuestions - 1)
                            ? () {
                          context.read<GameBloc>().add(CompleteGameLevel(
                            gameLevel: state.gameLevel,
                            score: state.score,
                            stars: state.stars,
                            isCompleted: true,
                          ));
                        }
                            : null,
                        child: const Text('Seviyeyi Bitir'),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is GameError) {
              return Center(
                child: Text(
                  state.message,
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
