import '/src/datasource/remote_data_source.dart';

import 'package:layer_domain/layer_domain.dart';
import 'package:module_models/module_models.dart';

class CardsRepository implements ICardsRepository {
  final IRemoteDataSource remoteDataSource;

  CardsRepository({
    required this.remoteDataSource,
  });

  @override
  Future<List<BoardCard>> getCards() async {
    List<BoardCard> cards = await remoteDataSource.loadCards();

    return cards;
  }
}
