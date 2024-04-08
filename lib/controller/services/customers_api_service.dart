import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';
import 'package:hypermarket_ecommerce/utils/api_utils.dart';

class CustomerApiService {
  static final Dio dio = Dio();

  static Future<List<CustomersModel>> getCustomerData() async {
    try {
      Response response = await dio.get(ApiUtils.customersUrl);
      if (response.statusCode == 200) {
        final data = response.data;
        final customers = <CustomersModel>[];
        for (var result in data['data']) {
          customers.add(CustomersModel.fromJson(result));
        }
        return customers;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception('Error occured: $e');
    }
  }

  static Future<List<CustomersModel>> searchCustomers(String searchText) async {
    try {
      Response response = await dio
          .get(ApiUtils.customersUrl + ApiUtils.searchUrl + searchText);
      if (response.statusCode == 200) {
        final data = response.data;
        final customers = <CustomersModel>[];
        for (var customer in data['data']) {
          customers.add(CustomersModel.fromJson(customer));
        }
        return customers;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> addCustomer(CustomersModel model) async {
    try {
      final Map<String, dynamic> modelJson = model.toJson();
      Response response = await dio.post(
        ApiUtils.customersUrl,
        data: modelJson,
      );
      if (response.statusCode == 200) {
        log('Success');
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
