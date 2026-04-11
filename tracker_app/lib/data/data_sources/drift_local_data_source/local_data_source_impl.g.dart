// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_data_source_impl.dart';

// ignore_for_file: type=lint
class $TrackingEntitiesTableTable extends TrackingEntitiesTable
    with TableInfo<$TrackingEntitiesTableTable, TrackingEntitiesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackingEntitiesTableTable(this.attachedDatabase, [this._alias]);
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
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TrackingDatatype, int> datatype =
      GeneratedColumn<int>(
        'datatype',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TrackingDatatype>(
        $TrackingEntitiesTableTable.$converterdatatype,
      );
  @override
  List<GeneratedColumn> get $columns => [id, title, datatype];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tracking_entities_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrackingEntitiesTableData> instance, {
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrackingEntitiesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackingEntitiesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      datatype: $TrackingEntitiesTableTable.$converterdatatype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}datatype'],
        )!,
      ),
    );
  }

  @override
  $TrackingEntitiesTableTable createAlias(String alias) {
    return $TrackingEntitiesTableTable(attachedDatabase, alias);
  }

  static TypeConverter<TrackingDatatype, int> $converterdatatype =
      const TrackingDatatypeConverter();
}

class TrackingEntitiesTableData extends DataClass
    implements Insertable<TrackingEntitiesTableData> {
  final int id;
  final String title;
  final TrackingDatatype datatype;
  const TrackingEntitiesTableData({
    required this.id,
    required this.title,
    required this.datatype,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    {
      map['datatype'] = Variable<int>(
        $TrackingEntitiesTableTable.$converterdatatype.toSql(datatype),
      );
    }
    return map;
  }

  TrackingEntitiesTableCompanion toCompanion(bool nullToAbsent) {
    return TrackingEntitiesTableCompanion(
      id: Value(id),
      title: Value(title),
      datatype: Value(datatype),
    );
  }

  factory TrackingEntitiesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackingEntitiesTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      datatype: serializer.fromJson<TrackingDatatype>(json['datatype']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'datatype': serializer.toJson<TrackingDatatype>(datatype),
    };
  }

  TrackingEntitiesTableData copyWith({
    int? id,
    String? title,
    TrackingDatatype? datatype,
  }) => TrackingEntitiesTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    datatype: datatype ?? this.datatype,
  );
  TrackingEntitiesTableData copyWithCompanion(
    TrackingEntitiesTableCompanion data,
  ) {
    return TrackingEntitiesTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      datatype: data.datatype.present ? data.datatype.value : this.datatype,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrackingEntitiesTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('datatype: $datatype')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, datatype);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackingEntitiesTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.datatype == this.datatype);
}

class TrackingEntitiesTableCompanion
    extends UpdateCompanion<TrackingEntitiesTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<TrackingDatatype> datatype;
  const TrackingEntitiesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.datatype = const Value.absent(),
  });
  TrackingEntitiesTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required TrackingDatatype datatype,
  }) : title = Value(title),
       datatype = Value(datatype);
  static Insertable<TrackingEntitiesTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? datatype,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (datatype != null) 'datatype': datatype,
    });
  }

  TrackingEntitiesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<TrackingDatatype>? datatype,
  }) {
    return TrackingEntitiesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      datatype: datatype ?? this.datatype,
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
    if (datatype.present) {
      map['datatype'] = Variable<int>(
        $TrackingEntitiesTableTable.$converterdatatype.toSql(datatype.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackingEntitiesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('datatype: $datatype')
          ..write(')'))
        .toString();
  }
}

class $TrackingEntriesTableTable extends TrackingEntriesTable
    with TableInfo<$TrackingEntriesTableTable, TrackingEntriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackingEntriesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tracking_entities_table (id)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, entityId, time, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tracking_entries_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrackingEntriesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrackingEntriesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackingEntriesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}time'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $TrackingEntriesTableTable createAlias(String alias) {
    return $TrackingEntriesTableTable(attachedDatabase, alias);
  }
}

