import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hypermarket_ecommerce/core/utils/api_utils.dart';
import 'package:hypermarket_ecommerce/model/customer_model.dart';

class CustomerApiService {
  final dio = Dio();

  Future<List<CustomerModel>> getCustomerData() async {
    try {
      Response response = await dio.get(ApiUtils.baseUrl + ApiUtils.customer);
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        final data = response.data;
        final customers = <CustomerModel>[];

        for (var result in data['data']) {
          customers.add(CustomerModel.fromJson(result));
        }
        return customers;
      } else {
        log(response.statusCode.toString());
        throw Exception("Error");
      }
    } catch (error) {
      throw Exception("Error:$error");
    }
  }
}
