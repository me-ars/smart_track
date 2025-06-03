import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_track/view/widgets/button.dart';
import 'package:smart_track/view/widgets/custom_text_field.dart';

import '../../core/state_providers/login/login_bloc.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
bool _isPasswordVisible=false;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginButtonPressed() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      context
          .read<LoginBloc>()
          .add(Login(username: username, password: password));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter username and password')),
      );
    }
  }
  void _showPassword(){
    setState(() {
      _isPasswordVisible=!_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is LoginSuccessful) {
            // Navigate or show success
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome ${state.userType}!')),
            );

          }
        },
        builder: (context, state) {
          bool isLoading = state is LoginWaiting;

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(isVisible: true,
                  suffixIconFunction: (){},
                  width: size.width * 0.8,
                  height: size.height * 0.09,
                  isPassword: false,
                  controller: _usernameController,
                  labelText: 'Username',
                  isEnabled: !isLoading,
                ),
                const SizedBox(height: 16),
                CustomTextField(isVisible: _isPasswordVisible,
                  suffixIconFunction: (){
                  _showPassword();
                  },
                  width: size.width * 0.8,
                  height: size.height * 0.09,
                  isPassword: true,
                  controller: _passwordController,
                  labelText: 'Password',
                  isEnabled: !isLoading,
                ),
                const SizedBox(height: 24),
                isLoading
                    ? CircularProgressIndicator()
                    : Button(
                        width: size.width * 0.8,
                        height: size.height * 0.07,
                        onTap: _onLoginButtonPressed,
                        buttonText: 'Login',
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
