import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jplay_flutter/core/constants/global_keys.dart';
import 'package:jplay_flutter/core/theme/theme.dart';
import 'package:jplay_flutter/core/validators.dart';
import 'package:jplay_flutter/core/widgets/TextFormField_widget.dart';

import '../../../../core/widgets/submit_button_widget.dart';
import '../bloc/authentication_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication"),
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              TextFormFieldWidget(
                labelText: "Email",
                hinText: "lesam@dev.do",
                controller: _emailController,
                onChanged: (v) => _updateButtonState(),
                validator: Validators.email,
              ),
              const SizedBox(height: 16.0),
              TextFormFieldWidget(
                labelText: "Password",
                hinText: "password",
                obscureText: true,
                controller: _passwordController,
                onChanged: (v) => _updateButtonState(),
                validator: Validators.nonEmpty,
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgotten Password?"),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                  child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return SubmitButtonWidget(
                      onPressed: _isButtonEnabled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                context.read<AuthenticationBloc>().add(
                                    LoginEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text));
                              }
                            }
                          : null,
                      buttonText: "Log In",
                      loading: state is Authenticating);
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
