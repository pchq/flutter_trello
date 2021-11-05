import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trello/theme.dart';
import 'package:layer_domain/layer_domain.dart';

import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceProvider().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ServiceProvider serviceProvider = ServiceProvider();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(
            authRepository: serviceProvider.get<IAuthRepository>(),
          )..checkAuth(),
        ),
        BlocProvider<DashboardCubit>(
          create: (BuildContext context) => DashboardCubit(
            cardsRepository: serviceProvider.get<ICardsRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeConstants.appTheme,
        initialRoute: '/splash_screen',
        routes: routes,
      ),
    );
  }
}
