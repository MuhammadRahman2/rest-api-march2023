import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_with_natishkumarsing/model/product.dart';
import 'package:rest_api_with_natishkumarsing/model/users.dart';

class UserApi {
  List<Users> users = [];
  Future<List<Users>> fetchUserData() async {
    debugPrint('fetchUser');
    // https://randomuser.me/api/?results=10
    const userBaseUrl = 'https://randomuser.me/api/?results=10';
    final uriParse = Uri.parse(userBaseUrl);
    Response response = await http.get(uriParse);
    final body = response.body;
    // print(body);
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    print('json: $result');
    // for (Map i in result) {
    //   users.add(Users(
    //       gender: i['gender'],
    //       email: i['email'],
    //       phone: i['phone'],
    //       cell: i['cell'],
    //       nat: i['nat']));
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
      // users.add(Users.fromJson(i));
      users.add(Users.fromJson(i));
    }
    // }

    return users;
    debugPrint('fetchUser complete');
  }
}
