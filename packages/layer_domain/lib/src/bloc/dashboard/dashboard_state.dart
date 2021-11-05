part of 'dashboard_cubit.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<BoardCard> cards;
  DashboardLoaded({
    required this.cards,
  });
}

class DashboardError extends DashboardState {
  final String error;
  DashboardError(this.error);
}
