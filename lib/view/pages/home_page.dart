import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/view/widgets/sections_grid_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
          actions: [
            IconButton(
                onPressed: null,
                icon: RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    'assets/icons/ic_menu.png',
                    height: 24,
                  ),
                ))
          ],
        ),
        body: SectionsGridWidget());
  }
}
