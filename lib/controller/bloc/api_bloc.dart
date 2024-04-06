import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/api_state.dart';
import 'package:hypermarket_ecommerce/controller/api_services/customer_api_service.dart';

sealed class CustomersEvent {}

class GetCustomersEvent implements CustomersEvent {}

class ApiBloc extends Bloc<CustomersEvent, ApiState> {
  ApiBloc() : super(ApiState(customers: null, error: null)) {
    on<GetCustomersEvent>((event, emit) async {
      await fetchCustomers(emit);
    });
  }
  Future<void> fetchCustomers(Emitter<ApiState> emit) async {
    try {
      final customers = await CustomerApiService().getCustomerData();
      emit(state.copyWith(customers: customers));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(error: e.toString()));
    }
  }
}
