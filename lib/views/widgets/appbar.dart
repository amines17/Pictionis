import 'package:flutter/material.dart';
import 'package:pictionis/controllers/auth_controller.dart';
import 'package:pictionis/views/home_page.dart';

class ReusableAppBar {
  static getAppBar(context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      centerTitle: true,
      backgroundColor: theme.colorScheme.background,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.account_circle,
          color: theme.colorScheme.primary,
        ),
      ),
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Text('Pictionis',
            style: TextStyle(color: theme.colorScheme.primary)),
      ),
      actions: [
        IconButton(
          onPressed: () {
            AuthService.instance.signOut();
          },
          icon: Icon(
            Icons.logout,
            color: theme.colorScheme.primary,
          ),
        )
      ],
    );
  }
}
