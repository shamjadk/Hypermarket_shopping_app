import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';
import 'package:hypermarket_ecommerce/view/widgets/sections_grid_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 50,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
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
      body: const SectionsGridWidget(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: AppTheme.appThemeColor,
        selectedItemColor: AppTheme.appThemeColor,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppTheme.appThemeColor,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_chart,
                size: 20,
                color: AppTheme.appThemeColor,
              ),
              label: 'New order'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.cart,
                size: 20,
                color: AppTheme.appThemeColor,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.return_icon,
                size: 20,
                color: AppTheme.appThemeColor,
              ),
              label: 'Return order'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.group_solid,
                size: 20,
                color: AppTheme.appThemeColor,
              ),
              label: 'Customers'),
        ],
      ),
    );
  }
}
