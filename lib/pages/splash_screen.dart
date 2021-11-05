import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layer_domain/layer_domain.dart';
import '/widgets/loading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(context).pushReplacementNamed('/cards');
        } else if (state is AuthError) {
          Navigator.of(context).pushReplacementNamed('/auth');
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Loading(),
        );
      },
    );
  }
}
