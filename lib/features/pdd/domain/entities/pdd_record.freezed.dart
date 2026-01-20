// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdd_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PddRecord {
  String get id => throw _privateConstructorUsedError;
  String get trainNo => throw _privateConstructorUsedError;
  TrainType get trainType => throw _privateConstructorUsedError;
  MovementType get movementType => throw _privateConstructorUsedError;
  LocoType? get locoType => throw _privateConstructorUsedError;
  DateTime? get rakeArrived => throw _privateConstructorUsedError;
  DateTime? get locoAttached => throw _privateConstructorUsedError;
  DateTime? get examStart => throw _privateConstructorUsedError;
  DateTime? get examComplete => throw _privateConstructorUsedError;
  DateTime? get brakePowerOk => throw _privateConstructorUsedError;
  DateTime? get crewReported => throw _privateConstructorUsedError;
  DateTime? get readyToDepart => throw _privateConstructorUsedError;
  DateTime? get scheduledDeparture => throw _privateConstructorUsedError;
  DateTime? get actualDeparture => throw _privateConstructorUsedError;

  /// Create a copy of PddRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PddRecordCopyWith<PddRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PddRecordCopyWith<$Res> {
  factory $PddRecordCopyWith(PddRecord value, $Res Function(PddRecord) then) =
      _$PddRecordCopyWithImpl<$Res, PddRecord>;
  @useResult
  $Res call({
    String id,
    String trainNo,
    TrainType trainType,
    MovementType movementType,
    LocoType? locoType,
    DateTime? rakeArrived,
    DateTime? locoAttached,
    DateTime? examStart,
    DateTime? examComplete,
    DateTime? brakePowerOk,
    DateTime? crewReported,
    DateTime? readyToDepart,
    DateTime? scheduledDeparture,
    DateTime? actualDeparture,
  });
}

/// @nodoc
class _$PddRecordCopyWithImpl<$Res, $Val extends PddRecord>
    implements $PddRecordCopyWith<$Res> {
  _$PddRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PddRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trainNo = null,
    Object? trainType = null,
    Object? movementType = null,
    Object? locoType = freezed,
    Object? rakeArrived = freezed,
    Object? locoAttached = freezed,
    Object? examStart = freezed,
    Object? examComplete = freezed,
    Object? brakePowerOk = freezed,
    Object? crewReported = freezed,
    Object? readyToDepart = freezed,
    Object? scheduledDeparture = freezed,
    Object? actualDeparture = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            trainNo: null == trainNo
                ? _value.trainNo
                : trainNo // ignore: cast_nullable_to_non_nullable
                      as String,
            trainType: null == trainType
                ? _value.trainType
                : trainType // ignore: cast_nullable_to_non_nullable
                      as TrainType,
            movementType: null == movementType
                ? _value.movementType
                : movementType // ignore: cast_nullable_to_non_nullable
                      as MovementType,
            locoType: freezed == locoType
                ? _value.locoType
                : locoType // ignore: cast_nullable_to_non_nullable
                      as LocoType?,
            rakeArrived: freezed == rakeArrived
                ? _value.rakeArrived
                : rakeArrived // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            locoAttached: freezed == locoAttached
                ? _value.locoAttached
                : locoAttached // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            examStart: freezed == examStart
                ? _value.examStart
                : examStart // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            examComplete: freezed == examComplete
                ? _value.examComplete
                : examComplete // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            brakePowerOk: freezed == brakePowerOk
                ? _value.brakePowerOk
                : brakePowerOk // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            crewReported: freezed == crewReported
                ? _value.crewReported
                : crewReported // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            readyToDepart: freezed == readyToDepart
                ? _value.readyToDepart
                : readyToDepart // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            scheduledDeparture: freezed == scheduledDeparture
                ? _value.scheduledDeparture
                : scheduledDeparture // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            actualDeparture: freezed == actualDeparture
                ? _value.actualDeparture
                : actualDeparture // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PddRecordImplCopyWith<$Res>
    implements $PddRecordCopyWith<$Res> {
  factory _$$PddRecordImplCopyWith(
    _$PddRecordImpl value,
    $Res Function(_$PddRecordImpl) then,
  ) = __$$PddRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String trainNo,
    TrainType trainType,
    MovementType movementType,
    LocoType? locoType,
    DateTime? rakeArrived,
    DateTime? locoAttached,
    DateTime? examStart,
    DateTime? examComplete,
    DateTime? brakePowerOk,
    DateTime? crewReported,
    DateTime? readyToDepart,
    DateTime? scheduledDeparture,
    DateTime? actualDeparture,
  });
}

