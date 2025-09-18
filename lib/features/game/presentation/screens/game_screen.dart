import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_wonderland/config/router/app_router.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';
import 'package:learning_wonderland/data/local/app_database.dart'; // GameLevel modeli için

class GameScreen extends StatefulWidget {
  final GameLevel gameLevel;

  const GameScreen({
    super.key,
    required this.gameLevel,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Oyunun mevcut durumu için harf, ileride dinamikleşecek
  String _currentLetter = 'A'; // Şimdilik sabit bir harf (örneğin 'A' harfi tanıma oyunu için)
  // İleride bu harf, oyun tipine ve seviyeye göre değişecek.

  @override
  void initState() {
    super.initState();
    // Oyun başladığında ilk içeriği yükleme gibi işlemler burada yapılabilir.
    // Ses ile ilgili bir başlangıç işlemi olmayacak.
  }

  // Ses oynatma fonksiyonu artık yok.

  // Seviyenin tamamlanmasını simüle eden metot
  void _finishLevel() {
    print('Level ${widget.gameLevel.levelNumber} finished!');
    // GameLevelsScreen'e geri dön ve GameType objesini doğru parametrelerle gönder
    // Bu, GameLevelsScreen'in seviyeleri yeniden yüklemesini ve güncel durumu göstermesini sağlayacak.
    GoRouter.of(context).goNamed(
      AppRouteName.gameLevels,
      extra: GameType(
        id: widget.gameLevel.gameTypeId,
        lessonId: -1, // Geçici değer, oyun mekaniği için kullanılmayacak
        name: '',     // Geçici değer, oyun mekaniği için kullanılmayacak
        description: '', // Eksik 'description' parametresi eklendi
        iconPath: null,  // Eksik 'iconPath' parametresi eklendi
        orderIndex: 0,   // Eksik 'orderIndex' parametresi eklendi
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Level ${widget.gameLevel.levelNumber} - Game Type: ${widget.gameLevel.gameTypeId}',
          style: AppTextStyles.bubblegumSansSubtitleStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.accentPurple,
      ),
      backgroundColor: AppColors.lavenderBlush,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Görsel Harf Tanıma Oyunu', // Konsept uyumlu başlık
              style: AppTextStyles.chewyTitleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Harfi büyük ve belirgin bir şekilde göster
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
                  _currentLetter, // Gösterilen harf
                  style: AppTextStyles.chewyTitleStyle.copyWith(fontSize: 120, color: AppColors.mediumPurple),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Ses oynatma butonu kaldırıldı.
            ElevatedButton(
              onPressed: _finishLevel, // Seviyeyi bitirme butonu
              child: const Text('Seviyeyi Bitir ve Geri Dön'),
            ),
          ],
        ),
      ),
    );
  }
}