class TrackingEntriesTableData extends DataClass
    implements Insertable<TrackingEntriesTableData> {
  final int id;
  final int entityId;
  final DateTime time;
  final String value;
  const TrackingEntriesTableData({
    required this.id,
    required this.entityId,
    required this.time,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_id'] = Variable<int>(entityId);
    map['time'] = Variable<DateTime>(time);
    map['value'] = Variable<String>(value);
    return map;
  }

  TrackingEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return TrackingEntriesTableCompanion(
      id: Value(id),
      entityId: Value(entityId),
      time: Value(time),
      value: Value(value),
    );
  }

  factory TrackingEntriesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackingEntriesTableData(
      id: serializer.fromJson<int>(json['id']),
      entityId: serializer.fromJson<int>(json['entityId']),
      time: serializer.fromJson<DateTime>(json['time']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityId': serializer.toJson<int>(entityId),
      'time': serializer.toJson<DateTime>(time),
      'value': serializer.toJson<String>(value),
    };
  }

  TrackingEntriesTableData copyWith({
    int? id,
    int? entityId,
    DateTime? time,
    String? value,
  }) => TrackingEntriesTableData(
    id: id ?? this.id,
    entityId: entityId ?? this.entityId,
    time: time ?? this.time,
    value: value ?? this.value,
  );
  TrackingEntriesTableData copyWithCompanion(
    TrackingEntriesTableCompanion data,
  ) {
    return TrackingEntriesTableData(
      id: data.id.present ? data.id.value : this.id,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      time: data.time.present ? data.time.value : this.time,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrackingEntriesTableData(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('time: $time, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entityId, time, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackingEntriesTableData &&
          other.id == this.id &&
          other.entityId == this.entityId &&
          other.time == this.time &&
          other.value == this.value);
}

class TrackingEntriesTableCompanion
    extends UpdateCompanion<TrackingEntriesTableData> {
  final Value<int> id;
  final Value<int> entityId;
  final Value<DateTime> time;
  final Value<String> value;
  const TrackingEntriesTableCompanion({
    this.id = const Value.absent(),
    this.entityId = const Value.absent(),
    this.time = const Value.absent(),
    this.value = const Value.absent(),
  });
  TrackingEntriesTableCompanion.insert({
    this.id = const Value.absent(),
    required int entityId,
    required DateTime time,
    required String value,
  }) : entityId = Value(entityId),
       time = Value(time),
       value = Value(value);
  static Insertable<TrackingEntriesTableData> custom({
    Expression<int>? id,
    Expression<int>? entityId,
    Expression<DateTime>? time,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityId != null) 'entity_id': entityId,
      if (time != null) 'time': time,
      if (value != null) 'value': value,
    });
  }

  TrackingEntriesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? entityId,
    Value<DateTime>? time,
    Value<String>? value,
  }) {
    return TrackingEntriesTableCompanion(
      id: id ?? this.id,
      entityId: entityId ?? this.entityId,
      time: time ?? this.time,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackingEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('time: $time, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDataSourceImpl extends GeneratedDatabase {
  _$LocalDataSourceImpl(QueryExecutor e) : super(e);
  $LocalDataSourceImplManager get managers => $LocalDataSourceImplManager(this);
  late final $TrackingEntitiesTableTable trackingEntitiesTable =
      $TrackingEntitiesTableTable(this);
  late final $TrackingEntriesTableTable trackingEntriesTable =
      $TrackingEntriesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    trackingEntitiesTable,
    trackingEntriesTable,
  ];
}

typedef $$TrackingEntitiesTableTableCreateCompanionBuilder =
    TrackingEntitiesTableCompanion Function({
      Value<int> id,
      required String title,
      required TrackingDatatype datatype,
    });
typedef $$TrackingEntitiesTableTableUpdateCompanionBuilder =
    TrackingEntitiesTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<TrackingDatatype> datatype,
    });

