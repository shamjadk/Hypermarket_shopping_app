import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypermarket_ecommerce/controller/bloc/product_bloc/product_api_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/product_bloc/product_api_state.dart';
import 'package:hypermarket_ecommerce/view/widgets/app_bar_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/product_grid_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/search_field_widget.dart';

class ProductPage extends HookWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productSearchController = useTextEditingController();
    useEffect(() {
      Future.delayed(
        Duration.zero,
        () {
          context.read<ProductApiBloc>().add(GetProductEvent());
        },
      );
      return null;
    }, []);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Column(
            children: [
              const AppBarWidget(
                title: 'Nesto Hypermarket',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SearchFieldWidget(
                  controller: productSearchController,
                  isCustomer: false,
                  onChanged: (text) {
                    context
                        .read<ProductApiBloc>()
                        .add(SearchProductsevent(text));
                  },
                ),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<ProductApiBloc, ProductApiState>(
                  builder: (context, state) {
                    if (state.product == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final searchResults = state.product!
                          .where((element) => element.name
                              .trim()
                              .toLowerCase()
                              .contains(productSearchController.text
                                  .trim()
                                  .toLowerCase()))
                          .toList();
                      return ProductGridWidget(state: searchResults);
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
