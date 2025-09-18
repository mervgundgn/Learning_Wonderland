// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'user_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _profilePhotoPathMeta = const VerificationMeta(
    'profilePhotoPath',
  );
  @override
  late final GeneratedColumn<String> profilePhotoPath = GeneratedColumn<String>(
    'profile_photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentLevelMeta = const VerificationMeta(
    'currentLevel',
  );
  @override
  late final GeneratedColumn<int> currentLevel = GeneratedColumn<int>(
    'current_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _starsEarnedMeta = const VerificationMeta(
    'starsEarned',
  );
  @override
  late final GeneratedColumn<int> starsEarned = GeneratedColumn<int>(
    'stars_earned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _characterCoinsMeta = const VerificationMeta(
    'characterCoins',
  );
  @override
  late final GeneratedColumn<int> characterCoins = GeneratedColumn<int>(
    'character_coins',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastLoginMeta = const VerificationMeta(
    'lastLogin',
  );
  @override
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
    'last_login',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    profilePhotoPath,
    currentLevel,
    starsEarned,
    characterCoins,
    lastLogin,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['user_name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('profile_photo_path')) {
      context.handle(
        _profilePhotoPathMeta,
        profilePhotoPath.isAcceptableOrUnknown(
          data['profile_photo_path']!,
          _profilePhotoPathMeta,
        ),
      );
    }
    if (data.containsKey('current_level')) {
      context.handle(
        _currentLevelMeta,
        currentLevel.isAcceptableOrUnknown(
          data['current_level']!,
          _currentLevelMeta,
        ),
      );
    }
    if (data.containsKey('stars_earned')) {
      context.handle(
        _starsEarnedMeta,
        starsEarned.isAcceptableOrUnknown(
          data['stars_earned']!,
          _starsEarnedMeta,
        ),
      );
    }
    if (data.containsKey('character_coins')) {
      context.handle(
        _characterCoinsMeta,
        characterCoins.isAcceptableOrUnknown(
          data['character_coins']!,
          _characterCoinsMeta,
        ),
      );
    }
    if (data.containsKey('last_login')) {
      context.handle(
        _lastLoginMeta,
        lastLogin.isAcceptableOrUnknown(data['last_login']!, _lastLoginMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_name'],
      )!,
      profilePhotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_photo_path'],
      ),
      currentLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_level'],
      )!,
      starsEarned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stars_earned'],
      )!,
      characterCoins: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}character_coins'],
      )!,
      lastLogin: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_login'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String? profilePhotoPath;
  final int currentLevel;
  final int starsEarned;
  final int characterCoins;
  final DateTime? lastLogin;
  const User({
    required this.id,
    required this.name,
    this.profilePhotoPath,
    required this.currentLevel,
    required this.starsEarned,
    required this.characterCoins,
    this.lastLogin,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(name);
    if (!nullToAbsent || profilePhotoPath != null) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath);
    }
    map['current_level'] = Variable<int>(currentLevel);
    map['stars_earned'] = Variable<int>(starsEarned);
    map['character_coins'] = Variable<int>(characterCoins);
    if (!nullToAbsent || lastLogin != null) {
      map['last_login'] = Variable<DateTime>(lastLogin);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      profilePhotoPath: profilePhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePhotoPath),
      currentLevel: Value(currentLevel),
      starsEarned: Value(starsEarned),
      characterCoins: Value(characterCoins),
      lastLogin: lastLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLogin),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      profilePhotoPath: serializer.fromJson<String?>(json['profilePhotoPath']),
      currentLevel: serializer.fromJson<int>(json['currentLevel']),
      starsEarned: serializer.fromJson<int>(json['starsEarned']),
      characterCoins: serializer.fromJson<int>(json['characterCoins']),
      lastLogin: serializer.fromJson<DateTime?>(json['lastLogin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'profilePhotoPath': serializer.toJson<String?>(profilePhotoPath),
      'currentLevel': serializer.toJson<int>(currentLevel),
      'starsEarned': serializer.toJson<int>(starsEarned),
      'characterCoins': serializer.toJson<int>(characterCoins),
      'lastLogin': serializer.toJson<DateTime?>(lastLogin),
    };
  }

  User copyWith({
    int? id,
    String? name,
    Value<String?> profilePhotoPath = const Value.absent(),
    int? currentLevel,
    int? starsEarned,
    int? characterCoins,
    Value<DateTime?> lastLogin = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    profilePhotoPath: profilePhotoPath.present
        ? profilePhotoPath.value
        : this.profilePhotoPath,
    currentLevel: currentLevel ?? this.currentLevel,
    starsEarned: starsEarned ?? this.starsEarned,
    characterCoins: characterCoins ?? this.characterCoins,
    lastLogin: lastLogin.present ? lastLogin.value : this.lastLogin,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      profilePhotoPath: data.profilePhotoPath.present
          ? data.profilePhotoPath.value
          : this.profilePhotoPath,
      currentLevel: data.currentLevel.present
          ? data.currentLevel.value
          : this.currentLevel,
      starsEarned: data.starsEarned.present
          ? data.starsEarned.value
          : this.starsEarned,
      characterCoins: data.characterCoins.present
          ? data.characterCoins.value
          : this.characterCoins,
      lastLogin: data.lastLogin.present ? data.lastLogin.value : this.lastLogin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('currentLevel: $currentLevel, ')
          ..write('starsEarned: $starsEarned, ')
          ..write('characterCoins: $characterCoins, ')
          ..write('lastLogin: $lastLogin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    profilePhotoPath,
    currentLevel,
    starsEarned,
    characterCoins,
    lastLogin,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.profilePhotoPath == this.profilePhotoPath &&
          other.currentLevel == this.currentLevel &&
          other.starsEarned == this.starsEarned &&
          other.characterCoins == this.characterCoins &&
          other.lastLogin == this.lastLogin);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> profilePhotoPath;
  final Value<int> currentLevel;
  final Value<int> starsEarned;
  final Value<int> characterCoins;
  final Value<DateTime?> lastLogin;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.currentLevel = const Value.absent(),
    this.starsEarned = const Value.absent(),
    this.characterCoins = const Value.absent(),
    this.lastLogin = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.profilePhotoPath = const Value.absent(),
    this.currentLevel = const Value.absent(),
    this.starsEarned = const Value.absent(),
    this.characterCoins = const Value.absent(),
    this.lastLogin = const Value.absent(),
  }) : name = Value(name);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? profilePhotoPath,
    Expression<int>? currentLevel,
    Expression<int>? starsEarned,
    Expression<int>? characterCoins,
    Expression<DateTime>? lastLogin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'user_name': name,
      if (profilePhotoPath != null) 'profile_photo_path': profilePhotoPath,
      if (currentLevel != null) 'current_level': currentLevel,
      if (starsEarned != null) 'stars_earned': starsEarned,
      if (characterCoins != null) 'character_coins': characterCoins,
      if (lastLogin != null) 'last_login': lastLogin,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? profilePhotoPath,
    Value<int>? currentLevel,
    Value<int>? starsEarned,
    Value<int>? characterCoins,
    Value<DateTime?>? lastLogin,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
      currentLevel: currentLevel ?? this.currentLevel,
      starsEarned: starsEarned ?? this.starsEarned,
      characterCoins: characterCoins ?? this.characterCoins,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['user_name'] = Variable<String>(name.value);
    }
    if (profilePhotoPath.present) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath.value);
    }
    if (currentLevel.present) {
      map['current_level'] = Variable<int>(currentLevel.value);
    }
    if (starsEarned.present) {
      map['stars_earned'] = Variable<int>(starsEarned.value);
    }
    if (characterCoins.present) {
      map['character_coins'] = Variable<int>(characterCoins.value);
    }
    if (lastLogin.present) {
      map['last_login'] = Variable<DateTime>(lastLogin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('currentLevel: $currentLevel, ')
          ..write('starsEarned: $starsEarned, ')
          ..write('characterCoins: $characterCoins, ')
          ..write('lastLogin: $lastLogin')
          ..write(')'))
        .toString();
  }
}

