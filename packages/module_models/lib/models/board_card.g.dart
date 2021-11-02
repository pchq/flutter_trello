// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoardCard _$$_BoardCardFromJson(Map<String, dynamic> json) => _$_BoardCard(
      id: json['id'] as int?,
      row: $enumDecode(_$BoardListEnumMap, json['row']),
      seqNum: json['seq_num'] as int?,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_BoardCardToJson(_$_BoardCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'row': _$BoardListEnumMap[instance.row],
      'seq_num': instance.seqNum,
      'text': instance.text,
    };

const _$BoardListEnumMap = {
  BoardList.hold: '0',
  BoardList.progress: '1',
  BoardList.review: '2',
  BoardList.approved: '3',
};
