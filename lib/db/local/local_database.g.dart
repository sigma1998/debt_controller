// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppLocalDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppLocalDatabaseBuilder databaseBuilder(String name) =>
      _$AppLocalDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppLocalDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppLocalDatabaseBuilder(null);
}

class _$AppLocalDatabaseBuilder {
  _$AppLocalDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppLocalDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppLocalDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppLocalDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppLocalDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppLocalDatabase extends AppLocalDatabase {
  _$AppLocalDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ClientDao? _clientDaoInstance;

  DebtDao? _debtDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `debt` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `clientId` INTEGER, `itemName` TEXT, `itemColor` TEXT, `description` TEXT, `itemImages` TEXT, `startingDay` INTEGER, `startingMonth` INTEGER, `startingYear` INTEGER, `startingWhole` TEXT, `endingDay` INTEGER, `endingMonth` INTEGER, `endingYear` INTEGER, `endingWhole` TEXT, `givenMoney` INTEGER, `totalMoney` INTEGER, `isActive` INTEGER NOT NULL, `monthlyPayment` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `client` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `fullName` TEXT, `address` TEXT, `phoneNumber` TEXT, `description` TEXT, `images` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ClientDao get clientDao {
    return _clientDaoInstance ??= _$ClientDao(database, changeListener);
  }

  @override
  DebtDao get debtDao {
    return _debtDaoInstance ??= _$DebtDao(database, changeListener);
  }
}

class _$ClientDao extends ClientDao {
  _$ClientDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _clientDataInsertionAdapter = InsertionAdapter(
            database,
            'client',
            (ClientData item) => <String, Object?>{
                  'id': item.id,
                  'fullName': item.fullName,
                  'address': item.address,
                  'phoneNumber': item.phoneNumber,
                  'description': item.description,
                  'images': item.images
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ClientData> _clientDataInsertionAdapter;

  @override
  Stream<List<ClientData>> getAll() {
    return _queryAdapter.queryListStream('select * from client',
        mapper: (Map<String, Object?> row) => ClientData(
            fullName: row['fullName'] as String?,
            address: row['address'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            description: row['description'] as String?,
            images: row['images'] as String?),
        queryableName: 'client',
        isView: false);
  }

  @override
  Future<void> insert(ClientData data) async {
    await _clientDataInsertionAdapter.insert(data, OnConflictStrategy.replace);
  }
}

class _$DebtDao extends DebtDao {
  _$DebtDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<DebtModel>> getAll(int id) async {
    return _queryAdapter.queryList('select * from debt where clientId =?1',
        mapper: (Map<String, Object?> row) => DebtModel(), arguments: [id]);
  }
}
