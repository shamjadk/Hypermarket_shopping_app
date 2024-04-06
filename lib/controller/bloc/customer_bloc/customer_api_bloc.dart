import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_api_state.dart';
import 'package:hypermarket_ecommerce/controller/services/customers_api_service.dart';
import 'package:hypermarket_ecommerce/controller/services/customers_search_service.dart';

sealed class CustomersApiEvent {}

class GetCustomersEvent implements CustomersApiEvent {}

class SearchCustomersEvent implements CustomersApiEvent {
  final String? serchText;

  SearchCustomersEvent(this.serchText);
}

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
        final searchText = event.serchText;
        await searchCustomers(emit, searchText!);
      },
    );
  }

  Future<void> getCustomers(Emitter<CustomerApiState> emit) async {
    try {
      final customers = await CustomerApiService().getCustomerData();
      emit(state.copyWith(customers: customers));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> searchCustomers(
      Emitter<CustomerApiState> emit, String name) async {
    try {
      final searchCustomer =
          await CustomerSearchApiService().searchCustomers(name);
      emit(state.copyWith(customers: searchCustomer));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
