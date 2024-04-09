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
        leading: const Padding(
          padding: EdgeInsets.only(left: 24),
          child: CircleAvatar(
            backgroundColor: AppTheme.appThemeColor,
            child: Icon(Icons.person, color: Colors.white, size: 18),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    'assets/icons/ic_menu.png',
                    height: 24,
                  )))
        ],
      ),
      body: const SingleChildScrollView(
        child: SectionsGridWidget(),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            showUnselectedLabels: true,
            unselectedItemColor: AppTheme.appThemeColor,
            selectedItemColor: AppTheme.appThemeColor,
            selectedFontSize: 14,
            unselectedFontSize: 12,
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
                    size: 24,
                    color: AppTheme.appThemeColor,
                  ),
                  label: 'New Order'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.cart,
                    size: 24,
                    color: AppTheme.appThemeColor,
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.return_icon,
                    size: 24,
                    color: AppTheme.appThemeColor,
                  ),
                  label: 'Return order'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.group_solid,
                    size: 24,
                    color: AppTheme.appThemeColor,
                  ),
                  label: 'Customers'),
            ],
          ),
        ),
      ),
    );
  }
}