/// @nodoc
class __$$PddRecordImplCopyWithImpl<$Res>
    extends _$PddRecordCopyWithImpl<$Res, _$PddRecordImpl>
    implements _$$PddRecordImplCopyWith<$Res> {
  __$$PddRecordImplCopyWithImpl(
    _$PddRecordImpl _value,
    $Res Function(_$PddRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PddRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trainNo = null,
    Object? trainType = null,
    Object? movementType = null,
    Object? locoType = freezed,
    Object? rakeArrived = freezed,
    Object? locoAttached = freezed,
    Object? examStart = freezed,
    Object? examComplete = freezed,
    Object? brakePowerOk = freezed,
    Object? crewReported = freezed,
    Object? readyToDepart = freezed,
    Object? scheduledDeparture = freezed,
    Object? actualDeparture = freezed,
  }) {
    return _then(
      _$PddRecordImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        trainNo: null == trainNo
            ? _value.trainNo
            : trainNo // ignore: cast_nullable_to_non_nullable
                  as String,
        trainType: null == trainType
            ? _value.trainType
            : trainType // ignore: cast_nullable_to_non_nullable
                  as TrainType,
        movementType: null == movementType
            ? _value.movementType
            : movementType // ignore: cast_nullable_to_non_nullable
                  as MovementType,
        locoType: freezed == locoType
            ? _value.locoType
            : locoType // ignore: cast_nullable_to_non_nullable
                  as LocoType?,
        rakeArrived: freezed == rakeArrived
            ? _value.rakeArrived
            : rakeArrived // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        locoAttached: freezed == locoAttached
            ? _value.locoAttached
            : locoAttached // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        examStart: freezed == examStart
            ? _value.examStart
            : examStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        examComplete: freezed == examComplete
            ? _value.examComplete
            : examComplete // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        brakePowerOk: freezed == brakePowerOk
            ? _value.brakePowerOk
            : brakePowerOk // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        crewReported: freezed == crewReported
            ? _value.crewReported
            : crewReported // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        readyToDepart: freezed == readyToDepart
            ? _value.readyToDepart
            : readyToDepart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        scheduledDeparture: freezed == scheduledDeparture
            ? _value.scheduledDeparture
            : scheduledDeparture // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        actualDeparture: freezed == actualDeparture
            ? _value.actualDeparture
            : actualDeparture // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$PddRecordImpl extends _PddRecord {
  const _$PddRecordImpl({
    required this.id,
    required this.trainNo,
    required this.trainType,
    required this.movementType,
    this.locoType,
    this.rakeArrived,
    this.locoAttached,
    this.examStart,
    this.examComplete,
    this.brakePowerOk,
    this.crewReported,
    this.readyToDepart,
    this.scheduledDeparture,
    this.actualDeparture,
  }) : super._();

  @override
  final String id;
  @override
  final String trainNo;
  @override
  final TrainType trainType;
  @override
  final MovementType movementType;
  @override
  final LocoType? locoType;
  @override
  final DateTime? rakeArrived;
  @override
  final DateTime? locoAttached;
  @override
  final DateTime? examStart;
  @override
  final DateTime? examComplete;
  @override
  final DateTime? brakePowerOk;
  @override
  final DateTime? crewReported;
  @override
  final DateTime? readyToDepart;
  @override
  final DateTime? scheduledDeparture;
  @override
  final DateTime? actualDeparture;

  @override
  String toString() {
    return 'PddRecord(id: $id, trainNo: $trainNo, trainType: $trainType, movementType: $movementType, locoType: $locoType, rakeArrived: $rakeArrived, locoAttached: $locoAttached, examStart: $examStart, examComplete: $examComplete, brakePowerOk: $brakePowerOk, crewReported: $crewReported, readyToDepart: $readyToDepart, scheduledDeparture: $scheduledDeparture, actualDeparture: $actualDeparture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PddRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trainNo, trainNo) || other.trainNo == trainNo) &&
            (identical(other.trainType, trainType) ||
                other.trainType == trainType) &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            (identical(other.locoType, locoType) ||
                other.locoType == locoType) &&
            (identical(other.rakeArrived, rakeArrived) ||
                other.rakeArrived == rakeArrived) &&
            (identical(other.locoAttached, locoAttached) ||
                other.locoAttached == locoAttached) &&
            (identical(other.examStart, examStart) ||
                other.examStart == examStart) &&
            (identical(other.examComplete, examComplete) ||
                other.examComplete == examComplete) &&
            (identical(other.brakePowerOk, brakePowerOk) ||
                other.brakePowerOk == brakePowerOk) &&
            (identical(other.crewReported, crewReported) ||
                other.crewReported == crewReported) &&
            (identical(other.readyToDepart, readyToDepart) ||
                other.readyToDepart == readyToDepart) &&
            (identical(other.scheduledDeparture, scheduledDeparture) ||
                other.scheduledDeparture == scheduledDeparture) &&
            (identical(other.actualDeparture, actualDeparture) ||
                other.actualDeparture == actualDeparture));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    trainNo,
    trainType,
    movementType,
    locoType,
    rakeArrived,
    locoAttached,
    examStart,
    examComplete,
    brakePowerOk,
    crewReported,
    readyToDepart,
    scheduledDeparture,
    actualDeparture,
  );

  /// Create a copy of PddRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PddRecordImplCopyWith<_$PddRecordImpl> get copyWith =>
      __$$PddRecordImplCopyWithImpl<_$PddRecordImpl>(this, _$identity);
}

abstract class _PddRecord extends PddRecord {
  const factory _PddRecord({
    required final String id,
    required final String trainNo,
    required final TrainType trainType,
    required final MovementType movementType,
    final LocoType? locoType,
    final DateTime? rakeArrived,
    final DateTime? locoAttached,
    final DateTime? examStart,
    final DateTime? examComplete,
    final DateTime? brakePowerOk,
    final DateTime? crewReported,
    final DateTime? readyToDepart,
    final DateTime? scheduledDeparture,
    final DateTime? actualDeparture,
  }) = _$PddRecordImpl;
  const _PddRecord._() : super._();

  @override
  String get id;
  @override
  String get trainNo;
  @override
  TrainType get trainType;
  @override
  MovementType get movementType;
  @override
  LocoType? get locoType;
  @override
  DateTime? get rakeArrived;
  @override
  DateTime? get locoAttached;
  @override
  DateTime? get examStart;
  @override
  DateTime? get examComplete;
  @override
  DateTime? get brakePowerOk;
  @override
  DateTime? get crewReported;
  @override
  DateTime? get readyToDepart;
  @override
  DateTime? get scheduledDeparture;
  @override
  DateTime? get actualDeparture;

  /// Create a copy of PddRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PddRecordImplCopyWith<_$PddRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
