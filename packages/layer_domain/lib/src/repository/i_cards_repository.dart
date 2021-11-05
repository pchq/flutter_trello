import 'package:module_models/module_models.dart';

abstract class ICardsRepository {
  Future<List<BoardCard>> getCards();
}
