import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            Text(title),
            IconButton(
              onPressed: null,
              icon: RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  'assets/icons/ic_menu.png',
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