class $LessonsTable extends Lessons with TableInfo<$LessonsTable, Lesson> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _difficultyLevelMeta = const VerificationMeta(
    'difficultyLevel',
  );
  @override
  late final GeneratedColumn<int> difficultyLevel = GeneratedColumn<int>(
    'difficulty_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isUnlockedMeta = const VerificationMeta(
    'isUnlocked',
  );
  @override
  late final GeneratedColumn<bool> isUnlocked = GeneratedColumn<bool>(
    'is_unlocked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_unlocked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _completionPercentageMeta =
      const VerificationMeta('completionPercentage');
  @override
  late final GeneratedColumn<double> completionPercentage =
      GeneratedColumn<double>(
        'completion_percentage',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0.0),
      );
  static const VerificationMeta _lastAccessedMeta = const VerificationMeta(
    'lastAccessed',
  );
  @override
  late final GeneratedColumn<DateTime> lastAccessed = GeneratedColumn<DateTime>(
    'last_accessed',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterId,
    title,
    description,
    difficultyLevel,
    isUnlocked,
    completionPercentage,
    lastAccessed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lessons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Lesson> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('difficulty_level')) {
      context.handle(
        _difficultyLevelMeta,
        difficultyLevel.isAcceptableOrUnknown(
          data['difficulty_level']!,
          _difficultyLevelMeta,
        ),
      );
    }
    if (data.containsKey('is_unlocked')) {
      context.handle(
        _isUnlockedMeta,
        isUnlocked.isAcceptableOrUnknown(data['is_unlocked']!, _isUnlockedMeta),
      );
    }
    if (data.containsKey('completion_percentage')) {
      context.handle(
        _completionPercentageMeta,
        completionPercentage.isAcceptableOrUnknown(
          data['completion_percentage']!,
          _completionPercentageMeta,
        ),
      );
    }
    if (data.containsKey('last_accessed')) {
      context.handle(
        _lastAccessedMeta,
        lastAccessed.isAcceptableOrUnknown(
          data['last_accessed']!,
          _lastAccessedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lesson map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lesson(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      difficultyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}difficulty_level'],
      )!,
      isUnlocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_unlocked'],
      )!,
      completionPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}completion_percentage'],
      )!,
      lastAccessed: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_accessed'],
      ),
    );
  }

  @override
  $LessonsTable createAlias(String alias) {
    return $LessonsTable(attachedDatabase, alias);
  }
}

