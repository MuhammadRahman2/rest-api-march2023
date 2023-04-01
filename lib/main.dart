import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_natishkumarsing/provider/product_provider.dart';
import 'package:rest_api_with_natishkumarsing/view/HomePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child:  const MaterialApp(
          home: HomePage()
        )  
    );
  }
}
