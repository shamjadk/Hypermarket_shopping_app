import 'package:dio/dio.dart';
import 'package:hypermarket_ecommerce/model/product_model.dart';
import 'package:hypermarket_ecommerce/utils/api_utils.dart';

class ProductApiService {
 static final Dio dio = Dio();

 static Future<List<Products>> getProducts() async {
    try {
      Response response = await dio.get(ApiUtils.productUrl);
      if (response.statusCode == 200) {
        final data = response.data;
        final datas = <Products>[];
        for (var product in data['data']) {
          datas.add(Products.fromJson(product));
        }
        return datas;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception('Failed to fetch products $e');
    }
  }

  static Future<List<Products>> searchProducts(String searchText) async {
    try {
      Response response =
          await dio.get(ApiUtils.productUrl + ApiUtils.searchUrl + searchText);
      if (response.statusCode == 200) {
        final data = response.data;
        final datas = <Products>[];
        for (var product in data['data']) {
          datas.add(Products.fromJson(product));
        }
        return datas;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception('Failed to fetch products $e');
    }
  }
}
