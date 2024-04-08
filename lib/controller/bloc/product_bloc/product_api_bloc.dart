import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/product_bloc/product_api_state.dart';
import 'package:hypermarket_ecommerce/controller/services/product_api_service.dart';

sealed class ProductApiEvent {}

class GetProductEvent implements ProductApiEvent {}

class SearchProductsevent implements ProductApiEvent {
  final String? searchText;
  SearchProductsevent(this.searchText);
}

class ProductApiBloc extends Bloc<ProductApiEvent, ProductApiState> {
  ProductApiBloc()
      : super(
          ProductApiState(product: null, error: null),
        ) {
    on<GetProductEvent>((event, emit) async {
      await fetchProducts(emit);
    });

    on<SearchProductsevent>(
      (event, emit) async {
        final searchText = event.searchText;
        await searchProducts(emit, searchText!);
      },
    );
  }

  Future<void> fetchProducts(Emitter<ProductApiState> emit) async {
    try {
      final products = await ProductApiService.getProducts();
      emit(state.copyWith(product: products));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> searchProducts(
      Emitter<ProductApiState> emit, String searchProduct) async {
    try {
      final searchedProducts =
          await ProductApiService.searchProducts(searchProduct);
      emit(state.copyWith(product: searchedProducts));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
