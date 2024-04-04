import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/view/widgets/customer_tile_widget.dart';

class CustomersListWidget extends StatelessWidget {
  const CustomersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CustomerTileWidget();
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
    );
  }
}
