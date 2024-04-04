import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypermarket_ecommerce/view/widgets/app_bar_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/customers_list_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/search_field_widget.dart';

class CustomersPage extends HookWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final customerSearchController = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarWidget(
              title: 'Customers',
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SearchFieldWidget(
                  controller: customerSearchController,
                  isCustomer: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                const CustomersListWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
