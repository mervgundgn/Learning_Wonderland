import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


part 'app_database.g.dart';

// Users Table
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get profilePhotoPath => text().nullable()();
  IntColumn get currentLevel => integer().withDefault(const Constant(0))();
  IntColumn get starsEarned => integer().withDefault(const Constant(0))();
  IntColumn get characterCoins => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastLogin => dateTime().nullable()();
}

// Lessons Table
class Lessons extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get characterId => text().withLength(min: 1, max: 255)();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  IntColumn get difficultyLevel => integer().withDefault(const Constant(1))();
  BoolColumn get isUnlocked => boolean().withDefault(const Constant(false))();
  RealColumn get completionPercentage => real().withDefault(const Constant(0.0))();
  DateTimeColumn get lastAccessed => dateTime().nullable()();
}

// GameLevels Table
class GameLevels extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lessonId => integer().customConstraint('REFERENCES lessons(id)')();
  IntColumn get levelNumber => integer().withDefault(const Constant(1))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get score => integer().withDefault(const Constant(0))();
  IntColumn get starsAwarded => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPlayed => dateTime().nullable()();
}

// Words Table
class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get wordText => text().unique()();
  TextColumn get definition => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get audioUrl => text().nullable()();
  IntColumn get masteryLevel => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastReviewed => dateTime().nullable()();
}

// ParentTasks Table
class ParentTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get assignedByUserId => text().nullable()();
}

// Drift Database
@DriftDatabase(tables: [Users, Lessons, GameLevels, Words, ParentTasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  static LazyDatabase openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
  }
}
