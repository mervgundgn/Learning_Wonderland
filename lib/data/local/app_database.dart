import 'dart:io';
import 'package:drift/drift.dart'; // MigrationStrategy sınıfı bu paketten gelmeli
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart'; // Drift tarafından generate edilecek kısım


class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50).named('user_name')();
  TextColumn get profilePhotoPath => text().nullable()();
  IntColumn get currentLevel => integer().withDefault(const Constant(1))();
  IntColumn get starsEarned => integer().withDefault(const Constant(0))();
  IntColumn get characterCoins => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastLogin => dateTime().nullable()();
}

class Lessons extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get characterId => text().withLength(min: 3, max: 20)();
  TextColumn get title => text().withLength(min: 5, max: 100)();
  TextColumn get description => text().nullable()();
  IntColumn get difficultyLevel => integer().withDefault(const Constant(1))();
  BoolColumn get isUnlocked => boolean().withDefault(const Constant(false))();
  RealColumn get completionPercentage => real().withDefault(const Constant(0.0))();
  DateTimeColumn get lastAccessed => dateTime().nullable()();
}

class GameTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lessonId => integer().references(Lessons, #id)();
  TextColumn get name => text().withLength(min: 3, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get iconPath => text().nullable()();
  IntColumn get orderIndex => integer().withDefault(const Constant(0))();
}

class GameLevels extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameTypeId => integer().references(GameTypes, #id)();
  IntColumn get levelNumber => integer().withDefault(const Constant(1))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get score => integer().withDefault(const Constant(0))();
  IntColumn get starsAwarded => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPlayed => dateTime().nullable()();
}

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get wordText => text().withLength(min: 1, max: 50).unique()();
  TextColumn get definition => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get audioUrl => text().nullable()();
  IntColumn get masteryLevel => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastReviewed => dateTime().nullable()();
}

class ParentTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 5, max: 100)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get assignedByUserId => text().nullable()();
}


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users, Lessons, GameLevels, Words, ParentTasks, GameTypes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy( // Bu kısım sizin bulduğunuz ve çalışan doğru yapı
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(gameTypes);
        await m.deleteTable(gameLevels.actualTableName);
        await m.createTable(gameLevels);
      }
    },
  );


  Future<void> addInitialLessonData() async {
    final lessonCount = await (select(lessons).get()).then((value) => value.length);

    if (lessonCount == 0) {
      await batch((batch) {
        batch.insertAll(lessons, [
          LessonsCompanion.insert(
            characterId: 'HelloKitty',
            title: 'Harfleri Tanıyalım',
            description: const Value('Sesli harfleri görsel ve işitsel olarak tanıma.'),
            difficultyLevel: const Value(1),
            isUnlocked: const Value(true),
          ),
          LessonsCompanion.insert(
            characterId: 'Cinnamoroll',
            title: 'Kelime Avı',
            description: const Value('Basit kelimeler oluşturma pratiği.'),
            difficultyLevel: const Value(1),
            isUnlocked: const Value(false),
          ),
          LessonsCompanion.insert(
            characterId: 'Kuromi',
            title: 'Cümle Kurma',
            description: const Value('Kısa cümleler kurma alıştırması.'),
            difficultyLevel: const Value(2),
            isUnlocked: const Value(false),
          ),
          LessonsCompanion.insert(
            characterId: 'MyMelody',
            title: 'Heceleme Oyunu',
            description: const Value('Kelime heceleme alıştırması.'),
            difficultyLevel: const Value(1),
            isUnlocked: const Value(false),
          ),
          LessonsCompanion.insert(
            characterId: 'Pompompurin',
            title: 'Okuduğunu Anlama',
            description: const Value('Basit hikayeleri anlama pratiği.'),
            difficultyLevel: const Value(2),
            isUnlocked: const Value(false),
          ),
        ]);
      });

      final allLessons = await select(lessons).get();

      for (final lesson in allLessons) {
        final List<GameTypesCompanion> gameTypeCompanions = [
          GameTypesCompanion.insert(
            lessonId: lesson.id,
            name: 'Sesli Harf Tanıma',
            description: const Value('Sesli harfleri görsel ve işitsel olarak tanıma.'),
            iconPath: const Value('assets/sanrio_characters/static/hello_kitty_glasses_holding_paper.png'),
            orderIndex: const Value(0),
          ),
          GameTypesCompanion.insert(
            lessonId: lesson.id,
            name: 'Harf Eşleştirme',
            description: const Value('Büyük ve küçük harfleri eşleştirme oyunu.'),
            iconPath: const Value('assets/sanrio_characters/static/hello_kitty_thinking_question.png'),
            orderIndex: const Value(1),
          ),
          GameTypesCompanion.insert(
            lessonId: lesson.id,
            name: 'Harf Yazma Pratiği',
            description: const Value('Parmağınla harflerin izini takip et.'),
            iconPath: const Value('assets/sanrio_characters/static/hello_kitty_idea_lightbulb.png'),
            orderIndex: const Value(2),
          ),
        ];

        for (final companion in gameTypeCompanions) {
          final gameTypeId = await into(gameTypes).insert(companion);

          for (int i = 1; i <= 10; i++) {
            await into(gameLevels).insert(GameLevelsCompanion.insert(
              gameTypeId: gameTypeId,
              levelNumber: Value(i),
              isCompleted: Value(false),
              score: Value(0),
              starsAwarded: Value(0),
            ));
          }
        }
      }
    }
  }
}