import 'package:get_it/get_it.dart';

import 'package:layer_data/layer_data.dart' as data_layer;

import '/src/bloc/auth/auth_cubit.dart';
import '/src/bloc/dashboard/dashboard_cubit.dart';

class ServiceProvider {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final I = ServiceProvider();

  void init() {
    data_layer.ServiceProvider().init();

    _getIt.registerLazySingleton<AuthCubit>(
      () => AuthCubit(authRepository: _getIt()),
    );

    _getIt.registerLazySingleton<DashboardCubit>(
      () => DashboardCubit(cardsRepository: _getIt()),
    );
  }
}
