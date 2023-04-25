import 'package:flutter/material.dart';
import 'package:pictionis/controllers/auth_controller.dart';
import 'package:pictionis/views/user/register.dart';
import 'package:pictionis/views/widgets/auth_form.dart';
import 'package:pictionis/views/widgets/auth_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              theme: theme,
            ),
            AuthForm(
              theme: theme,
              controllerEmail: controllerEmail,
              controllerPassword: controllerPassword,
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              child: const Text(
                "Don't have an account yet?",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                AuthService.instance.signInWithEmailAndPassword(
                  email: controllerEmail.text,
                  password: controllerPassword.text,
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary),
              child: Text('Login'.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
