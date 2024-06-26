import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_api_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/product_bloc/product_api_bloc.dart';
import 'package:hypermarket_ecommerce/controller/navigator_controller.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';
import 'package:hypermarket_ecommerce/view/pages/customers_page.dart';
import 'package:hypermarket_ecommerce/view/pages/product_page.dart';

class SectionsGridWidget extends HookWidget {
  const SectionsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedSectionIndex = useState<int>(-1);

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 155,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            selectedSectionIndex.value = index;
            selectedSectionIndex.value == 0
                ? navPush(
                    context,
                    BlocProvider<CustomersApiBloc>(
                        create: (context) => CustomersApiBloc(),
                        child: const CustomerPage()))
                : navPush(
                    context,
                    BlocProvider<ProductApiBloc>(
                        create: (context) => ProductApiBloc(),
                        child: const ProductPage()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: selectedSectionIndex.value == index
                      ? AppTheme.appThemeColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 7, spreadRadius: 1)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 35,
                    color: selectedSectionIndex.value == index
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
                      color: selectedSectionIndex.value == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
