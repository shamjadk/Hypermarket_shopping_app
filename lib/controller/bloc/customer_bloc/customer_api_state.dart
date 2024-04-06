import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';

part 'customer_api_state.freezed.dart';

@freezed
class CustomerApiState with _$CustomerApiState {
  factory CustomerApiState({
    required List<CustomersModel>? customers,
    required String? error,
  }) = _CustomerApiState;
}
