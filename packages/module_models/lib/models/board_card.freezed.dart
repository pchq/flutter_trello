// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoardCard _$BoardCardFromJson(Map<String, dynamic> json) {
  return _BoardCard.fromJson(json);
}

/// @nodoc
class _$BoardCardTearOff {
  const _$BoardCardTearOff();

  _BoardCard call(
      {int? id,
      required BoardList row,
      @JsonKey(name: 'seq_num') int? seqNum,
      required String text}) {
    return _BoardCard(
      id: id,
      row: row,
      seqNum: seqNum,
      text: text,
    );
  }

  BoardCard fromJson(Map<String, Object?> json) {
    return BoardCard.fromJson(json);
  }
}

/// @nodoc
const $BoardCard = _$BoardCardTearOff();

/// @nodoc
mixin _$BoardCard {
  int? get id => throw _privateConstructorUsedError;
  BoardList get row => throw _privateConstructorUsedError;
  @JsonKey(name: 'seq_num')
  int? get seqNum => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardCardCopyWith<BoardCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCardCopyWith<$Res> {
  factory $BoardCardCopyWith(BoardCard value, $Res Function(BoardCard) then) =
      _$BoardCardCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      BoardList row,
      @JsonKey(name: 'seq_num') int? seqNum,
      String text});
}

/// @nodoc
class _$BoardCardCopyWithImpl<$Res> implements $BoardCardCopyWith<$Res> {
  _$BoardCardCopyWithImpl(this._value, this._then);

  final BoardCard _value;
  // ignore: unused_field
  final $Res Function(BoardCard) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? row = freezed,
    Object? seqNum = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      row: row == freezed
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as BoardList,
      seqNum: seqNum == freezed
          ? _value.seqNum
          : seqNum // ignore: cast_nullable_to_non_nullable
              as int?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BoardCardCopyWith<$Res> implements $BoardCardCopyWith<$Res> {
  factory _$BoardCardCopyWith(
          _BoardCard value, $Res Function(_BoardCard) then) =
      __$BoardCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      BoardList row,
      @JsonKey(name: 'seq_num') int? seqNum,
      String text});
}

/// @nodoc
class __$BoardCardCopyWithImpl<$Res> extends _$BoardCardCopyWithImpl<$Res>
    implements _$BoardCardCopyWith<$Res> {
  __$BoardCardCopyWithImpl(_BoardCard _value, $Res Function(_BoardCard) _then)
      : super(_value, (v) => _then(v as _BoardCard));

  @override
  _BoardCard get _value => super._value as _BoardCard;

  @override
  $Res call({
    Object? id = freezed,
    Object? row = freezed,
    Object? seqNum = freezed,
    Object? text = freezed,
  }) {
    return _then(_BoardCard(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      row: row == freezed
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as BoardList,
      seqNum: seqNum == freezed
          ? _value.seqNum
          : seqNum // ignore: cast_nullable_to_non_nullable
              as int?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BoardCard implements _BoardCard {
  const _$_BoardCard(
      {this.id,
      required this.row,
      @JsonKey(name: 'seq_num') this.seqNum,
      required this.text});

  factory _$_BoardCard.fromJson(Map<String, dynamic> json) =>
      _$$_BoardCardFromJson(json);

  @override
  final int? id;
  @override
  final BoardList row;
  @override
  @JsonKey(name: 'seq_num')
  final int? seqNum;
  @override
  final String text;

  @override
  String toString() {
    return 'BoardCard(id: $id, row: $row, seqNum: $seqNum, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BoardCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.seqNum, seqNum) || other.seqNum == seqNum) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, row, seqNum, text);

  @JsonKey(ignore: true)
  @override
  _$BoardCardCopyWith<_BoardCard> get copyWith =>
      __$BoardCardCopyWithImpl<_BoardCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardCardToJson(this);
  }
}

abstract class _BoardCard implements BoardCard {
  const factory _BoardCard(
      {int? id,
      required BoardList row,
      @JsonKey(name: 'seq_num') int? seqNum,
      required String text}) = _$_BoardCard;

  factory _BoardCard.fromJson(Map<String, dynamic> json) =
      _$_BoardCard.fromJson;

  @override
  int? get id;
  @override
  BoardList get row;
  @override
  @JsonKey(name: 'seq_num')
  int? get seqNum;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$BoardCardCopyWith<_BoardCard> get copyWith =>
      throw _privateConstructorUsedError;
}
