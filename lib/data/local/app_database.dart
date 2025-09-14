import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';


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

class GameLevels extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lessonId => integer().references(Lessons, #id)();
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

@DriftDatabase(tables: [Users, Lessons, GameLevels, Words, ParentTasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> addInitialLessonData() async {
    final lessonCount =
    await (select(lessons).get()).then((value) => value.length);

    if (lessonCount == 0) {
      await batch((batch) {
        batch.insertAll(lessons, [
          LessonsCompanion.insert(
            characterId: 'HelloKitty',
            title: 'Harfleri Tanıyalım',
            description:
            const Value('Sesli harfleri öğrenme modülü.'),

            difficultyLevel: const Value(1),
            isUnlocked: const Value(true),
          ),
          LessonsCompanion.insert(
            characterId: 'Cinnamoroll',
            title: 'Kelime Avı',
            description:
            const Value('Basit kelimeler oluşturma pratiği.'),
            difficultyLevel: const Value(1),
            isUnlocked: const Value(false),
          ),
          LessonsCompanion.insert(
            characterId: 'Kuromi',
            title: 'Cümle Kurma',
            description:
            const Value('Kısa cümleler kurma alıştırması.'),
            difficultyLevel: const Value(2),
            isUnlocked: const Value(false),
          ),
          LessonsCompanion.insert(
            characterId: 'MyMelody',
            title: 'Heceleme Oyunu',
            description:
            const Value('Kelime heceleme alıştırması.'),
            difficultyLevel: const Value(1),
            isUnlocked: const Value(false),
          ),
          LessonsCompanion.insert(
            characterId: 'Pompompurin',
            title: 'Okuduğunu Anlama',
            description:
            const Value('Basit hikayeleri anlama pratiği.'),
            difficultyLevel: const Value(2),
            isUnlocked: const Value(false),
          ),
        ]);
      });
    }
  }
}
