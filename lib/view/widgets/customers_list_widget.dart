import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hypermarket_ecommerce/model/customer_model.dart';

class CustomersListWidget extends ConsumerWidget {
  final List<CustomerModel> state;
  const CustomersListWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // CustomerApiService apiservice = CustomerApiService();
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.length,
      itemBuilder: (context, index) {
        return Text(state[index].name!);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
    );
  }
}
