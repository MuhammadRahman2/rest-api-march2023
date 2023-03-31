import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_api_with_natishkumarsing/model/users.dart';
import 'package:rest_api_with_natishkumarsing/services/product_api.dart';
import 'package:rest_api_with_natishkumarsing/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Users> users = [];
  UserApi userApi = UserApi();
  ProductApi productApi = ProductApi();
  @override
  void initState() {
    fetcthFromApi();
    super.initState();
  }

  Future<void> fetcthFromApi() async {
    final response = await productApi.fetchUserData();
    setState(() {
      // users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api'),
      ),
      body: ListView.builder(
        itemCount: productApi.product.length,
        itemBuilder: (context, index) {
          final user = productApi.product[index];
          // print(users[index]);
          // print('atteribute: ${users[index].email}');
          return ListTile(
            // leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(user.id.toString()),
            subtitle: Text(user.attribute.title.toString()),
          );
        },
      ),
    );
  }

  // void fetchUserData() async {
  //   debugPrint('fetchUser');
  //   // https://randomuser.me/api/?results=10
  //   const baseUrl = 'https://randomuser.me/api/?results=10';
  //   final uriParse = Uri.parse(baseUrl);
  //   Response response = await http.get(uriParse);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final result = json['results'] as List<dynamic>;

  //   setState(() {
  //     // for (Map i in result) {
  //     //   users.add(Users(
  //     //       gender: i['gender'],
  //     //       email: i['email'],
  //     //       phone: i['phone'],
  //     //       cell: i['cell'],
  //     //       nat: i['nat']));
  //     // }

  //     // second method
  //     // users = result.map((e) {
  //     //   return Users(
  //     //       gender: e['gender'],
  //     //       email: e['email'],
  //     //       phone: e['phone'],
  //     //       cell: e['cell'],
  //     //       nat: e['nat']);
  //     // }).toList();

  //     // 3rd method  make a mehtod in users class for them
  //     if (response.statusCode == 200) {
  //       for (Map<String, dynamic> i in result) {
  //         users.add(Users.fromJson(i));
  //       }
  //     }
  //   });

  //   debugPrint('fetchUser complete');
  // }
}
