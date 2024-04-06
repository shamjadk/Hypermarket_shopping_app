import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';
import 'package:hypermarket_ecommerce/view/widgets/customer_tile_widget.dart';

class CustomersListWidget extends StatelessWidget {
  final List<CustomersModel> state;
  const CustomersListWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.length,
      itemBuilder: (context, index) {
        return CustomerTileWidget(model: state[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
    );
  }
}
