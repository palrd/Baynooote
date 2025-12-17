// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class Categories extends Table with TableInfo<Categories, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Categories(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _iconPathMeta = const VerificationMeta(
    'iconPath',
  );
  late final GeneratedColumn<String> iconPath = GeneratedColumn<String>(
    'icon_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, iconPath, type, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_path')) {
      context.handle(
        _iconPathMeta,
        iconPath.isAcceptableOrUnknown(data['icon_path']!, _iconPathMeta),
      );
    } else if (isInserting) {
      context.missing(_iconPathMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      iconPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_path'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  Categories createAlias(String alias) {
    return Categories(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final String iconPath;
  final int type;

  /// 0支出 1收入
  final int sortOrder;
  const Category({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.type,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon_path'] = Variable<String>(iconPath);
    map['type'] = Variable<int>(type);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      iconPath: Value(iconPath),
      type: Value(type),
      sortOrder: Value(sortOrder),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      iconPath: serializer.fromJson<String>(json['icon_path']),
      type: serializer.fromJson<int>(json['type']),
      sortOrder: serializer.fromJson<int>(json['sort_order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon_path': serializer.toJson<String>(iconPath),
      'type': serializer.toJson<int>(type),
      'sort_order': serializer.toJson<int>(sortOrder),
    };
  }

  Category copyWith({
    int? id,
    String? name,
    String? iconPath,
    int? type,
    int? sortOrder,
  }) => Category(
    id: id ?? this.id,
    name: name ?? this.name,
    iconPath: iconPath ?? this.iconPath,
    type: type ?? this.type,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      iconPath: data.iconPath.present ? data.iconPath.value : this.iconPath,
      type: data.type.present ? data.type.value : this.type,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconPath: $iconPath, ')
          ..write('type: $type, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, iconPath, type, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.iconPath == this.iconPath &&
          other.type == this.type &&
          other.sortOrder == this.sortOrder);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> iconPath;
  final Value<int> type;
  final Value<int> sortOrder;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.iconPath = const Value.absent(),
    this.type = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String iconPath,
    required int type,
    this.sortOrder = const Value.absent(),
  }) : name = Value(name),
       iconPath = Value(iconPath),
       type = Value(type);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? iconPath,
    Expression<int>? type,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (iconPath != null) 'icon_path': iconPath,
      if (type != null) 'type': type,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? iconPath,
    Value<int>? type,
    Value<int>? sortOrder,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      type: type ?? this.type,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconPath.present) {
      map['icon_path'] = Variable<String>(iconPath.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconPath: $iconPath, ')
          ..write('type: $type, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

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
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _recordTypeMeta = const VerificationMeta(
    'recordType',
  );
  late final GeneratedColumn<int> recordType = GeneratedColumn<int>(
    'record_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
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
    recordType,
    recordTime,
    title,
    categoryId,
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
    if (data.containsKey('record_type')) {
      context.handle(
        _recordTypeMeta,
        recordType.isAcceptableOrUnknown(data['record_type']!, _recordTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_recordTypeMeta);
    }
    if (data.containsKey('record_time')) {
      context.handle(
        _recordTimeMeta,
        recordTime.isAcceptableOrUnknown(data['record_time']!, _recordTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_recordTimeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
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
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      recordType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}record_type'],
      )!,
      recordTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}record_time'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
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
  final int amount;

  /// 或者用 INT 存“分”
  final int recordType;

  /// 0支出 1收入
  final DateTime recordTime;
  final String? title;

  /// 可为空
  final int categoryId;
  const Ledger({
    required this.id,
    required this.amount,
    required this.recordType,
    required this.recordTime,
    this.title,
    required this.categoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['record_type'] = Variable<int>(recordType);
    map['record_time'] = Variable<DateTime>(recordTime);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  LedgersCompanion toCompanion(bool nullToAbsent) {
    return LedgersCompanion(
      id: Value(id),
      amount: Value(amount),
      recordType: Value(recordType),
      recordTime: Value(recordTime),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      categoryId: Value(categoryId),
    );
  }

  factory Ledger.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ledger(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      recordType: serializer.fromJson<int>(json['record_type']),
      recordTime: serializer.fromJson<DateTime>(json['record_time']),
      title: serializer.fromJson<String?>(json['title']),
      categoryId: serializer.fromJson<int>(json['category_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'record_type': serializer.toJson<int>(recordType),
      'record_time': serializer.toJson<DateTime>(recordTime),
      'title': serializer.toJson<String?>(title),
      'category_id': serializer.toJson<int>(categoryId),
    };
  }

  Ledger copyWith({
    int? id,
    int? amount,
    int? recordType,
    DateTime? recordTime,
    Value<String?> title = const Value.absent(),
    int? categoryId,
  }) => Ledger(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    recordType: recordType ?? this.recordType,
    recordTime: recordTime ?? this.recordTime,
    title: title.present ? title.value : this.title,
    categoryId: categoryId ?? this.categoryId,
  );
  Ledger copyWithCompanion(LedgersCompanion data) {
    return Ledger(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      recordType: data.recordType.present
          ? data.recordType.value
          : this.recordType,
      recordTime: data.recordTime.present
          ? data.recordTime.value
          : this.recordTime,
      title: data.title.present ? data.title.value : this.title,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ledger(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('recordType: $recordType, ')
          ..write('recordTime: $recordTime, ')
          ..write('title: $title, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, amount, recordType, recordTime, title, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ledger &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.recordType == this.recordType &&
          other.recordTime == this.recordTime &&
          other.title == this.title &&
          other.categoryId == this.categoryId);
}

class LedgersCompanion extends UpdateCompanion<Ledger> {
  final Value<int> id;
  final Value<int> amount;
  final Value<int> recordType;
  final Value<DateTime> recordTime;
  final Value<String?> title;
  final Value<int> categoryId;
  const LedgersCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.recordType = const Value.absent(),
    this.recordTime = const Value.absent(),
    this.title = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  LedgersCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    required int recordType,
    required DateTime recordTime,
    this.title = const Value.absent(),
    required int categoryId,
  }) : amount = Value(amount),
       recordType = Value(recordType),
       recordTime = Value(recordTime),
       categoryId = Value(categoryId);
  static Insertable<Ledger> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<int>? recordType,
    Expression<DateTime>? recordTime,
    Expression<String>? title,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (recordType != null) 'record_type': recordType,
      if (recordTime != null) 'record_time': recordTime,
      if (title != null) 'title': title,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  LedgersCompanion copyWith({
    Value<int>? id,
    Value<int>? amount,
    Value<int>? recordType,
    Value<DateTime>? recordTime,
    Value<String?>? title,
    Value<int>? categoryId,
  }) {
    return LedgersCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      recordType: recordType ?? this.recordType,
      recordTime: recordTime ?? this.recordTime,
      title: title ?? this.title,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (recordType.present) {
      map['record_type'] = Variable<int>(recordType.value);
    }
    if (recordTime.present) {
      map['record_time'] = Variable<DateTime>(recordTime.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LedgersCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('recordType: $recordType, ')
          ..write('recordTime: $recordTime, ')
          ..write('title: $title, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class LedgerBlocks extends Table with TableInfo<LedgerBlocks, LedgerBlock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LedgerBlocks(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _ledgerIdMeta = const VerificationMeta(
    'ledgerId',
  );
  late final GeneratedColumn<int> ledgerId = GeneratedColumn<int>(
    'ledger_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _blockTypeMeta = const VerificationMeta(
    'blockType',
  );
  late final GeneratedColumn<int> blockType = GeneratedColumn<int>(
    'block_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _sortIndexMeta = const VerificationMeta(
    'sortIndex',
  );
  late final GeneratedColumn<int> sortIndex = GeneratedColumn<int>(
    'sort_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _metaDataMeta = const VerificationMeta(
    'metaData',
  );
  late final GeneratedColumn<String> metaData = GeneratedColumn<String>(
    'meta_data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ledgerId,
    blockType,
    content,
    sortIndex,
    metaData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ledger_blocks';
  @override
  VerificationContext validateIntegrity(
    Insertable<LedgerBlock> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ledger_id')) {
      context.handle(
        _ledgerIdMeta,
        ledgerId.isAcceptableOrUnknown(data['ledger_id']!, _ledgerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ledgerIdMeta);
    }
    if (data.containsKey('block_type')) {
      context.handle(
        _blockTypeMeta,
        blockType.isAcceptableOrUnknown(data['block_type']!, _blockTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_blockTypeMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('sort_index')) {
      context.handle(
        _sortIndexMeta,
        sortIndex.isAcceptableOrUnknown(data['sort_index']!, _sortIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_sortIndexMeta);
    }
    if (data.containsKey('meta_data')) {
      context.handle(
        _metaDataMeta,
        metaData.isAcceptableOrUnknown(data['meta_data']!, _metaDataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LedgerBlock map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LedgerBlock(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ledgerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ledger_id'],
      )!,
      blockType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}block_type'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      sortIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_index'],
      )!,
      metaData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meta_data'],
      ),
    );
  }

  @override
  LedgerBlocks createAlias(String alias) {
    return LedgerBlocks(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class LedgerBlock extends DataClass implements Insertable<LedgerBlock> {
  final int id;
  final int ledgerId;
  final int blockType;

  /// 0:Text, 1:Image, 2:Video, 3:Audio
  final String content;

  /// 文字内容 或 文件路径
  final int sortIndex;

  /// 排版顺序
  final String? metaData;
  const LedgerBlock({
    required this.id,
    required this.ledgerId,
    required this.blockType,
    required this.content,
    required this.sortIndex,
    this.metaData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ledger_id'] = Variable<int>(ledgerId);
    map['block_type'] = Variable<int>(blockType);
    map['content'] = Variable<String>(content);
    map['sort_index'] = Variable<int>(sortIndex);
    if (!nullToAbsent || metaData != null) {
      map['meta_data'] = Variable<String>(metaData);
    }
    return map;
  }

  LedgerBlocksCompanion toCompanion(bool nullToAbsent) {
    return LedgerBlocksCompanion(
      id: Value(id),
      ledgerId: Value(ledgerId),
      blockType: Value(blockType),
      content: Value(content),
      sortIndex: Value(sortIndex),
      metaData: metaData == null && nullToAbsent
          ? const Value.absent()
          : Value(metaData),
    );
  }

  factory LedgerBlock.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LedgerBlock(
      id: serializer.fromJson<int>(json['id']),
      ledgerId: serializer.fromJson<int>(json['ledger_id']),
      blockType: serializer.fromJson<int>(json['block_type']),
      content: serializer.fromJson<String>(json['content']),
      sortIndex: serializer.fromJson<int>(json['sort_index']),
      metaData: serializer.fromJson<String?>(json['meta_data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ledger_id': serializer.toJson<int>(ledgerId),
      'block_type': serializer.toJson<int>(blockType),
      'content': serializer.toJson<String>(content),
      'sort_index': serializer.toJson<int>(sortIndex),
      'meta_data': serializer.toJson<String?>(metaData),
    };
  }

  LedgerBlock copyWith({
    int? id,
    int? ledgerId,
    int? blockType,
    String? content,
    int? sortIndex,
    Value<String?> metaData = const Value.absent(),
  }) => LedgerBlock(
    id: id ?? this.id,
    ledgerId: ledgerId ?? this.ledgerId,
    blockType: blockType ?? this.blockType,
    content: content ?? this.content,
    sortIndex: sortIndex ?? this.sortIndex,
    metaData: metaData.present ? metaData.value : this.metaData,
  );
  LedgerBlock copyWithCompanion(LedgerBlocksCompanion data) {
    return LedgerBlock(
      id: data.id.present ? data.id.value : this.id,
      ledgerId: data.ledgerId.present ? data.ledgerId.value : this.ledgerId,
      blockType: data.blockType.present ? data.blockType.value : this.blockType,
      content: data.content.present ? data.content.value : this.content,
      sortIndex: data.sortIndex.present ? data.sortIndex.value : this.sortIndex,
      metaData: data.metaData.present ? data.metaData.value : this.metaData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LedgerBlock(')
          ..write('id: $id, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('blockType: $blockType, ')
          ..write('content: $content, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('metaData: $metaData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ledgerId, blockType, content, sortIndex, metaData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LedgerBlock &&
          other.id == this.id &&
          other.ledgerId == this.ledgerId &&
          other.blockType == this.blockType &&
          other.content == this.content &&
          other.sortIndex == this.sortIndex &&
          other.metaData == this.metaData);
}

class LedgerBlocksCompanion extends UpdateCompanion<LedgerBlock> {
  final Value<int> id;
  final Value<int> ledgerId;
  final Value<int> blockType;
  final Value<String> content;
  final Value<int> sortIndex;
  final Value<String?> metaData;
  const LedgerBlocksCompanion({
    this.id = const Value.absent(),
    this.ledgerId = const Value.absent(),
    this.blockType = const Value.absent(),
    this.content = const Value.absent(),
    this.sortIndex = const Value.absent(),
    this.metaData = const Value.absent(),
  });
  LedgerBlocksCompanion.insert({
    this.id = const Value.absent(),
    required int ledgerId,
    required int blockType,
    required String content,
    required int sortIndex,
    this.metaData = const Value.absent(),
  }) : ledgerId = Value(ledgerId),
       blockType = Value(blockType),
       content = Value(content),
       sortIndex = Value(sortIndex);
  static Insertable<LedgerBlock> custom({
    Expression<int>? id,
    Expression<int>? ledgerId,
    Expression<int>? blockType,
    Expression<String>? content,
    Expression<int>? sortIndex,
    Expression<String>? metaData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ledgerId != null) 'ledger_id': ledgerId,
      if (blockType != null) 'block_type': blockType,
      if (content != null) 'content': content,
      if (sortIndex != null) 'sort_index': sortIndex,
      if (metaData != null) 'meta_data': metaData,
    });
  }

  LedgerBlocksCompanion copyWith({
    Value<int>? id,
    Value<int>? ledgerId,
    Value<int>? blockType,
    Value<String>? content,
    Value<int>? sortIndex,
    Value<String?>? metaData,
  }) {
    return LedgerBlocksCompanion(
      id: id ?? this.id,
      ledgerId: ledgerId ?? this.ledgerId,
      blockType: blockType ?? this.blockType,
      content: content ?? this.content,
      sortIndex: sortIndex ?? this.sortIndex,
      metaData: metaData ?? this.metaData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ledgerId.present) {
      map['ledger_id'] = Variable<int>(ledgerId.value);
    }
    if (blockType.present) {
      map['block_type'] = Variable<int>(blockType.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (sortIndex.present) {
      map['sort_index'] = Variable<int>(sortIndex.value);
    }
    if (metaData.present) {
      map['meta_data'] = Variable<String>(metaData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LedgerBlocksCompanion(')
          ..write('id: $id, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('blockType: $blockType, ')
          ..write('content: $content, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('metaData: $metaData')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Categories categories = Categories(this);
  late final Ledgers ledgers = Ledgers(this);
  late final LedgerBlocks ledgerBlocks = LedgerBlocks(this);
  late final Index idxLedgersTime = Index(
    'idx_ledgers_time',
    'CREATE INDEX idx_ledgers_time ON ledgers (record_time)',
  );
  late final Index idxBlocksLedger = Index(
    'idx_blocks_ledger',
    'CREATE INDEX idx_blocks_ledger ON ledger_blocks (ledger_id)',
  );
  Selectable<GetAllLedgersWithCategoryResult> getAllLedgersWithCategory() {
    return customSelect(
      'SELECT l.*, c.name AS category_name, c.icon_path FROM ledgers AS l INNER JOIN categories AS c ON l.category_id = c.id ORDER BY l.record_time DESC',
      variables: [],
      readsFrom: {categories, ledgers},
    ).map(
      (QueryRow row) => GetAllLedgersWithCategoryResult(
        id: row.read<int>('id'),
        amount: row.read<int>('amount'),
        recordType: row.read<int>('record_type'),
        recordTime: row.read<DateTime>('record_time'),
        title: row.readNullable<String>('title'),
        categoryId: row.read<int>('category_id'),
        categoryName: row.read<String>('category_name'),
        iconPath: row.read<String>('icon_path'),
      ),
    );
  }

  Selectable<LedgerBlock> getBlocksByLedgerId(int ledgerId) {
    return customSelect(
      'SELECT * FROM ledger_blocks WHERE ledger_id = ?1 ORDER BY sort_index ASC',
      variables: [Variable<int>(ledgerId)],
      readsFrom: {ledgerBlocks},
    ).asyncMap(ledgerBlocks.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    ledgers,
    ledgerBlocks,
    idxLedgersTime,
    idxBlocksLedger,
  ];
}

typedef $CategoriesCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required String name,
      required String iconPath,
      required int type,
      Value<int> sortOrder,
    });
typedef $CategoriesUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> iconPath,
      Value<int> type,
      Value<int> sortOrder,
    });

class $CategoriesFilterComposer extends Composer<_$AppDatabase, Categories> {
  $CategoriesFilterComposer({
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

  ColumnFilters<String> get iconPath => $composableBuilder(
    column: $table.iconPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $CategoriesOrderingComposer extends Composer<_$AppDatabase, Categories> {
  $CategoriesOrderingComposer({
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

  ColumnOrderings<String> get iconPath => $composableBuilder(
    column: $table.iconPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CategoriesAnnotationComposer
    extends Composer<_$AppDatabase, Categories> {
  $CategoriesAnnotationComposer({
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

  GeneratedColumn<String> get iconPath =>
      $composableBuilder(column: $table.iconPath, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $CategoriesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Categories,
          Category,
          $CategoriesFilterComposer,
          $CategoriesOrderingComposer,
          $CategoriesAnnotationComposer,
          $CategoriesCreateCompanionBuilder,
          $CategoriesUpdateCompanionBuilder,
          (Category, BaseReferences<_$AppDatabase, Categories, Category>),
          Category,
          PrefetchHooks Function()
        > {
  $CategoriesTableManager(_$AppDatabase db, Categories table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CategoriesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CategoriesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CategoriesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> iconPath = const Value.absent(),
                Value<int> type = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                iconPath: iconPath,
                type: type,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String iconPath,
                required int type,
                Value<int> sortOrder = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                iconPath: iconPath,
                type: type,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CategoriesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Categories,
      Category,
      $CategoriesFilterComposer,
      $CategoriesOrderingComposer,
      $CategoriesAnnotationComposer,
      $CategoriesCreateCompanionBuilder,
      $CategoriesUpdateCompanionBuilder,
      (Category, BaseReferences<_$AppDatabase, Categories, Category>),
      Category,
      PrefetchHooks Function()
    >;
typedef $LedgersCreateCompanionBuilder =
    LedgersCompanion Function({
      Value<int> id,
      required int amount,
      required int recordType,
      required DateTime recordTime,
      Value<String?> title,
      required int categoryId,
    });
typedef $LedgersUpdateCompanionBuilder =
    LedgersCompanion Function({
      Value<int> id,
      Value<int> amount,
      Value<int> recordType,
      Value<DateTime> recordTime,
      Value<String?> title,
      Value<int> categoryId,
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

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordTime => $composableBuilder(
    column: $table.recordTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
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

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordTime => $composableBuilder(
    column: $table.recordTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
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

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordTime => $composableBuilder(
    column: $table.recordTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );
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
                Value<int> amount = const Value.absent(),
                Value<int> recordType = const Value.absent(),
                Value<DateTime> recordTime = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
              }) => LedgersCompanion(
                id: id,
                amount: amount,
                recordType: recordType,
                recordTime: recordTime,
                title: title,
                categoryId: categoryId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int amount,
                required int recordType,
                required DateTime recordTime,
                Value<String?> title = const Value.absent(),
                required int categoryId,
              }) => LedgersCompanion.insert(
                id: id,
                amount: amount,
                recordType: recordType,
                recordTime: recordTime,
                title: title,
                categoryId: categoryId,
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
typedef $LedgerBlocksCreateCompanionBuilder =
    LedgerBlocksCompanion Function({
      Value<int> id,
      required int ledgerId,
      required int blockType,
      required String content,
      required int sortIndex,
      Value<String?> metaData,
    });
typedef $LedgerBlocksUpdateCompanionBuilder =
    LedgerBlocksCompanion Function({
      Value<int> id,
      Value<int> ledgerId,
      Value<int> blockType,
      Value<String> content,
      Value<int> sortIndex,
      Value<String?> metaData,
    });

class $LedgerBlocksFilterComposer
    extends Composer<_$AppDatabase, LedgerBlocks> {
  $LedgerBlocksFilterComposer({
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

  ColumnFilters<int> get ledgerId => $composableBuilder(
    column: $table.ledgerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get blockType => $composableBuilder(
    column: $table.blockType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metaData => $composableBuilder(
    column: $table.metaData,
    builder: (column) => ColumnFilters(column),
  );
}

class $LedgerBlocksOrderingComposer
    extends Composer<_$AppDatabase, LedgerBlocks> {
  $LedgerBlocksOrderingComposer({
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

  ColumnOrderings<int> get ledgerId => $composableBuilder(
    column: $table.ledgerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get blockType => $composableBuilder(
    column: $table.blockType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metaData => $composableBuilder(
    column: $table.metaData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $LedgerBlocksAnnotationComposer
    extends Composer<_$AppDatabase, LedgerBlocks> {
  $LedgerBlocksAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get ledgerId =>
      $composableBuilder(column: $table.ledgerId, builder: (column) => column);

  GeneratedColumn<int> get blockType =>
      $composableBuilder(column: $table.blockType, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get sortIndex =>
      $composableBuilder(column: $table.sortIndex, builder: (column) => column);

  GeneratedColumn<String> get metaData =>
      $composableBuilder(column: $table.metaData, builder: (column) => column);
}

class $LedgerBlocksTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          LedgerBlocks,
          LedgerBlock,
          $LedgerBlocksFilterComposer,
          $LedgerBlocksOrderingComposer,
          $LedgerBlocksAnnotationComposer,
          $LedgerBlocksCreateCompanionBuilder,
          $LedgerBlocksUpdateCompanionBuilder,
          (
            LedgerBlock,
            BaseReferences<_$AppDatabase, LedgerBlocks, LedgerBlock>,
          ),
          LedgerBlock,
          PrefetchHooks Function()
        > {
  $LedgerBlocksTableManager(_$AppDatabase db, LedgerBlocks table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $LedgerBlocksFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $LedgerBlocksOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $LedgerBlocksAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> ledgerId = const Value.absent(),
                Value<int> blockType = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<int> sortIndex = const Value.absent(),
                Value<String?> metaData = const Value.absent(),
              }) => LedgerBlocksCompanion(
                id: id,
                ledgerId: ledgerId,
                blockType: blockType,
                content: content,
                sortIndex: sortIndex,
                metaData: metaData,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int ledgerId,
                required int blockType,
                required String content,
                required int sortIndex,
                Value<String?> metaData = const Value.absent(),
              }) => LedgerBlocksCompanion.insert(
                id: id,
                ledgerId: ledgerId,
                blockType: blockType,
                content: content,
                sortIndex: sortIndex,
                metaData: metaData,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $LedgerBlocksProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      LedgerBlocks,
      LedgerBlock,
      $LedgerBlocksFilterComposer,
      $LedgerBlocksOrderingComposer,
      $LedgerBlocksAnnotationComposer,
      $LedgerBlocksCreateCompanionBuilder,
      $LedgerBlocksUpdateCompanionBuilder,
      (LedgerBlock, BaseReferences<_$AppDatabase, LedgerBlocks, LedgerBlock>),
      LedgerBlock,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $CategoriesTableManager get categories =>
      $CategoriesTableManager(_db, _db.categories);
  $LedgersTableManager get ledgers => $LedgersTableManager(_db, _db.ledgers);
  $LedgerBlocksTableManager get ledgerBlocks =>
      $LedgerBlocksTableManager(_db, _db.ledgerBlocks);
}

class GetAllLedgersWithCategoryResult {
  final int id;
  final int amount;
  final int recordType;
  final DateTime recordTime;
  final String? title;
  final int categoryId;
  final String categoryName;
  final String iconPath;
  GetAllLedgersWithCategoryResult({
    required this.id,
    required this.amount,
    required this.recordType,
    required this.recordTime,
    this.title,
    required this.categoryId,
    required this.categoryName,
    required this.iconPath,
  });
}
