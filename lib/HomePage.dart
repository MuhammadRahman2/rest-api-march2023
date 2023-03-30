import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          // print(users[index]);
          print('atteribute: ${users[index]['attributes']['title']}');
          return ListTile(
              // leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(user['attributes']['title']),
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUserData();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void fetchUserData() async {
    debugPrint('fetchUser');
    const baseUrl = 'https://fashionavia.herokuapp.com/api/products';
    final uriParse = Uri.parse(baseUrl);
    Response response = await http.get(uriParse);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['data'];
    });

    debugPrint('fetchUser complete');
  }
}