final class $$TrackingEntitiesTableTableReferences
    extends
        BaseReferences<
          _$LocalDataSourceImpl,
          $TrackingEntitiesTableTable,
          TrackingEntitiesTableData
        > {
  $$TrackingEntitiesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $TrackingEntriesTableTable,
    List<TrackingEntriesTableData>
  >
  _trackingEntriesTableRefsTable(_$LocalDataSourceImpl db) =>
      MultiTypedResultKey.fromTable(
        db.trackingEntriesTable,
        aliasName: $_aliasNameGenerator(
          db.trackingEntitiesTable.id,
          db.trackingEntriesTable.entityId,
        ),
      );

  $$TrackingEntriesTableTableProcessedTableManager
  get trackingEntriesTableRefs {
    final manager = $$TrackingEntriesTableTableTableManager(
      $_db,
      $_db.trackingEntriesTable,
    ).filter((f) => f.entityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _trackingEntriesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TrackingEntitiesTableTableFilterComposer
    extends Composer<_$LocalDataSourceImpl, $TrackingEntitiesTableTable> {
  $$TrackingEntitiesTableTableFilterComposer({
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

  ColumnWithTypeConverterFilters<TrackingDatatype, TrackingDatatype, int>
  get datatype => $composableBuilder(
    column: $table.datatype,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> trackingEntriesTableRefs(
    Expression<bool> Function($$TrackingEntriesTableTableFilterComposer f) f,
  ) {
    final $$TrackingEntriesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trackingEntriesTable,
      getReferencedColumn: (t) => t.entityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrackingEntriesTableTableFilterComposer(
            $db: $db,
            $table: $db.trackingEntriesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TrackingEntitiesTableTableOrderingComposer
    extends Composer<_$LocalDataSourceImpl, $TrackingEntitiesTableTable> {
  $$TrackingEntitiesTableTableOrderingComposer({
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

  ColumnOrderings<int> get datatype => $composableBuilder(
    column: $table.datatype,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrackingEntitiesTableTableAnnotationComposer
    extends Composer<_$LocalDataSourceImpl, $TrackingEntitiesTableTable> {
  $$TrackingEntitiesTableTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<TrackingDatatype, int> get datatype =>
      $composableBuilder(column: $table.datatype, builder: (column) => column);

  Expression<T> trackingEntriesTableRefs<T extends Object>(
    Expression<T> Function($$TrackingEntriesTableTableAnnotationComposer a) f,
  ) {
    final $$TrackingEntriesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.trackingEntriesTable,
          getReferencedColumn: (t) => t.entityId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrackingEntriesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.trackingEntriesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TrackingEntitiesTableTableTableManager
    extends
        RootTableManager<
          _$LocalDataSourceImpl,
          $TrackingEntitiesTableTable,
          TrackingEntitiesTableData,
          $$TrackingEntitiesTableTableFilterComposer,
          $$TrackingEntitiesTableTableOrderingComposer,
          $$TrackingEntitiesTableTableAnnotationComposer,
          $$TrackingEntitiesTableTableCreateCompanionBuilder,
          $$TrackingEntitiesTableTableUpdateCompanionBuilder,
          (TrackingEntitiesTableData, $$TrackingEntitiesTableTableReferences),
          TrackingEntitiesTableData,
          PrefetchHooks Function({bool trackingEntriesTableRefs})
        > {
  $$TrackingEntitiesTableTableTableManager(
    _$LocalDataSourceImpl db,
    $TrackingEntitiesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrackingEntitiesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TrackingEntitiesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TrackingEntitiesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<TrackingDatatype> datatype = const Value.absent(),
              }) => TrackingEntitiesTableCompanion(
                id: id,
                title: title,
                datatype: datatype,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required TrackingDatatype datatype,
              }) => TrackingEntitiesTableCompanion.insert(
                id: id,
                title: title,
                datatype: datatype,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TrackingEntitiesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({trackingEntriesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (trackingEntriesTableRefs) db.trackingEntriesTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (trackingEntriesTableRefs)
                    await $_getPrefetchedData<
                      TrackingEntitiesTableData,
                      $TrackingEntitiesTableTable,
                      TrackingEntriesTableData
                    >(
                      currentTable: table,
                      referencedTable: $$TrackingEntitiesTableTableReferences
                          ._trackingEntriesTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TrackingEntitiesTableTableReferences(
                            db,
                            table,
                            p0,
                          ).trackingEntriesTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.entityId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TrackingEntitiesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDataSourceImpl,
      $TrackingEntitiesTableTable,
      TrackingEntitiesTableData,
      $$TrackingEntitiesTableTableFilterComposer,
      $$TrackingEntitiesTableTableOrderingComposer,
      $$TrackingEntitiesTableTableAnnotationComposer,
      $$TrackingEntitiesTableTableCreateCompanionBuilder,
      $$TrackingEntitiesTableTableUpdateCompanionBuilder,
      (TrackingEntitiesTableData, $$TrackingEntitiesTableTableReferences),
      TrackingEntitiesTableData,
      PrefetchHooks Function({bool trackingEntriesTableRefs})
    >;
typedef $$TrackingEntriesTableTableCreateCompanionBuilder =
    TrackingEntriesTableCompanion Function({
      Value<int> id,
      required int entityId,
      required DateTime time,
      required String value,
    });
typedef $$TrackingEntriesTableTableUpdateCompanionBuilder =
    TrackingEntriesTableCompanion Function({
      Value<int> id,
      Value<int> entityId,
      Value<DateTime> time,
      Value<String> value,
    });

final class $$TrackingEntriesTableTableReferences
    extends
        BaseReferences<
          _$LocalDataSourceImpl,
          $TrackingEntriesTableTable,
          TrackingEntriesTableData
        > {
  $$TrackingEntriesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TrackingEntitiesTableTable _entityIdTable(_$LocalDataSourceImpl db) =>
      db.trackingEntitiesTable.createAlias(
        $_aliasNameGenerator(
          db.trackingEntriesTable.entityId,
          db.trackingEntitiesTable.id,
        ),
      );

  $$TrackingEntitiesTableTableProcessedTableManager get entityId {
    final $_column = $_itemColumn<int>('entity_id')!;

    final manager = $$TrackingEntitiesTableTableTableManager(
      $_db,
      $_db.trackingEntitiesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TrackingEntriesTableTableFilterComposer
    extends Composer<_$LocalDataSourceImpl, $TrackingEntriesTableTable> {
  $$TrackingEntriesTableTableFilterComposer({
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

  ColumnFilters<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$TrackingEntitiesTableTableFilterComposer get entityId {
    final $$TrackingEntitiesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.entityId,
          referencedTable: $db.trackingEntitiesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrackingEntitiesTableTableFilterComposer(
                $db: $db,
                $table: $db.trackingEntitiesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TrackingEntriesTableTableOrderingComposer
    extends Composer<_$LocalDataSourceImpl, $TrackingEntriesTableTable> {
  $$TrackingEntriesTableTableOrderingComposer({
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

  ColumnOrderings<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$TrackingEntitiesTableTableOrderingComposer get entityId {
    final $$TrackingEntitiesTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.entityId,
          referencedTable: $db.trackingEntitiesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrackingEntitiesTableTableOrderingComposer(
                $db: $db,
                $table: $db.trackingEntitiesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TrackingEntriesTableTableAnnotationComposer
    extends Composer<_$LocalDataSourceImpl, $TrackingEntriesTableTable> {
  $$TrackingEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$TrackingEntitiesTableTableAnnotationComposer get entityId {
    final $$TrackingEntitiesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.entityId,
          referencedTable: $db.trackingEntitiesTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrackingEntitiesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.trackingEntitiesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TrackingEntriesTableTableTableManager
    extends
        RootTableManager<
          _$LocalDataSourceImpl,
          $TrackingEntriesTableTable,
          TrackingEntriesTableData,
          $$TrackingEntriesTableTableFilterComposer,
          $$TrackingEntriesTableTableOrderingComposer,
          $$TrackingEntriesTableTableAnnotationComposer,
          $$TrackingEntriesTableTableCreateCompanionBuilder,
          $$TrackingEntriesTableTableUpdateCompanionBuilder,
          (TrackingEntriesTableData, $$TrackingEntriesTableTableReferences),
          TrackingEntriesTableData,
          PrefetchHooks Function({bool entityId})
        > {
  $$TrackingEntriesTableTableTableManager(
    _$LocalDataSourceImpl db,
    $TrackingEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrackingEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrackingEntriesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TrackingEntriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> entityId = const Value.absent(),
                Value<DateTime> time = const Value.absent(),
                Value<String> value = const Value.absent(),
              }) => TrackingEntriesTableCompanion(
                id: id,
                entityId: entityId,
                time: time,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int entityId,
                required DateTime time,
                required String value,
              }) => TrackingEntriesTableCompanion.insert(
                id: id,
                entityId: entityId,
                time: time,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TrackingEntriesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({entityId = false}) {
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
                    if (entityId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.entityId,
                                referencedTable:
                                    $$TrackingEntriesTableTableReferences
                                        ._entityIdTable(db),
                                referencedColumn:
                                    $$TrackingEntriesTableTableReferences
                                        ._entityIdTable(db)
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

typedef $$TrackingEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDataSourceImpl,
      $TrackingEntriesTableTable,
      TrackingEntriesTableData,
      $$TrackingEntriesTableTableFilterComposer,
      $$TrackingEntriesTableTableOrderingComposer,
      $$TrackingEntriesTableTableAnnotationComposer,
      $$TrackingEntriesTableTableCreateCompanionBuilder,
      $$TrackingEntriesTableTableUpdateCompanionBuilder,
      (TrackingEntriesTableData, $$TrackingEntriesTableTableReferences),
      TrackingEntriesTableData,
      PrefetchHooks Function({bool entityId})
    >;

class $LocalDataSourceImplManager {
  final _$LocalDataSourceImpl _db;
  $LocalDataSourceImplManager(this._db);
  $$TrackingEntitiesTableTableTableManager get trackingEntitiesTable =>
      $$TrackingEntitiesTableTableTableManager(_db, _db.trackingEntitiesTable);
  $$TrackingEntriesTableTableTableManager get trackingEntriesTable =>
      $$TrackingEntriesTableTableTableManager(_db, _db.trackingEntriesTable);
}
