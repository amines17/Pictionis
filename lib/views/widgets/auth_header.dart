import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AuthHeader extends StatelessWidget {
  final ThemeData theme;
  const AuthHeader({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(195),
              bottomRight: Radius.circular(195),
            ),
            color: theme.colorScheme.secondary,
          ),
          width: 500,
          height: 200,
          child: Center(
            child: Image.asset(
              'assets/img/logo.jpg',
              height: 150,
              width: 200,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Welcome on Pictionis game !'.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: theme.colorScheme.secondary,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 150,
          width: double.infinity,
          child: RiveAnimation.asset(
            'assets/animations/cup_walk.riv',
          ),
        ),
      ],
    );
  }
}
