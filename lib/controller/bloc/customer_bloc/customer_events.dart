import 'package:hypermarket_ecommerce/model/customers_model.dart';

sealed class CustomersApiEvent {}

class GetCustomersEvent implements CustomersApiEvent {}

class SearchCustomersEvent implements CustomersApiEvent {
  final String? searchText;

  SearchCustomersEvent(this.searchText);
}

class AddCustomerEvent implements CustomersApiEvent {
  final CustomersModel? model;

  AddCustomerEvent(this.model);
}
