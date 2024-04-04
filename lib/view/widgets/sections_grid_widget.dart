import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';

class SectionsGridWidget extends StatelessWidget {
  const SectionsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final iconList = [
      'assets/icons/ic_customers.png',
      'assets/icons/ic_product.png',
      'assets/icons/ic_new_order.png',
      'assets/icons/ic_return_order.png',
      'assets/icons/ic_add_payment.png',
      'assets/icons/ic_todays_order.png',
      'assets/icons/ic_todays_summary.png',
      'assets/icons/ic_route.png',
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
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 3)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconList[index],
              height: 40,
              color: AppTheme.appThemeColor,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              nameList[index],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
