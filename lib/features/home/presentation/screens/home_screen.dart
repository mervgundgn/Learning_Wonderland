import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';
import 'package:learning_wonderland/features/home/data/datasources/home_local_datasource.dart';
import 'package:learning_wonderland/features/home/data/repositories/home_repository_impl.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_bloc.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_event.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_state.dart';
import 'package:learning_wonderland/data/local/app_database.dart'; // Lesson modeli için gerekli

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
            final List<Offset> relativePositions = [
              const Offset(0.20, 0.25), // HelloKitty - Harfleri Tanıyalım (Sol üstte, başlığın altı)
              const Offset(0.65, 0.40), // Cinnamoroll - Kelime Avı (Sağ ortada)
              const Offset(0.30, 0.60), // Kuromi - Cümle Kurma (Sol alt ortada)
              const Offset(0.80, 0.68), // MyMelody - dy değeri 0.70'ten 0.68'e düşürüldü
              const Offset(0.45, 0.83), // Pompompurin - dy değeri 0.85'ten 0.83'e düşürüldü
            ];

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Harikalar Diyarı Haritası", // Mevcut AppBar başlığı korunuyor
                  style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: Colors.white),
                ),
              ),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  final double stackWidth = constraints.maxWidth;
                  final double stackHeight = constraints.maxHeight;

                  // Modül kutucuklarının sabit boyutları - Overflow hatasını gidermek için inceltildi
                  final double moduleWidth = 120.0;
                  final double moduleHeight = 140.0; // 💡 135.0'dan 140.0'e artırıldı

                  return Stack(
                    children: [
                      Image.asset(
                        'assets/images/backgrounds/bacground_map.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      ...state.lessonModules.asMap().entries.map((entry) {
                        final index = entry.key;
                        final Lesson module = entry.value;

                        final Offset relativePos = relativePositions[index % relativePositions.length];

                        final double actualLeft = (relativePos.dx * stackWidth) - (moduleWidth / 2);
                        final double actualTop = (relativePos.dy * stackHeight) - (moduleHeight / 2);

                        final bool isLocked = !module.isUnlocked;
                        final Color containerColor = isLocked ? AppColors.darkGrey.withOpacity(0.5) : Colors.white.withOpacity(0.8);
                        final TextStyle textStyle = isLocked
                            ? AppTextStyles.notoSansHighlightStyle.copyWith(color: AppColors.darkGrey.withOpacity(0.7))
                            : AppTextStyles.notoSansHighlightStyle;
                        final Color? imageColor = isLocked ? AppColors.white.withOpacity(0.7) : null;
                        final BlendMode? imageBlendMode = isLocked ? BlendMode.modulate : null;

                        return Positioned(
                          top: actualTop.clamp(0.0, stackHeight - moduleHeight),
                          left: actualLeft.clamp(0.0, stackWidth - moduleWidth),
                          child: GestureDetector(
                            onTap: isLocked
                                ? null
                                : () {
                              print("Modül Tıklandı: ${module.title}");
                            },
                            child: Container(
                              width: moduleWidth,
                              height: moduleHeight,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/sanrio_characters/static/${module.characterId.toLowerCase()}.png',
                                    width: 40,
                                    height: 40,
                                    color: imageColor,
                                    colorBlendMode: imageBlendMode,
                                  ),
                                  if (isLocked)
                                    const Icon(
                                      Icons.lock,
                                      color: AppColors.white,
                                      size: 24,
                                    ),
                                  const SizedBox(height: 2), // 💡 4'ten 2'ye düşürüldü
                                  Text(
                                    module.title,
                                    style: textStyle,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
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
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}