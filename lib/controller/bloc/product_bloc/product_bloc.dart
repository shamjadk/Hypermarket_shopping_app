
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/product_bloc/product_bloc_state.dart';
import 'package:hypermarket_ecommerce/controller/services/product_api_services.dart';

sealed class ProductApiEvent {}

class GetProductEvent implements ProductApiEvent {}

class ProductApiBloc extends Bloc<ProductApiEvent, ProductApiState> {
  ProductApiBloc()
      : super(
          ProductApiState(product: null, error: null),
        ) {
    on<GetProductEvent>((event, emit) async {
      await fetchProducts(emit);
    });
  }

  Future<void> fetchProducts(Emitter<ProductApiState> emit) async {
    try {
      final  products = await ProductApiService().getProducts();
      emit(state.copyWith(product: products));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
