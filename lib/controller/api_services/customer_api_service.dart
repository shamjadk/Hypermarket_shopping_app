import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hypermarket_ecommerce/core/utils/api_utils.dart';
import 'package:hypermarket_ecommerce/model/customer_model.dart';

class CustomerApiService {
  final dio = Dio();

  Future<CustomerModel?> getCustomerdata(String postPath) async {
    try {
      final response = await dio.get(ApiUtils.baseUrl + postPath);
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        return CustomerModel.fromJson(response.data);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
