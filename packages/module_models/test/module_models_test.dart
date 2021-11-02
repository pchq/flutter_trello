// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

import 'package:module_models/module_models.dart';

void main() {
  test('fromJson', () {
    List<Map<String, dynamic>> maps = [
      {"id": 1757, "row": "0", "seq_num": 2, "text": "new kazybek"},
      {"row": "3", "text": "new kazybek"},
    ];

    for (var e in maps) {
      print(BoardCard.fromJson(e));
    }
  });
}
