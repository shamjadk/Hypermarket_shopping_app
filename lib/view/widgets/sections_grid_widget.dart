import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';

class SectionsGridWidget extends HookWidget {
  const SectionsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedBottomNavBarIndex = useState<int>(-1);

    final iconList = [
      CupertinoIcons.group_solid,
      CupertinoIcons.cube_box,
      Icons.add_chart,
      CupertinoIcons.return_icon,
      Icons.payments_outlined,
      CupertinoIcons.doc_plaintext,
      Icons.receipt_long,
      Icons.route
    ];
    final nameList = [
      'Customers',
      'Products',
      'New order',
      'Return order',
      'Add payment',
      "Today's order",
      "Today' summary",
      'Route',
    ];
    return GridView.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 155,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          selectedBottomNavBarIndex.value = index;
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
                color: selectedBottomNavBarIndex.value == index
                    ? AppTheme.appThemeColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 10, spreadRadius: 3)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 35,
                  color: selectedBottomNavBarIndex.value == index
                      ? Colors.white
                      : AppTheme.appThemeColor,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  nameList[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedBottomNavBarIndex.value == index
                        ? Colors.white
                        : AppTheme.appThemeColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
