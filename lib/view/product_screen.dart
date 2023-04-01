import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_natishkumarsing/provider/product_provider.dart';

class ProductScreen extends StatelessWidget {
  final List imageList;
  const ProductScreen({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context,listen: true).fetcthFromApi();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...imageList.map((e) {
                            // print("image: $e");
                            return Card(
                              child: Image.network(e),
                            );
                          }).toList()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
