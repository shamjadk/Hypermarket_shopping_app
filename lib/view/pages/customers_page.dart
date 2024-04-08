import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_api_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_api_state.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_events.dart';
import 'package:hypermarket_ecommerce/view/widgets/app_bar_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/customers_list_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/search_field_widget.dart';

class CustomerPage extends HookWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final customersController = useTextEditingController();
    useEffect(() {
      Future.delayed(
        Duration.zero,
        () {
          context.read<CustomersApiBloc>().add(GetCustomersEvent());
        },
      );
      return null;
    }, []);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(112),
            child: Column(
              children: [
                const AppBarWidget(
                  title: 'Customers',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SearchFieldWidget(
                      isCustomer: true,
                      onChanged: (text) {
                        context.read<CustomersApiBloc>().add(
                            SearchCustomersEvent(customersController.text));
                      },
                      controller: customersController),
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  child: BlocBuilder<CustomersApiBloc, CustomerApiState>(
                    builder: (context, state) {
                      if (state.customers == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final searchResults = state.customers!
                            .where((element) => element.name!
                                .trim()
                                .toLowerCase()
                                .startsWith(customersController.text
                                    .trim()
                                    .toLowerCase()))
                            .toList();

                        return CustomersListWidget(state: searchResults);
                      }
                    },
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
