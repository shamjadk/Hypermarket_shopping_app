import 'package:dio/dio.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';
import 'package:hypermarket_ecommerce/utils/api_utils.dart';

class CustomerApiService {
  final Dio dio = Dio();

  Future<List<CustomersModel>> getCustomerData() async {
    try {
      Response response = await dio.get(ApiUtils.customersBaseUrl);
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
}
