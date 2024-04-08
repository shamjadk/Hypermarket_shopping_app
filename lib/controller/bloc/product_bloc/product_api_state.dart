import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hypermarket_ecommerce/model/product_model.dart';

part 'product_api_state.freezed.dart';

@freezed
class ProductApiState with _$ProductApiState {
  factory ProductApiState({
    required List<Products>? product,
    required String? error,
  }) = _ProductApiState;
}
