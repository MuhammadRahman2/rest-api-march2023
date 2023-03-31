import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_with_natishkumarsing/model/product.dart';
import 'package:rest_api_with_natishkumarsing/model/users.dart';

class ProductApi {
  List<Products> product = [];
  Future<List<Products>> fetchUserData() async {
    debugPrint('fetchUser');
    // https://randomuser.me/api/?results=10
    const productBaseUrl = 'https://fashionavia.herokuapp.com/api/products';
    final uriParse = Uri.parse(productBaseUrl);
    Response response = await http.get(uriParse);
    final body = response.body;
    // print(body);
    final json = jsonDecode(body);
    final result = json['data'] as List<dynamic>;
    print('json: $result');
    // for (Map i in result) {
    //   final attribute =  Attribute(sku: i['attributes']['sku'], title: i['attributes']['title'], slug: i['attributes']['slug']);
    //   product.add(Products(id: i['id'], attribute: attribute));
    // }

    // second method
    // final users = result.map((e) {
    //   return Users(
    //       gender: e['gender'],
    //       email: e['email'],
    //       phone: e['phone'],
    //       cell: e['cell'],
    //       nat: e['nat']);
    // }).toList();

    // 3rd method  make a mehtod in users class for them
    // if (response.statusCode == 20
    //0) {
    for (Map<String, dynamic> i in result) {
      product.add(Products.fromJson(i));
    }

    print('product: ${product.map((e) => e.attribute.title)}');
    // }

    return product;
    debugPrint('fetchUser complete');
  }
}
