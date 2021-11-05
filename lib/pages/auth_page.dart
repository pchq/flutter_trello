import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layer_domain/layer_domain.dart';
import '/widgets/loading.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  String? _usernameError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();

    _usernameCtrl.addListener(() {
      setState(() {
        _usernameError = _usernameCtrl.text.length < 4 ? 'Minimum is 4 characters' : null;
      });
    });
    _passwordCtrl.addListener(() {
      setState(() {
        _passwordError = _passwordCtrl.text.length < 8 ? 'Minimum is 8 characters' : null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read<AuthCubit>();
    authCubit.emit(AuthInitial());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban'),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacementNamed('/cards');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return state is AuthLoading
              ? const Loading()
              : Container(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFormField(_usernameCtrl, 'Enter your username', _usernameError),
                        _buildFormField(_passwordCtrl, 'Enter your password', _passwordError, true),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: const Size(double.infinity, 40),
                          ),
                          onPressed: () {
                            if (_usernameError == null && _passwordError == null) {
                              authCubit.login(
                                username: _usernameCtrl.text,
                                password: _passwordCtrl.text,
                              );
                            }
                          },
                          child: const Text(
                            'Log in',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget _buildFormField(TextEditingController controller, String hint, String? error,
          [bool obscureText = false]) =>
      Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            hintText: hint,
            errorText: error,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      );
}
