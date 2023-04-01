import 'package:flutter/cupertino.dart';
import 'package:rest_api_with_natishkumarsing/model/product.dart';
import 'package:rest_api_with_natishkumarsing/services/product_api.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  ProductApi productApi = ProductApi();
  bool isLoading = false;

  List<Product> get product => _products;

  Future<void> fetcthFromApi() async {
    isLoading = true;
    notifyListeners();

    final response = await productApi.fetchUserData();
    _products = response;
    isLoading = false;
    notifyListeners();

  }
}
