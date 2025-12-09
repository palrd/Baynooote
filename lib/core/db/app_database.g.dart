// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class Ledgers extends Table with TableInfo<Ledgers, Ledger> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Ledgers(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _recordTimeMeta = const VerificationMeta(
    'recordTime',
  );
  late final GeneratedColumn<DateTime> recordTime = GeneratedColumn<DateTime>(
    'record_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    amount,
    categoryName,
    note,
    recordTime,
    type,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ledgers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ledger> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('record_time')) {
      context.handle(
        _recordTimeMeta,
        recordTime.isAcceptableOrUnknown(data['record_time']!, _recordTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_recordTimeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ledger map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ledger(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      categoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_name'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      recordTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}record_time'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  Ledgers createAlias(String alias) {
    return Ledgers(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Ledger extends DataClass implements Insertable<Ledger> {
  final int id;
  final double amount;
  final String categoryName;
  final String? note;
  final DateTime recordTime;
  final int type;
  const Ledger({
    required this.id,
    required this.amount,
    required this.categoryName,
    this.note,
    required this.recordTime,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['category_name'] = Variable<String>(categoryName);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['record_time'] = Variable<DateTime>(recordTime);
    map['type'] = Variable<int>(type);
    return map;
  }

  LedgersCompanion toCompanion(bool nullToAbsent) {
    return LedgersCompanion(
      id: Value(id),
      amount: Value(amount),
      categoryName: Value(categoryName),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      recordTime: Value(recordTime),
      type: Value(type),
    );
  }

  factory Ledger.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ledger(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      categoryName: serializer.fromJson<String>(json['category_name']),
      note: serializer.fromJson<String?>(json['note']),
      recordTime: serializer.fromJson<DateTime>(json['record_time']),
      type: serializer.fromJson<int>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'category_name': serializer.toJson<String>(categoryName),
      'note': serializer.toJson<String?>(note),
      'record_time': serializer.toJson<DateTime>(recordTime),
      'type': serializer.toJson<int>(type),
    };
  }

  Ledger copyWith({
    int? id,
    double? amount,
    String? categoryName,
    Value<String?> note = const Value.absent(),
    DateTime? recordTime,
    int? type,
  }) => Ledger(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    categoryName: categoryName ?? this.categoryName,
    note: note.present ? note.value : this.note,
    recordTime: recordTime ?? this.recordTime,
    type: type ?? this.type,
  );
  Ledger copyWithCompanion(LedgersCompanion data) {
    return Ledger(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
      note: data.note.present ? data.note.value : this.note,
      recordTime: data.recordTime.present
          ? data.recordTime.value
          : this.recordTime,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ledger(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('categoryName: $categoryName, ')
          ..write('note: $note, ')
          ..write('recordTime: $recordTime, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, amount, categoryName, note, recordTime, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ledger &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.categoryName == this.categoryName &&
          other.note == this.note &&
          other.recordTime == this.recordTime &&
          other.type == this.type);
}

class LedgersCompanion extends UpdateCompanion<Ledger> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String> categoryName;
  final Value<String?> note;
  final Value<DateTime> recordTime;
  final Value<int> type;
  const LedgersCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.note = const Value.absent(),
    this.recordTime = const Value.absent(),
    this.type = const Value.absent(),
  });
  LedgersCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required String categoryName,
    this.note = const Value.absent(),
    required DateTime recordTime,
    required int type,
  }) : amount = Value(amount),
       categoryName = Value(categoryName),
       recordTime = Value(recordTime),
       type = Value(type);
  static Insertable<Ledger> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<String>? categoryName,
    Expression<String>? note,
    Expression<DateTime>? recordTime,
    Expression<int>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (categoryName != null) 'category_name': categoryName,
      if (note != null) 'note': note,
      if (recordTime != null) 'record_time': recordTime,
      if (type != null) 'type': type,
    });
  }

  LedgersCompanion copyWith({
    Value<int>? id,
    Value<double>? amount,
    Value<String>? categoryName,
    Value<String?>? note,
    Value<DateTime>? recordTime,
    Value<int>? type,
  }) {
    return LedgersCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      categoryName: categoryName ?? this.categoryName,
      note: note ?? this.note,
      recordTime: recordTime ?? this.recordTime,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (recordTime.present) {
      map['record_time'] = Variable<DateTime>(recordTime.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LedgersCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('categoryName: $categoryName, ')
          ..write('note: $note, ')
          ..write('recordTime: $recordTime, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Ledgers ledgers = Ledgers(this);
  Selectable<Ledger> getAllLedgers() {
    return customSelect(
      'SELECT * FROM ledgers ORDER BY record_time DESC',
      variables: [],
      readsFrom: {ledgers},
    ).asyncMap(ledgers.mapFromRow);
  }

  Selectable<double?> getMonthExpenses(DateTime start, DateTime end) {
    return customSelect(
      'SELECT SUM(amount) AS _c0 FROM ledgers WHERE type = 0 AND record_time BETWEEN ?1 AND ?2',
      variables: [Variable<DateTime>(start), Variable<DateTime>(end)],
      readsFrom: {ledgers},
    ).map((QueryRow row) => row.readNullable<double>('_c0'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [ledgers];
}

typedef $LedgersCreateCompanionBuilder =
    LedgersCompanion Function({
      Value<int> id,
      required double amount,
      required String categoryName,
      Value<String?> note,
      required DateTime recordTime,
      required int type,
    });
typedef $LedgersUpdateCompanionBuilder =
    LedgersCompanion Function({
      Value<int> id,
      Value<double> amount,
      Value<String> categoryName,
      Value<String?> note,
      Value<DateTime> recordTime,
      Value<int> type,
    });

class $LedgersFilterComposer extends Composer<_$AppDatabase, Ledgers> {
  $LedgersFilterComposer({
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

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordTime => $composableBuilder(
    column: $table.recordTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );
}

class $LedgersOrderingComposer extends Composer<_$AppDatabase, Ledgers> {
  $LedgersOrderingComposer({
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

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordTime => $composableBuilder(
    column: $table.recordTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $LedgersAnnotationComposer extends Composer<_$AppDatabase, Ledgers> {
  $LedgersAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get recordTime => $composableBuilder(
    column: $table.recordTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $LedgersTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Ledgers,
          Ledger,
          $LedgersFilterComposer,
          $LedgersOrderingComposer,
          $LedgersAnnotationComposer,
          $LedgersCreateCompanionBuilder,
          $LedgersUpdateCompanionBuilder,
          (Ledger, BaseReferences<_$AppDatabase, Ledgers, Ledger>),
          Ledger,
          PrefetchHooks Function()
        > {
  $LedgersTableManager(_$AppDatabase db, Ledgers table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $LedgersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $LedgersOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $LedgersAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> categoryName = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> recordTime = const Value.absent(),
                Value<int> type = const Value.absent(),
              }) => LedgersCompanion(
                id: id,
                amount: amount,
                categoryName: categoryName,
                note: note,
                recordTime: recordTime,
                type: type,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double amount,
                required String categoryName,
                Value<String?> note = const Value.absent(),
                required DateTime recordTime,
                required int type,
              }) => LedgersCompanion.insert(
                id: id,
                amount: amount,
                categoryName: categoryName,
                note: note,
                recordTime: recordTime,
                type: type,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $LedgersProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Ledgers,
      Ledger,
      $LedgersFilterComposer,
      $LedgersOrderingComposer,
      $LedgersAnnotationComposer,
      $LedgersCreateCompanionBuilder,
      $LedgersUpdateCompanionBuilder,
      (Ledger, BaseReferences<_$AppDatabase, Ledgers, Ledger>),
      Ledger,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $LedgersTableManager get ledgers => $LedgersTableManager(_db, _db.ledgers);
}
