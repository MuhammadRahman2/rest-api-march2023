import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_with_natishkumarsing/model/product.dart';
import 'package:rest_api_with_natishkumarsing/model/user.dart';

class ProductApi {
  Future<List<Product>> fetchUserData() async {
    // debugPrint('fetchUser');
    // https://randomuser.me/api/?results=10
    const productBaseUrl = 'https://fashionavia.herokuapp.com/api/products';
    final uriParse = Uri.parse(productBaseUrl);
    Response response = await http.get(uriParse);
    // print(body);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['data'] as List;
      // if data is not object then no need wirte rsulut we just put json convert as list
      final product = result.map((e) {
        return Product.fromJson(e);
      }).toList();
      return product;
    }
    // print('json: $result');

    // print('product: ${product.map((e) => e.imageLinks)}');
    // }
    return [];
    // debugPrint('fetchUser complete');
  }
}
