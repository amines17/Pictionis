import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final ThemeData theme;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;

  const AuthForm({
    required this.theme,
    required this.controllerEmail,
    required this.controllerPassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(
            controller: controllerEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: theme.colorScheme.secondary,
              filled: true,
              labelText: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: theme.colorScheme.primary,
              ),
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: controllerPassword,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: theme.colorScheme.secondary,
                filled: true,
                labelText: 'Password',
                prefixIcon: Icon(
                  Icons.key,
                  color: theme.colorScheme.primary,
                ),
                hintText: 'Enter your password'),
          ),
        ]),
      ),
    );
  }
}