class Lesson extends DataClass implements Insertable<Lesson> {
  final int id;
  final String characterId;
  final String title;
  final String? description;
  final int difficultyLevel;
  final bool isUnlocked;
  final double completionPercentage;
  final DateTime? lastAccessed;
  const Lesson({
    required this.id,
    required this.characterId,
    required this.title,
    this.description,
    required this.difficultyLevel,
    required this.isUnlocked,
    required this.completionPercentage,
    this.lastAccessed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_id'] = Variable<String>(characterId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['difficulty_level'] = Variable<int>(difficultyLevel);
    map['is_unlocked'] = Variable<bool>(isUnlocked);
    map['completion_percentage'] = Variable<double>(completionPercentage);
    if (!nullToAbsent || lastAccessed != null) {
      map['last_accessed'] = Variable<DateTime>(lastAccessed);
    }
    return map;
  }

  LessonsCompanion toCompanion(bool nullToAbsent) {
    return LessonsCompanion(
      id: Value(id),
      characterId: Value(characterId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      difficultyLevel: Value(difficultyLevel),
      isUnlocked: Value(isUnlocked),
      completionPercentage: Value(completionPercentage),
      lastAccessed: lastAccessed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAccessed),
    );
  }

  factory Lesson.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lesson(
      id: serializer.fromJson<int>(json['id']),
      characterId: serializer.fromJson<String>(json['characterId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      difficultyLevel: serializer.fromJson<int>(json['difficultyLevel']),
      isUnlocked: serializer.fromJson<bool>(json['isUnlocked']),
      completionPercentage: serializer.fromJson<double>(
        json['completionPercentage'],
      ),
      lastAccessed: serializer.fromJson<DateTime?>(json['lastAccessed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterId': serializer.toJson<String>(characterId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'difficultyLevel': serializer.toJson<int>(difficultyLevel),
      'isUnlocked': serializer.toJson<bool>(isUnlocked),
      'completionPercentage': serializer.toJson<double>(completionPercentage),
      'lastAccessed': serializer.toJson<DateTime?>(lastAccessed),
    };
  }

  Lesson copyWith({
    int? id,
    String? characterId,
    String? title,
    Value<String?> description = const Value.absent(),
    int? difficultyLevel,
    bool? isUnlocked,
    double? completionPercentage,
    Value<DateTime?> lastAccessed = const Value.absent(),
  }) => Lesson(
    id: id ?? this.id,
    characterId: characterId ?? this.characterId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    difficultyLevel: difficultyLevel ?? this.difficultyLevel,
    isUnlocked: isUnlocked ?? this.isUnlocked,
    completionPercentage: completionPercentage ?? this.completionPercentage,
    lastAccessed: lastAccessed.present ? lastAccessed.value : this.lastAccessed,
  );
  Lesson copyWithCompanion(LessonsCompanion data) {
    return Lesson(
      id: data.id.present ? data.id.value : this.id,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      difficultyLevel: data.difficultyLevel.present
          ? data.difficultyLevel.value
          : this.difficultyLevel,
      isUnlocked: data.isUnlocked.present
          ? data.isUnlocked.value
          : this.isUnlocked,
      completionPercentage: data.completionPercentage.present
          ? data.completionPercentage.value
          : this.completionPercentage,
      lastAccessed: data.lastAccessed.present
          ? data.lastAccessed.value
          : this.lastAccessed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lesson(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('difficultyLevel: $difficultyLevel, ')
          ..write('isUnlocked: $isUnlocked, ')
          ..write('completionPercentage: $completionPercentage, ')
          ..write('lastAccessed: $lastAccessed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    characterId,
    title,
    description,
    difficultyLevel,
    isUnlocked,
    completionPercentage,
    lastAccessed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lesson &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.title == this.title &&
          other.description == this.description &&
          other.difficultyLevel == this.difficultyLevel &&
          other.isUnlocked == this.isUnlocked &&
          other.completionPercentage == this.completionPercentage &&
          other.lastAccessed == this.lastAccessed);
}

class LessonsCompanion extends UpdateCompanion<Lesson> {
  final Value<int> id;
  final Value<String> characterId;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> difficultyLevel;
  final Value<bool> isUnlocked;
  final Value<double> completionPercentage;
  final Value<DateTime?> lastAccessed;
  const LessonsCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.difficultyLevel = const Value.absent(),
    this.isUnlocked = const Value.absent(),
    this.completionPercentage = const Value.absent(),
    this.lastAccessed = const Value.absent(),
  });
  LessonsCompanion.insert({
    this.id = const Value.absent(),
    required String characterId,
    required String title,
    this.description = const Value.absent(),
    this.difficultyLevel = const Value.absent(),
    this.isUnlocked = const Value.absent(),
    this.completionPercentage = const Value.absent(),
    this.lastAccessed = const Value.absent(),
  }) : characterId = Value(characterId),
       title = Value(title);
  static Insertable<Lesson> custom({
    Expression<int>? id,
    Expression<String>? characterId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? difficultyLevel,
    Expression<bool>? isUnlocked,
    Expression<double>? completionPercentage,
    Expression<DateTime>? lastAccessed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterId != null) 'character_id': characterId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (difficultyLevel != null) 'difficulty_level': difficultyLevel,
      if (isUnlocked != null) 'is_unlocked': isUnlocked,
      if (completionPercentage != null)
        'completion_percentage': completionPercentage,
      if (lastAccessed != null) 'last_accessed': lastAccessed,
    });
  }

  LessonsCompanion copyWith({
    Value<int>? id,
    Value<String>? characterId,
    Value<String>? title,
    Value<String?>? description,
    Value<int>? difficultyLevel,
    Value<bool>? isUnlocked,
    Value<double>? completionPercentage,
    Value<DateTime?>? lastAccessed,
  }) {
    return LessonsCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      title: title ?? this.title,
      description: description ?? this.description,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      completionPercentage: completionPercentage ?? this.completionPercentage,
      lastAccessed: lastAccessed ?? this.lastAccessed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (difficultyLevel.present) {
      map['difficulty_level'] = Variable<int>(difficultyLevel.value);
    }
    if (isUnlocked.present) {
      map['is_unlocked'] = Variable<bool>(isUnlocked.value);
    }
    if (completionPercentage.present) {
      map['completion_percentage'] = Variable<double>(
        completionPercentage.value,
      );
    }
    if (lastAccessed.present) {
      map['last_accessed'] = Variable<DateTime>(lastAccessed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonsCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('difficultyLevel: $difficultyLevel, ')
          ..write('isUnlocked: $isUnlocked, ')
          ..write('completionPercentage: $completionPercentage, ')
          ..write('lastAccessed: $lastAccessed')
          ..write(')'))
        .toString();
  }
}

class $GameTypesTable extends GameTypes
    with TableInfo<$GameTypesTable, GameType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<int> lessonId = GeneratedColumn<int>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lessons (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconPathMeta = const VerificationMeta(
    'iconPath',
  );
  @override
  late final GeneratedColumn<String> iconPath = GeneratedColumn<String>(
    'icon_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lessonId,
    name,
    description,
    iconPath,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('icon_path')) {
      context.handle(
        _iconPathMeta,
        iconPath.isAcceptableOrUnknown(data['icon_path']!, _iconPathMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lesson_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      iconPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_path'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $GameTypesTable createAlias(String alias) {
    return $GameTypesTable(attachedDatabase, alias);
  }
}

class GameType extends DataClass implements Insertable<GameType> {
  final int id;
  final int lessonId;
  final String name;
  final String? description;
  final String? iconPath;
  final int orderIndex;
  const GameType({
    required this.id,
    required this.lessonId,
    required this.name,
    this.description,
    this.iconPath,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lesson_id'] = Variable<int>(lessonId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || iconPath != null) {
      map['icon_path'] = Variable<String>(iconPath);
    }
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  GameTypesCompanion toCompanion(bool nullToAbsent) {
    return GameTypesCompanion(
      id: Value(id),
      lessonId: Value(lessonId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      iconPath: iconPath == null && nullToAbsent
          ? const Value.absent()
          : Value(iconPath),
      orderIndex: Value(orderIndex),
    );
  }

  factory GameType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameType(
      id: serializer.fromJson<int>(json['id']),
      lessonId: serializer.fromJson<int>(json['lessonId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      iconPath: serializer.fromJson<String?>(json['iconPath']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lessonId': serializer.toJson<int>(lessonId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'iconPath': serializer.toJson<String?>(iconPath),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  GameType copyWith({
    int? id,
    int? lessonId,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> iconPath = const Value.absent(),
    int? orderIndex,
  }) => GameType(
    id: id ?? this.id,
    lessonId: lessonId ?? this.lessonId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    iconPath: iconPath.present ? iconPath.value : this.iconPath,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  GameType copyWithCompanion(GameTypesCompanion data) {
    return GameType(
      id: data.id.present ? data.id.value : this.id,
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      iconPath: data.iconPath.present ? data.iconPath.value : this.iconPath,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameType(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconPath: $iconPath, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, lessonId, name, description, iconPath, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameType &&
          other.id == this.id &&
          other.lessonId == this.lessonId &&
          other.name == this.name &&
          other.description == this.description &&
          other.iconPath == this.iconPath &&
          other.orderIndex == this.orderIndex);
}

class GameTypesCompanion extends UpdateCompanion<GameType> {
  final Value<int> id;
  final Value<int> lessonId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> iconPath;
  final Value<int> orderIndex;
  const GameTypesCompanion({
    this.id = const Value.absent(),
    this.lessonId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.iconPath = const Value.absent(),
    this.orderIndex = const Value.absent(),
  });
  GameTypesCompanion.insert({
    this.id = const Value.absent(),
    required int lessonId,
    required String name,
    this.description = const Value.absent(),
    this.iconPath = const Value.absent(),
    this.orderIndex = const Value.absent(),
  }) : lessonId = Value(lessonId),
       name = Value(name);
  static Insertable<GameType> custom({
    Expression<int>? id,
    Expression<int>? lessonId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? iconPath,
    Expression<int>? orderIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lessonId != null) 'lesson_id': lessonId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iconPath != null) 'icon_path': iconPath,
      if (orderIndex != null) 'order_index': orderIndex,
    });
  }

  GameTypesCompanion copyWith({
    Value<int>? id,
    Value<int>? lessonId,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? iconPath,
    Value<int>? orderIndex,
  }) {
    return GameTypesCompanion(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      name: name ?? this.name,
      description: description ?? this.description,
      iconPath: iconPath ?? this.iconPath,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lessonId.present) {
      map['lesson_id'] = Variable<int>(lessonId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconPath.present) {
      map['icon_path'] = Variable<String>(iconPath.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameTypesCompanion(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconPath: $iconPath, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }
}

class $GameLevelsTable extends GameLevels
    with TableInfo<$GameLevelsTable, GameLevel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameLevelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _gameTypeIdMeta = const VerificationMeta(
    'gameTypeId',
  );
  @override
  late final GeneratedColumn<int> gameTypeId = GeneratedColumn<int>(
    'game_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES game_types (id)',
    ),
  );
  static const VerificationMeta _levelNumberMeta = const VerificationMeta(
    'levelNumber',
  );
  @override
  late final GeneratedColumn<int> levelNumber = GeneratedColumn<int>(
    'level_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _starsAwardedMeta = const VerificationMeta(
    'starsAwarded',
  );
  @override
  late final GeneratedColumn<int> starsAwarded = GeneratedColumn<int>(
    'stars_awarded',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastPlayedMeta = const VerificationMeta(
    'lastPlayed',
  );
  @override
  late final GeneratedColumn<DateTime> lastPlayed = GeneratedColumn<DateTime>(
    'last_played',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gameTypeId,
    levelNumber,
    isCompleted,
    score,
    starsAwarded,
    lastPlayed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_levels';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameLevel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_type_id')) {
      context.handle(
        _gameTypeIdMeta,
        gameTypeId.isAcceptableOrUnknown(
          data['game_type_id']!,
          _gameTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_gameTypeIdMeta);
    }
    if (data.containsKey('level_number')) {
      context.handle(
        _levelNumberMeta,
        levelNumber.isAcceptableOrUnknown(
          data['level_number']!,
          _levelNumberMeta,
        ),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    if (data.containsKey('stars_awarded')) {
      context.handle(
        _starsAwardedMeta,
        starsAwarded.isAcceptableOrUnknown(
          data['stars_awarded']!,
          _starsAwardedMeta,
        ),
      );
    }
    if (data.containsKey('last_played')) {
      context.handle(
        _lastPlayedMeta,
        lastPlayed.isAcceptableOrUnknown(data['last_played']!, _lastPlayedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameLevel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameLevel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_type_id'],
      )!,
      levelNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level_number'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      starsAwarded: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stars_awarded'],
      )!,
      lastPlayed: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_played'],
      ),
    );
  }

  @override
  $GameLevelsTable createAlias(String alias) {
    return $GameLevelsTable(attachedDatabase, alias);
  }
}

class GameLevel extends DataClass implements Insertable<GameLevel> {
  final int id;
  final int gameTypeId;
  final int levelNumber;
  final bool isCompleted;
  final int score;
  final int starsAwarded;
  final DateTime? lastPlayed;
  const GameLevel({
    required this.id,
    required this.gameTypeId,
    required this.levelNumber,
    required this.isCompleted,
    required this.score,
    required this.starsAwarded,
    this.lastPlayed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_type_id'] = Variable<int>(gameTypeId);
    map['level_number'] = Variable<int>(levelNumber);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['score'] = Variable<int>(score);
    map['stars_awarded'] = Variable<int>(starsAwarded);
    if (!nullToAbsent || lastPlayed != null) {
      map['last_played'] = Variable<DateTime>(lastPlayed);
    }
    return map;
  }

  GameLevelsCompanion toCompanion(bool nullToAbsent) {
    return GameLevelsCompanion(
      id: Value(id),
      gameTypeId: Value(gameTypeId),
      levelNumber: Value(levelNumber),
      isCompleted: Value(isCompleted),
      score: Value(score),
      starsAwarded: Value(starsAwarded),
      lastPlayed: lastPlayed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPlayed),
    );
  }

  factory GameLevel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameLevel(
      id: serializer.fromJson<int>(json['id']),
      gameTypeId: serializer.fromJson<int>(json['gameTypeId']),
      levelNumber: serializer.fromJson<int>(json['levelNumber']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      score: serializer.fromJson<int>(json['score']),
      starsAwarded: serializer.fromJson<int>(json['starsAwarded']),
      lastPlayed: serializer.fromJson<DateTime?>(json['lastPlayed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameTypeId': serializer.toJson<int>(gameTypeId),
      'levelNumber': serializer.toJson<int>(levelNumber),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'score': serializer.toJson<int>(score),
      'starsAwarded': serializer.toJson<int>(starsAwarded),
      'lastPlayed': serializer.toJson<DateTime?>(lastPlayed),
    };
  }

  GameLevel copyWith({
    int? id,
    int? gameTypeId,
    int? levelNumber,
    bool? isCompleted,
    int? score,
    int? starsAwarded,
    Value<DateTime?> lastPlayed = const Value.absent(),
  }) => GameLevel(
    id: id ?? this.id,
    gameTypeId: gameTypeId ?? this.gameTypeId,
    levelNumber: levelNumber ?? this.levelNumber,
    isCompleted: isCompleted ?? this.isCompleted,
    score: score ?? this.score,
    starsAwarded: starsAwarded ?? this.starsAwarded,
    lastPlayed: lastPlayed.present ? lastPlayed.value : this.lastPlayed,
  );
  GameLevel copyWithCompanion(GameLevelsCompanion data) {
    return GameLevel(
      id: data.id.present ? data.id.value : this.id,
      gameTypeId: data.gameTypeId.present
          ? data.gameTypeId.value
          : this.gameTypeId,
      levelNumber: data.levelNumber.present
          ? data.levelNumber.value
          : this.levelNumber,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      score: data.score.present ? data.score.value : this.score,
      starsAwarded: data.starsAwarded.present
          ? data.starsAwarded.value
          : this.starsAwarded,
      lastPlayed: data.lastPlayed.present
          ? data.lastPlayed.value
          : this.lastPlayed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameLevel(')
          ..write('id: $id, ')
          ..write('gameTypeId: $gameTypeId, ')
          ..write('levelNumber: $levelNumber, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('score: $score, ')
          ..write('starsAwarded: $starsAwarded, ')
          ..write('lastPlayed: $lastPlayed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    gameTypeId,
    levelNumber,
    isCompleted,
    score,
    starsAwarded,
    lastPlayed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameLevel &&
          other.id == this.id &&
          other.gameTypeId == this.gameTypeId &&
          other.levelNumber == this.levelNumber &&
          other.isCompleted == this.isCompleted &&
          other.score == this.score &&
          other.starsAwarded == this.starsAwarded &&
          other.lastPlayed == this.lastPlayed);
}

class GameLevelsCompanion extends UpdateCompanion<GameLevel> {
  final Value<int> id;
  final Value<int> gameTypeId;
  final Value<int> levelNumber;
  final Value<bool> isCompleted;
  final Value<int> score;
  final Value<int> starsAwarded;
  final Value<DateTime?> lastPlayed;
  const GameLevelsCompanion({
    this.id = const Value.absent(),
    this.gameTypeId = const Value.absent(),
    this.levelNumber = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.score = const Value.absent(),
    this.starsAwarded = const Value.absent(),
    this.lastPlayed = const Value.absent(),
  });
  GameLevelsCompanion.insert({
    this.id = const Value.absent(),
    required int gameTypeId,
    this.levelNumber = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.score = const Value.absent(),
    this.starsAwarded = const Value.absent(),
    this.lastPlayed = const Value.absent(),
  }) : gameTypeId = Value(gameTypeId);
  static Insertable<GameLevel> custom({
    Expression<int>? id,
    Expression<int>? gameTypeId,
    Expression<int>? levelNumber,
    Expression<bool>? isCompleted,
    Expression<int>? score,
    Expression<int>? starsAwarded,
    Expression<DateTime>? lastPlayed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameTypeId != null) 'game_type_id': gameTypeId,
      if (levelNumber != null) 'level_number': levelNumber,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (score != null) 'score': score,
      if (starsAwarded != null) 'stars_awarded': starsAwarded,
      if (lastPlayed != null) 'last_played': lastPlayed,
    });
  }

  GameLevelsCompanion copyWith({
    Value<int>? id,
    Value<int>? gameTypeId,
    Value<int>? levelNumber,
    Value<bool>? isCompleted,
    Value<int>? score,
    Value<int>? starsAwarded,
    Value<DateTime?>? lastPlayed,
  }) {
    return GameLevelsCompanion(
      id: id ?? this.id,
      gameTypeId: gameTypeId ?? this.gameTypeId,
      levelNumber: levelNumber ?? this.levelNumber,
      isCompleted: isCompleted ?? this.isCompleted,
      score: score ?? this.score,
      starsAwarded: starsAwarded ?? this.starsAwarded,
      lastPlayed: lastPlayed ?? this.lastPlayed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameTypeId.present) {
      map['game_type_id'] = Variable<int>(gameTypeId.value);
    }
    if (levelNumber.present) {
      map['level_number'] = Variable<int>(levelNumber.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (starsAwarded.present) {
      map['stars_awarded'] = Variable<int>(starsAwarded.value);
    }
    if (lastPlayed.present) {
      map['last_played'] = Variable<DateTime>(lastPlayed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameLevelsCompanion(')
          ..write('id: $id, ')
          ..write('gameTypeId: $gameTypeId, ')
          ..write('levelNumber: $levelNumber, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('score: $score, ')
          ..write('starsAwarded: $starsAwarded, ')
          ..write('lastPlayed: $lastPlayed')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _wordTextMeta = const VerificationMeta(
    'wordText',
  );
  @override
  late final GeneratedColumn<String> wordText = GeneratedColumn<String>(
    'word_text',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _definitionMeta = const VerificationMeta(
    'definition',
  );
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
    'definition',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _audioUrlMeta = const VerificationMeta(
    'audioUrl',
  );
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
    'audio_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _masteryLevelMeta = const VerificationMeta(
    'masteryLevel',
  );
  @override
  late final GeneratedColumn<int> masteryLevel = GeneratedColumn<int>(
    'mastery_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastReviewedMeta = const VerificationMeta(
    'lastReviewed',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewed = GeneratedColumn<DateTime>(
    'last_reviewed',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    wordText,
    definition,
    imageUrl,
    audioUrl,
    masteryLevel,
    lastReviewed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(
    Insertable<Word> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word_text')) {
      context.handle(
        _wordTextMeta,
        wordText.isAcceptableOrUnknown(data['word_text']!, _wordTextMeta),
      );
    } else if (isInserting) {
      context.missing(_wordTextMeta);
    }
    if (data.containsKey('definition')) {
      context.handle(
        _definitionMeta,
        definition.isAcceptableOrUnknown(data['definition']!, _definitionMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('audio_url')) {
      context.handle(
        _audioUrlMeta,
        audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta),
      );
    }
    if (data.containsKey('mastery_level')) {
      context.handle(
        _masteryLevelMeta,
        masteryLevel.isAcceptableOrUnknown(
          data['mastery_level']!,
          _masteryLevelMeta,
        ),
      );
    }
    if (data.containsKey('last_reviewed')) {
      context.handle(
        _lastReviewedMeta,
        lastReviewed.isAcceptableOrUnknown(
          data['last_reviewed']!,
          _lastReviewedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      wordText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_text'],
      )!,
      definition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}definition'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      audioUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_url'],
      ),
      masteryLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mastery_level'],
      )!,
      lastReviewed: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed'],
      ),
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final String wordText;
  final String? definition;
  final String? imageUrl;
  final String? audioUrl;
  final int masteryLevel;
  final DateTime? lastReviewed;
  const Word({
    required this.id,
    required this.wordText,
    this.definition,
    this.imageUrl,
    this.audioUrl,
    required this.masteryLevel,
    this.lastReviewed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word_text'] = Variable<String>(wordText);
    if (!nullToAbsent || definition != null) {
      map['definition'] = Variable<String>(definition);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || audioUrl != null) {
      map['audio_url'] = Variable<String>(audioUrl);
    }
    map['mastery_level'] = Variable<int>(masteryLevel);
    if (!nullToAbsent || lastReviewed != null) {
      map['last_reviewed'] = Variable<DateTime>(lastReviewed);
    }
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      wordText: Value(wordText),
      definition: definition == null && nullToAbsent
          ? const Value.absent()
          : Value(definition),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      audioUrl: audioUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(audioUrl),
      masteryLevel: Value(masteryLevel),
      lastReviewed: lastReviewed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewed),
    );
  }

  factory Word.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      wordText: serializer.fromJson<String>(json['wordText']),
      definition: serializer.fromJson<String?>(json['definition']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      audioUrl: serializer.fromJson<String?>(json['audioUrl']),
      masteryLevel: serializer.fromJson<int>(json['masteryLevel']),
      lastReviewed: serializer.fromJson<DateTime?>(json['lastReviewed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wordText': serializer.toJson<String>(wordText),
      'definition': serializer.toJson<String?>(definition),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'audioUrl': serializer.toJson<String?>(audioUrl),
      'masteryLevel': serializer.toJson<int>(masteryLevel),
      'lastReviewed': serializer.toJson<DateTime?>(lastReviewed),
    };
  }

  Word copyWith({
    int? id,
    String? wordText,
    Value<String?> definition = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> audioUrl = const Value.absent(),
    int? masteryLevel,
    Value<DateTime?> lastReviewed = const Value.absent(),
  }) => Word(
    id: id ?? this.id,
    wordText: wordText ?? this.wordText,
    definition: definition.present ? definition.value : this.definition,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    audioUrl: audioUrl.present ? audioUrl.value : this.audioUrl,
    masteryLevel: masteryLevel ?? this.masteryLevel,
    lastReviewed: lastReviewed.present ? lastReviewed.value : this.lastReviewed,
  );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
      id: data.id.present ? data.id.value : this.id,
      wordText: data.wordText.present ? data.wordText.value : this.wordText,
      definition: data.definition.present
          ? data.definition.value
          : this.definition,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      masteryLevel: data.masteryLevel.present
          ? data.masteryLevel.value
          : this.masteryLevel,
      lastReviewed: data.lastReviewed.present
          ? data.lastReviewed.value
          : this.lastReviewed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('wordText: $wordText, ')
          ..write('definition: $definition, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('masteryLevel: $masteryLevel, ')
          ..write('lastReviewed: $lastReviewed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    wordText,
    definition,
    imageUrl,
    audioUrl,
    masteryLevel,
    lastReviewed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.wordText == this.wordText &&
          other.definition == this.definition &&
          other.imageUrl == this.imageUrl &&
          other.audioUrl == this.audioUrl &&
          other.masteryLevel == this.masteryLevel &&
          other.lastReviewed == this.lastReviewed);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> wordText;
  final Value<String?> definition;
  final Value<String?> imageUrl;
  final Value<String?> audioUrl;
  final Value<int> masteryLevel;
  final Value<DateTime?> lastReviewed;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.wordText = const Value.absent(),
    this.definition = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.masteryLevel = const Value.absent(),
    this.lastReviewed = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required String wordText,
    this.definition = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.masteryLevel = const Value.absent(),
    this.lastReviewed = const Value.absent(),
  }) : wordText = Value(wordText);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<String>? wordText,
    Expression<String>? definition,
    Expression<String>? imageUrl,
    Expression<String>? audioUrl,
    Expression<int>? masteryLevel,
    Expression<DateTime>? lastReviewed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wordText != null) 'word_text': wordText,
      if (definition != null) 'definition': definition,
      if (imageUrl != null) 'image_url': imageUrl,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (masteryLevel != null) 'mastery_level': masteryLevel,
      if (lastReviewed != null) 'last_reviewed': lastReviewed,
    });
  }

  WordsCompanion copyWith({
    Value<int>? id,
    Value<String>? wordText,
    Value<String?>? definition,
    Value<String?>? imageUrl,
    Value<String?>? audioUrl,
    Value<int>? masteryLevel,
    Value<DateTime?>? lastReviewed,
  }) {
    return WordsCompanion(
      id: id ?? this.id,
      wordText: wordText ?? this.wordText,
      definition: definition ?? this.definition,
      imageUrl: imageUrl ?? this.imageUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      masteryLevel: masteryLevel ?? this.masteryLevel,
      lastReviewed: lastReviewed ?? this.lastReviewed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wordText.present) {
      map['word_text'] = Variable<String>(wordText.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (masteryLevel.present) {
      map['mastery_level'] = Variable<int>(masteryLevel.value);
    }
    if (lastReviewed.present) {
      map['last_reviewed'] = Variable<DateTime>(lastReviewed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('wordText: $wordText, ')
          ..write('definition: $definition, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('masteryLevel: $masteryLevel, ')
          ..write('lastReviewed: $lastReviewed')
          ..write(')'))
        .toString();
  }
}

class $ParentTasksTable extends ParentTasks
    with TableInfo<$ParentTasksTable, ParentTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParentTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _assignedByUserIdMeta = const VerificationMeta(
    'assignedByUserId',
  );
  @override
  late final GeneratedColumn<String> assignedByUserId = GeneratedColumn<String>(
    'assigned_by_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    dueDate,
    isCompleted,
    assignedByUserId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parent_tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParentTask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('assigned_by_user_id')) {
      context.handle(
        _assignedByUserIdMeta,
        assignedByUserId.isAcceptableOrUnknown(
          data['assigned_by_user_id']!,
          _assignedByUserIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParentTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParentTask(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      assignedByUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assigned_by_user_id'],
      ),
    );
  }

  @override
  $ParentTasksTable createAlias(String alias) {
    return $ParentTasksTable(attachedDatabase, alias);
  }
}

class ParentTask extends DataClass implements Insertable<ParentTask> {
  final int id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final bool isCompleted;
  final String? assignedByUserId;
  const ParentTask({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    required this.isCompleted,
    this.assignedByUserId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    if (!nullToAbsent || assignedByUserId != null) {
      map['assigned_by_user_id'] = Variable<String>(assignedByUserId);
    }
    return map;
  }

  ParentTasksCompanion toCompanion(bool nullToAbsent) {
    return ParentTasksCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      isCompleted: Value(isCompleted),
      assignedByUserId: assignedByUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedByUserId),
    );
  }

  factory ParentTask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParentTask(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      assignedByUserId: serializer.fromJson<String?>(json['assignedByUserId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'assignedByUserId': serializer.toJson<String?>(assignedByUserId),
    };
  }

  ParentTask copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<DateTime?> dueDate = const Value.absent(),
    bool? isCompleted,
    Value<String?> assignedByUserId = const Value.absent(),
  }) => ParentTask(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    isCompleted: isCompleted ?? this.isCompleted,
    assignedByUserId: assignedByUserId.present
        ? assignedByUserId.value
        : this.assignedByUserId,
  );
  ParentTask copyWithCompanion(ParentTasksCompanion data) {
    return ParentTask(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      assignedByUserId: data.assignedByUserId.present
          ? data.assignedByUserId.value
          : this.assignedByUserId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParentTask(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dueDate: $dueDate, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('assignedByUserId: $assignedByUserId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    dueDate,
    isCompleted,
    assignedByUserId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParentTask &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.dueDate == this.dueDate &&
          other.isCompleted == this.isCompleted &&
          other.assignedByUserId == this.assignedByUserId);
}

class ParentTasksCompanion extends UpdateCompanion<ParentTask> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime?> dueDate;
  final Value<bool> isCompleted;
  final Value<String?> assignedByUserId;
  const ParentTasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.assignedByUserId = const Value.absent(),
  });
  ParentTasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.assignedByUserId = const Value.absent(),
  }) : title = Value(title);
  static Insertable<ParentTask> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? dueDate,
    Expression<bool>? isCompleted,
    Expression<String>? assignedByUserId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (dueDate != null) 'due_date': dueDate,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (assignedByUserId != null) 'assigned_by_user_id': assignedByUserId,
    });
  }

  ParentTasksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<DateTime?>? dueDate,
    Value<bool>? isCompleted,
    Value<String?>? assignedByUserId,
  }) {
    return ParentTasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
      assignedByUserId: assignedByUserId ?? this.assignedByUserId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (assignedByUserId.present) {
      map['assigned_by_user_id'] = Variable<String>(assignedByUserId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParentTasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dueDate: $dueDate, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('assignedByUserId: $assignedByUserId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $LessonsTable lessons = $LessonsTable(this);
  late final $GameTypesTable gameTypes = $GameTypesTable(this);
  late final $GameLevelsTable gameLevels = $GameLevelsTable(this);
  late final $WordsTable words = $WordsTable(this);
  late final $ParentTasksTable parentTasks = $ParentTasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    lessons,
    gameTypes,
    gameLevels,
    words,
    parentTasks,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> profilePhotoPath,
      Value<int> currentLevel,
      Value<int> starsEarned,
      Value<int> characterCoins,
      Value<DateTime?> lastLogin,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> profilePhotoPath,
      Value<int> currentLevel,
      Value<int> starsEarned,
      Value<int> characterCoins,
      Value<DateTime?> lastLogin,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentLevel => $composableBuilder(
    column: $table.currentLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get characterCoins => $composableBuilder(
    column: $table.characterCoins,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastLogin => $composableBuilder(
    column: $table.lastLogin,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentLevel => $composableBuilder(
    column: $table.currentLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get characterCoins => $composableBuilder(
    column: $table.characterCoins,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastLogin => $composableBuilder(
    column: $table.lastLogin,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentLevel => $composableBuilder(
    column: $table.currentLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => column,
  );

  GeneratedColumn<int> get characterCoins => $composableBuilder(
    column: $table.characterCoins,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastLogin =>
      $composableBuilder(column: $table.lastLogin, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<int> currentLevel = const Value.absent(),
                Value<int> starsEarned = const Value.absent(),
                Value<int> characterCoins = const Value.absent(),
                Value<DateTime?> lastLogin = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                profilePhotoPath: profilePhotoPath,
                currentLevel: currentLevel,
                starsEarned: starsEarned,
                characterCoins: characterCoins,
                lastLogin: lastLogin,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<int> currentLevel = const Value.absent(),
                Value<int> starsEarned = const Value.absent(),
                Value<int> characterCoins = const Value.absent(),
                Value<DateTime?> lastLogin = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                profilePhotoPath: profilePhotoPath,
                currentLevel: currentLevel,
                starsEarned: starsEarned,
                characterCoins: characterCoins,
                lastLogin: lastLogin,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;
typedef $$LessonsTableCreateCompanionBuilder =
    LessonsCompanion Function({
      Value<int> id,
      required String characterId,
      required String title,
      Value<String?> description,
      Value<int> difficultyLevel,
      Value<bool> isUnlocked,
      Value<double> completionPercentage,
      Value<DateTime?> lastAccessed,
    });
typedef $$LessonsTableUpdateCompanionBuilder =
    LessonsCompanion Function({
      Value<int> id,
      Value<String> characterId,
      Value<String> title,
      Value<String?> description,
      Value<int> difficultyLevel,
      Value<bool> isUnlocked,
      Value<double> completionPercentage,
      Value<DateTime?> lastAccessed,
    });

final class $$LessonsTableReferences
    extends BaseReferences<_$AppDatabase, $LessonsTable, Lesson> {
  $$LessonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GameTypesTable, List<GameType>>
  _gameTypesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.gameTypes,
    aliasName: $_aliasNameGenerator(db.lessons.id, db.gameTypes.lessonId),
  );

  $$GameTypesTableProcessedTableManager get gameTypesRefs {
    final manager = $$GameTypesTableTableManager(
      $_db,
      $_db.gameTypes,
    ).filter((f) => f.lessonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameTypesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LessonsTableFilterComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get difficultyLevel => $composableBuilder(
    column: $table.difficultyLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get completionPercentage => $composableBuilder(
    column: $table.completionPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAccessed => $composableBuilder(
    column: $table.lastAccessed,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> gameTypesRefs(
    Expression<bool> Function($$GameTypesTableFilterComposer f) f,
  ) {
    final $$GameTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameTypes,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameTypesTableFilterComposer(
            $db: $db,
            $table: $db.gameTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LessonsTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get difficultyLevel => $composableBuilder(
    column: $table.difficultyLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get completionPercentage => $composableBuilder(
    column: $table.completionPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAccessed => $composableBuilder(
    column: $table.lastAccessed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LessonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get difficultyLevel => $composableBuilder(
    column: $table.difficultyLevel,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => column,
  );

  GeneratedColumn<double> get completionPercentage => $composableBuilder(
    column: $table.completionPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastAccessed => $composableBuilder(
    column: $table.lastAccessed,
    builder: (column) => column,
  );

  Expression<T> gameTypesRefs<T extends Object>(
    Expression<T> Function($$GameTypesTableAnnotationComposer a) f,
  ) {
    final $$GameTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameTypes,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.gameTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LessonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonsTable,
          Lesson,
          $$LessonsTableFilterComposer,
          $$LessonsTableOrderingComposer,
          $$LessonsTableAnnotationComposer,
          $$LessonsTableCreateCompanionBuilder,
          $$LessonsTableUpdateCompanionBuilder,
          (Lesson, $$LessonsTableReferences),
          Lesson,
          PrefetchHooks Function({bool gameTypesRefs})
        > {
  $$LessonsTableTableManager(_$AppDatabase db, $LessonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> difficultyLevel = const Value.absent(),
                Value<bool> isUnlocked = const Value.absent(),
                Value<double> completionPercentage = const Value.absent(),
                Value<DateTime?> lastAccessed = const Value.absent(),
              }) => LessonsCompanion(
                id: id,
                characterId: characterId,
                title: title,
                description: description,
                difficultyLevel: difficultyLevel,
                isUnlocked: isUnlocked,
                completionPercentage: completionPercentage,
                lastAccessed: lastAccessed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String characterId,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<int> difficultyLevel = const Value.absent(),
                Value<bool> isUnlocked = const Value.absent(),
                Value<double> completionPercentage = const Value.absent(),
                Value<DateTime?> lastAccessed = const Value.absent(),
              }) => LessonsCompanion.insert(
                id: id,
                characterId: characterId,
                title: title,
                description: description,
                difficultyLevel: difficultyLevel,
                isUnlocked: isUnlocked,
                completionPercentage: completionPercentage,
                lastAccessed: lastAccessed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LessonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({gameTypesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (gameTypesRefs) db.gameTypes],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (gameTypesRefs)
                    await $_getPrefetchedData<Lesson, $LessonsTable, GameType>(
                      currentTable: table,
                      referencedTable: $$LessonsTableReferences
                          ._gameTypesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LessonsTableReferences(db, table, p0).gameTypesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.lessonId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LessonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonsTable,
      Lesson,
      $$LessonsTableFilterComposer,
      $$LessonsTableOrderingComposer,
      $$LessonsTableAnnotationComposer,
      $$LessonsTableCreateCompanionBuilder,
      $$LessonsTableUpdateCompanionBuilder,
      (Lesson, $$LessonsTableReferences),
      Lesson,
      PrefetchHooks Function({bool gameTypesRefs})
    >;
typedef $$GameTypesTableCreateCompanionBuilder =
    GameTypesCompanion Function({
      Value<int> id,
      required int lessonId,
      required String name,
      Value<String?> description,
      Value<String?> iconPath,
      Value<int> orderIndex,
    });
typedef $$GameTypesTableUpdateCompanionBuilder =
    GameTypesCompanion Function({
      Value<int> id,
      Value<int> lessonId,
      Value<String> name,
      Value<String?> description,
      Value<String?> iconPath,
      Value<int> orderIndex,
    });

final class $$GameTypesTableReferences
    extends BaseReferences<_$AppDatabase, $GameTypesTable, GameType> {
  $$GameTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LessonsTable _lessonIdTable(_$AppDatabase db) => db.lessons
      .createAlias($_aliasNameGenerator(db.gameTypes.lessonId, db.lessons.id));

  $$LessonsTableProcessedTableManager get lessonId {
    final $_column = $_itemColumn<int>('lesson_id')!;

    final manager = $$LessonsTableTableManager(
      $_db,
      $_db.lessons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lessonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$GameLevelsTable, List<GameLevel>>
  _gameLevelsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.gameLevels,
    aliasName: $_aliasNameGenerator(db.gameTypes.id, db.gameLevels.gameTypeId),
  );

  $$GameLevelsTableProcessedTableManager get gameLevelsRefs {
    final manager = $$GameLevelsTableTableManager(
      $_db,
      $_db.gameLevels,
    ).filter((f) => f.gameTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameLevelsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GameTypesTableFilterComposer
    extends Composer<_$AppDatabase, $GameTypesTable> {
  $$GameTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconPath => $composableBuilder(
    column: $table.iconPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$LessonsTableFilterComposer get lessonId {
    final $$LessonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableFilterComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> gameLevelsRefs(
    Expression<bool> Function($$GameLevelsTableFilterComposer f) f,
  ) {
    final $$GameLevelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameLevels,
      getReferencedColumn: (t) => t.gameTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameLevelsTableFilterComposer(
            $db: $db,
            $table: $db.gameLevels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GameTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $GameTypesTable> {
  $$GameTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconPath => $composableBuilder(
    column: $table.iconPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$LessonsTableOrderingComposer get lessonId {
    final $$LessonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableOrderingComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameTypesTable> {
  $$GameTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconPath =>
      $composableBuilder(column: $table.iconPath, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$LessonsTableAnnotationComposer get lessonId {
    final $$LessonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableAnnotationComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> gameLevelsRefs<T extends Object>(
    Expression<T> Function($$GameLevelsTableAnnotationComposer a) f,
  ) {
    final $$GameLevelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameLevels,
      getReferencedColumn: (t) => t.gameTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameLevelsTableAnnotationComposer(
            $db: $db,
            $table: $db.gameLevels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GameTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameTypesTable,
          GameType,
          $$GameTypesTableFilterComposer,
          $$GameTypesTableOrderingComposer,
          $$GameTypesTableAnnotationComposer,
          $$GameTypesTableCreateCompanionBuilder,
          $$GameTypesTableUpdateCompanionBuilder,
          (GameType, $$GameTypesTableReferences),
          GameType,
          PrefetchHooks Function({bool lessonId, bool gameLevelsRefs})
        > {
  $$GameTypesTableTableManager(_$AppDatabase db, $GameTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lessonId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> iconPath = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
              }) => GameTypesCompanion(
                id: id,
                lessonId: lessonId,
                name: name,
                description: description,
                iconPath: iconPath,
                orderIndex: orderIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lessonId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> iconPath = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
              }) => GameTypesCompanion.insert(
                id: id,
                lessonId: lessonId,
                name: name,
                description: description,
                iconPath: iconPath,
                orderIndex: orderIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lessonId = false, gameLevelsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (gameLevelsRefs) db.gameLevels],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (lessonId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lessonId,
                                referencedTable: $$GameTypesTableReferences
                                    ._lessonIdTable(db),
                                referencedColumn: $$GameTypesTableReferences
                                    ._lessonIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (gameLevelsRefs)
                    await $_getPrefetchedData<
                      GameType,
                      $GameTypesTable,
                      GameLevel
                    >(
                      currentTable: table,
                      referencedTable: $$GameTypesTableReferences
                          ._gameLevelsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GameTypesTableReferences(
                            db,
                            table,
                            p0,
                          ).gameLevelsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.gameTypeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GameTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameTypesTable,
      GameType,
      $$GameTypesTableFilterComposer,
      $$GameTypesTableOrderingComposer,
      $$GameTypesTableAnnotationComposer,
      $$GameTypesTableCreateCompanionBuilder,
      $$GameTypesTableUpdateCompanionBuilder,
      (GameType, $$GameTypesTableReferences),
      GameType,
      PrefetchHooks Function({bool lessonId, bool gameLevelsRefs})
    >;
typedef $$GameLevelsTableCreateCompanionBuilder =
    GameLevelsCompanion Function({
      Value<int> id,
      required int gameTypeId,
      Value<int> levelNumber,
      Value<bool> isCompleted,
      Value<int> score,
      Value<int> starsAwarded,
      Value<DateTime?> lastPlayed,
    });
typedef $$GameLevelsTableUpdateCompanionBuilder =
    GameLevelsCompanion Function({
      Value<int> id,
      Value<int> gameTypeId,
      Value<int> levelNumber,
      Value<bool> isCompleted,
      Value<int> score,
      Value<int> starsAwarded,
      Value<DateTime?> lastPlayed,
    });

final class $$GameLevelsTableReferences
    extends BaseReferences<_$AppDatabase, $GameLevelsTable, GameLevel> {
  $$GameLevelsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GameTypesTable _gameTypeIdTable(_$AppDatabase db) =>
      db.gameTypes.createAlias(
        $_aliasNameGenerator(db.gameLevels.gameTypeId, db.gameTypes.id),
      );

  $$GameTypesTableProcessedTableManager get gameTypeId {
    final $_column = $_itemColumn<int>('game_type_id')!;

    final manager = $$GameTypesTableTableManager(
      $_db,
      $_db.gameTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GameLevelsTableFilterComposer
    extends Composer<_$AppDatabase, $GameLevelsTable> {
  $$GameLevelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get levelNumber => $composableBuilder(
    column: $table.levelNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get starsAwarded => $composableBuilder(
    column: $table.starsAwarded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPlayed => $composableBuilder(
    column: $table.lastPlayed,
    builder: (column) => ColumnFilters(column),
  );

  $$GameTypesTableFilterComposer get gameTypeId {
    final $$GameTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameTypeId,
      referencedTable: $db.gameTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameTypesTableFilterComposer(
            $db: $db,
            $table: $db.gameTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameLevelsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameLevelsTable> {
  $$GameLevelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get levelNumber => $composableBuilder(
    column: $table.levelNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get starsAwarded => $composableBuilder(
    column: $table.starsAwarded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPlayed => $composableBuilder(
    column: $table.lastPlayed,
    builder: (column) => ColumnOrderings(column),
  );

  $$GameTypesTableOrderingComposer get gameTypeId {
    final $$GameTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameTypeId,
      referencedTable: $db.gameTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameTypesTableOrderingComposer(
            $db: $db,
            $table: $db.gameTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameLevelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameLevelsTable> {
  $$GameLevelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get levelNumber => $composableBuilder(
    column: $table.levelNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get starsAwarded => $composableBuilder(
    column: $table.starsAwarded,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPlayed => $composableBuilder(
    column: $table.lastPlayed,
    builder: (column) => column,
  );

  $$GameTypesTableAnnotationComposer get gameTypeId {
    final $$GameTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameTypeId,
      referencedTable: $db.gameTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.gameTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameLevelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameLevelsTable,
          GameLevel,
          $$GameLevelsTableFilterComposer,
          $$GameLevelsTableOrderingComposer,
          $$GameLevelsTableAnnotationComposer,
          $$GameLevelsTableCreateCompanionBuilder,
          $$GameLevelsTableUpdateCompanionBuilder,
          (GameLevel, $$GameLevelsTableReferences),
          GameLevel,
          PrefetchHooks Function({bool gameTypeId})
        > {
  $$GameLevelsTableTableManager(_$AppDatabase db, $GameLevelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameLevelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameLevelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameLevelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameTypeId = const Value.absent(),
                Value<int> levelNumber = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<int> starsAwarded = const Value.absent(),
                Value<DateTime?> lastPlayed = const Value.absent(),
              }) => GameLevelsCompanion(
                id: id,
                gameTypeId: gameTypeId,
                levelNumber: levelNumber,
                isCompleted: isCompleted,
                score: score,
                starsAwarded: starsAwarded,
                lastPlayed: lastPlayed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameTypeId,
                Value<int> levelNumber = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<int> starsAwarded = const Value.absent(),
                Value<DateTime?> lastPlayed = const Value.absent(),
              }) => GameLevelsCompanion.insert(
                id: id,
                gameTypeId: gameTypeId,
                levelNumber: levelNumber,
                isCompleted: isCompleted,
                score: score,
                starsAwarded: starsAwarded,
                lastPlayed: lastPlayed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameLevelsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({gameTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (gameTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.gameTypeId,
                                referencedTable: $$GameLevelsTableReferences
                                    ._gameTypeIdTable(db),
                                referencedColumn: $$GameLevelsTableReferences
                                    ._gameTypeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GameLevelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameLevelsTable,
      GameLevel,
      $$GameLevelsTableFilterComposer,
      $$GameLevelsTableOrderingComposer,
      $$GameLevelsTableAnnotationComposer,
      $$GameLevelsTableCreateCompanionBuilder,
      $$GameLevelsTableUpdateCompanionBuilder,
      (GameLevel, $$GameLevelsTableReferences),
      GameLevel,
      PrefetchHooks Function({bool gameTypeId})
    >;
typedef $$WordsTableCreateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      required String wordText,
      Value<String?> definition,
      Value<String?> imageUrl,
      Value<String?> audioUrl,
      Value<int> masteryLevel,
      Value<DateTime?> lastReviewed,
    });
typedef $$WordsTableUpdateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      Value<String> wordText,
      Value<String?> definition,
      Value<String?> imageUrl,
      Value<String?> audioUrl,
      Value<int> masteryLevel,
      Value<DateTime?> lastReviewed,
    });

class $$WordsTableFilterComposer extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wordText => $composableBuilder(
    column: $table.wordText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get masteryLevel => $composableBuilder(
    column: $table.masteryLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewed => $composableBuilder(
    column: $table.lastReviewed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WordsTableOrderingComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wordText => $composableBuilder(
    column: $table.wordText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get masteryLevel => $composableBuilder(
    column: $table.masteryLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewed => $composableBuilder(
    column: $table.lastReviewed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get wordText =>
      $composableBuilder(column: $table.wordText, builder: (column) => column);

  GeneratedColumn<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<int> get masteryLevel => $composableBuilder(
    column: $table.masteryLevel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReviewed => $composableBuilder(
    column: $table.lastReviewed,
    builder: (column) => column,
  );
}

class $$WordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordsTable,
          Word,
          $$WordsTableFilterComposer,
          $$WordsTableOrderingComposer,
          $$WordsTableAnnotationComposer,
          $$WordsTableCreateCompanionBuilder,
          $$WordsTableUpdateCompanionBuilder,
          (Word, BaseReferences<_$AppDatabase, $WordsTable, Word>),
          Word,
          PrefetchHooks Function()
        > {
  $$WordsTableTableManager(_$AppDatabase db, $WordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> wordText = const Value.absent(),
                Value<String?> definition = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> audioUrl = const Value.absent(),
                Value<int> masteryLevel = const Value.absent(),
                Value<DateTime?> lastReviewed = const Value.absent(),
              }) => WordsCompanion(
                id: id,
                wordText: wordText,
                definition: definition,
                imageUrl: imageUrl,
                audioUrl: audioUrl,
                masteryLevel: masteryLevel,
                lastReviewed: lastReviewed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String wordText,
                Value<String?> definition = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> audioUrl = const Value.absent(),
                Value<int> masteryLevel = const Value.absent(),
                Value<DateTime?> lastReviewed = const Value.absent(),
              }) => WordsCompanion.insert(
                id: id,
                wordText: wordText,
                definition: definition,
                imageUrl: imageUrl,
                audioUrl: audioUrl,
                masteryLevel: masteryLevel,
                lastReviewed: lastReviewed,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordsTable,
      Word,
      $$WordsTableFilterComposer,
      $$WordsTableOrderingComposer,
      $$WordsTableAnnotationComposer,
      $$WordsTableCreateCompanionBuilder,
      $$WordsTableUpdateCompanionBuilder,
      (Word, BaseReferences<_$AppDatabase, $WordsTable, Word>),
      Word,
      PrefetchHooks Function()
    >;
typedef $$ParentTasksTableCreateCompanionBuilder =
    ParentTasksCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> description,
      Value<DateTime?> dueDate,
      Value<bool> isCompleted,
      Value<String?> assignedByUserId,
    });
typedef $$ParentTasksTableUpdateCompanionBuilder =
    ParentTasksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<DateTime?> dueDate,
      Value<bool> isCompleted,
      Value<String?> assignedByUserId,
    });

class $$ParentTasksTableFilterComposer
    extends Composer<_$AppDatabase, $ParentTasksTable> {
  $$ParentTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignedByUserId => $composableBuilder(
    column: $table.assignedByUserId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ParentTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $ParentTasksTable> {
  $$ParentTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignedByUserId => $composableBuilder(
    column: $table.assignedByUserId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ParentTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParentTasksTable> {
  $$ParentTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assignedByUserId => $composableBuilder(
    column: $table.assignedByUserId,
    builder: (column) => column,
  );
}

class $$ParentTasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParentTasksTable,
          ParentTask,
          $$ParentTasksTableFilterComposer,
          $$ParentTasksTableOrderingComposer,
          $$ParentTasksTableAnnotationComposer,
          $$ParentTasksTableCreateCompanionBuilder,
          $$ParentTasksTableUpdateCompanionBuilder,
          (
            ParentTask,
            BaseReferences<_$AppDatabase, $ParentTasksTable, ParentTask>,
          ),
          ParentTask,
          PrefetchHooks Function()
        > {
  $$ParentTasksTableTableManager(_$AppDatabase db, $ParentTasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParentTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParentTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParentTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<String?> assignedByUserId = const Value.absent(),
              }) => ParentTasksCompanion(
                id: id,
                title: title,
                description: description,
                dueDate: dueDate,
                isCompleted: isCompleted,
                assignedByUserId: assignedByUserId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<String?> assignedByUserId = const Value.absent(),
              }) => ParentTasksCompanion.insert(
                id: id,
                title: title,
                description: description,
                dueDate: dueDate,
                isCompleted: isCompleted,
                assignedByUserId: assignedByUserId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ParentTasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParentTasksTable,
      ParentTask,
      $$ParentTasksTableFilterComposer,
      $$ParentTasksTableOrderingComposer,
      $$ParentTasksTableAnnotationComposer,
      $$ParentTasksTableCreateCompanionBuilder,
      $$ParentTasksTableUpdateCompanionBuilder,
      (
        ParentTask,
        BaseReferences<_$AppDatabase, $ParentTasksTable, ParentTask>,
      ),
      ParentTask,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$LessonsTableTableManager get lessons =>
      $$LessonsTableTableManager(_db, _db.lessons);
  $$GameTypesTableTableManager get gameTypes =>
      $$GameTypesTableTableManager(_db, _db.gameTypes);
  $$GameLevelsTableTableManager get gameLevels =>
      $$GameLevelsTableTableManager(_db, _db.gameLevels);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$ParentTasksTableTableManager get parentTasks =>
      $$ParentTasksTableTableManager(_db, _db.parentTasks);
}
