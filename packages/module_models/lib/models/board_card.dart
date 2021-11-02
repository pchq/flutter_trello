import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_card.freezed.dart';
part 'board_card.g.dart';

enum BoardList {
  @JsonValue('0')
  hold,

  @JsonValue('1')
  progress,

  @JsonValue('2')
  review,

  @JsonValue('3')
  approved,
}

@freezed
class BoardCard with _$BoardCard {
  const factory BoardCard({
    int? id,
    required BoardList row,
    @JsonKey(name: 'seq_num') int? seqNum,
    required String text,
  }) = _BoardCard;

  factory BoardCard.fromJson(Map<String, dynamic> json) => _$BoardCardFromJson(json);
}
