import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:snkr/data/dto/product_dto.dart';
import 'package:snkr/domain/api/product_api.dart';
import 'package:http/http.dart' as http;

@singleton
class ProductApiImpl implements ProductApi {
  @override
  Future<List<ProductDto>> getProducts() async {
    final http.Response response =
        await http.get(Uri.parse('http://34.83.124.114/v1/products'));

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (responseBody['status'] != 200) {
      throw 'Http Status Code : ${responseBody["status"]}';
    }

    final List<dynamic> jsonList = responseBody['result'];

    return jsonList.map((e) => ProductDto.fromJson(e)).toList();
  }
}
