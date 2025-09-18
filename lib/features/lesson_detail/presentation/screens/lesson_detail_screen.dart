import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_wonderland/config/router/app_router.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';
import 'package:learning_wonderland/data/local/app_database.dart';
import 'package:learning_wonderland/features/lesson_detail/data/datasources/lesson_detail_local_datasource.dart';
import 'package:learning_wonderland/features/lesson_detail/data/repositories/lesson_detail_repository_impl.dart';
import 'package:learning_wonderland/features/lesson_detail/domain/bloc/lesson_detail_bloc.dart';
import 'package:learning_wonderland/features/lesson_detail/domain/bloc/lesson_detail_event.dart';
import 'package:learning_wonderland/features/lesson_detail/domain/bloc/lesson_detail_state.dart';

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonDetailScreen({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    final lessonDetailRepository = LessonDetailRepositoryImpl(
      localDataSource: LessonDetailLocalDataSourceImpl(appDatabase: AppDatabase()),
    );

    return BlocProvider(
      create: (_) => LessonDetailBloc(lessonDetailRepository: lessonDetailRepository)
        ..add(LoadLessonGameTypes(lessonId: lesson.id)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            lesson.title,
            style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: Colors.white),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        backgroundColor: AppColors.lavenderBlush,
        body: BlocBuilder<LessonDetailBloc, LessonDetailState>(
          builder: (context, state) {
            if (state is LessonDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
              );
            } else if (state is LessonDetailLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You selected: "${lesson.title}"',
                      style: AppTextStyles.chewyTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Description: ${lesson.description ?? "No description available."}',
                      style: AppTextStyles.notoSansBodyStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Available Game Types:',
                      style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: AppColors.darkGrey),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.gameTypes.length,
                      itemBuilder: (context, index) {
                        final gameType = state.gameTypes[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: gameType.iconPath != null
                                ? Image.asset(gameType.iconPath!, width: 40, height: 40)
                                : const Icon(Icons.gamepad, color: AppColors.secondaryColor),
                            title: Text(
                              gameType.name,
                              style: AppTextStyles.notoSansHighlightStyle,
                            ),
                            subtitle: Text(
                              gameType.description ?? 'No description.',
                              style: AppTextStyles.notoSansSmallStyle,
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.mediumPurple),
                            onTap: () {
                              GoRouter.of(context).goNamed(
                                AppRouteName.gameLevels,
                                extra: gameType,
                              );
                            },
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
            } else if (state is LessonDetailError) {
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
