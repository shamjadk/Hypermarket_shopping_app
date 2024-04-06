import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hypermarket_ecommerce/model/customer_model.dart';

part 'api_state.freezed.dart';

@freezed
class ApiState with _$ApiState{
  factory ApiState({
    required List<CustomerModel>? customers,
    required String? error,
  })=_ApiState;
}