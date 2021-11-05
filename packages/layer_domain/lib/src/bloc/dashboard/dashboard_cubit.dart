import 'package:bloc/bloc.dart';
import 'package:layer_domain/layer_domain.dart';
import 'package:meta/meta.dart';
import 'package:module_models/models/board_card.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final ICardsRepository cardsRepository;

  DashboardCubit({
    required this.cardsRepository,
  }) : super(DashboardInitial());

  void loadAll() async {
    if (state is DashboardLoading) return;

    try {
      emit(DashboardLoading());
      final List<BoardCard> cards = await cardsRepository.getCards();
      emit(DashboardLoaded(cards: cards));
    } catch (e) {
      emit(DashboardError('$e'));
    }
  }
}
