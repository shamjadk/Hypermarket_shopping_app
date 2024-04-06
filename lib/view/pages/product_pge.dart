import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypermarket_ecommerce/controller/bloc/product_bloc/product_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/product_bloc/product_bloc_state.dart';
import 'package:hypermarket_ecommerce/view/widgets/app_bar_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/bottombar_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/product_grid_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/search_field_widget.dart';

class ProductPage extends HookWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = useTextEditingController();
    useEffect(() {
      Future.delayed(
        Duration.zero,
        () {
          context.read<ProductApiBloc>().add(GetProductEvent());
        },
      );
      return null;
    }, []);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: Column(
              children: [
                const AppBarWidget(title: 'Nesto Hypermarket'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SearchFieldWidget(
                      isCustomer: true,
                      onSubmitted: (p0) {},
                      controller: productController),
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
                SizedBox(
                  child: BlocBuilder<ProductApiBloc, ProductApiState>(
                    builder: (context, state) {
                      if (state.product == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ProductGridWidget(state: state.product!);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}
