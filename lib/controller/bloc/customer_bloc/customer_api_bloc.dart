import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_api_state.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_events.dart';
import 'package:hypermarket_ecommerce/controller/services/customers_api_service.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';

class CustomersApiBloc extends Bloc<CustomersApiEvent, CustomerApiState> {
  CustomersApiBloc()
      : super(
          CustomerApiState(customers: null, error: null),
        ) {
    on<GetCustomersEvent>((event, emit) async {
      await getCustomers(emit);
    });
    on<SearchCustomersEvent>(
      (event, emit) async {
        final searchText = event.searchText;
        await searchCustomers(emit, searchText!);
      },
    );
    on<AddCustomerEvent>(
      (event, emit) async {
        await addCustomers(emit, event.model!);
        await getCustomers(emit);
      },
    );
    on<UpdateCustomerEvent>(
      (event, emit) async {
        await updateCustomers(emit, event.model!, event.id!);
        await getCustomers(emit);
      },
    );
  }

  Future<void> getCustomers(Emitter<CustomerApiState> emit) async {
    try {
      final customers = await CustomerApiService.getCustomerData();
      emit(state.copyWith(customers: customers));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> searchCustomers(
      Emitter<CustomerApiState> emit, String name) async {
    try {
      final searchedCustomers = await CustomerApiService.searchCustomers(name);
      emit(state.copyWith(customers: searchedCustomers));
    } catch (e) {
      log('$e');
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> addCustomers(
    Emitter<CustomerApiState> emit,
    CustomersModel model,
  ) async {
    try {
      await CustomerApiService.addCustomer(model);
    } catch (e) {
      log('$e');
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> updateCustomers(
      Emitter<CustomerApiState> emit, CustomersModel model, int id) async {
    try {
      await CustomerApiService.updateCustomer(model, id);
    } catch (e) {
      log('$e');
      emit(state.copyWith(error: e.toString()));
    }
  }
}
