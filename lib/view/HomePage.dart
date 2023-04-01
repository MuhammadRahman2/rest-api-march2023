import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_natishkumarsing/provider/product_provider.dart';
import 'package:rest_api_with_natishkumarsing/view/product_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context ,listen:  false).fetcthFromApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context,listen: true).fetcthFromApi();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rest Api'),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, value, child) {
            return ListView.builder(
          itemCount: value.product.length,
          itemBuilder: (context, index) {
            final product = value.product[index];
            // print('image: ${product.imageLinks}');
            return ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductScreen(imageList: product.imageLinks)));
              },
              leading: CircleAvatar(child: Text(product.id.toString())),
              title: Text(product.title),
              subtitle: Text(product.sku),
            );
          },
        );
          },
        )
        
        );
  }
}
