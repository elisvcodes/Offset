import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  final String authToken;
  final String userId;

  Products(this.authToken, this.userId, this._items);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  double get trackedEmission {
    var total = 0.0;
    favoriteItems.forEach((prodItem) {
      // print("Addint ${prodItem.carbon}");
      total += prodItem.carbon;
    });
    return total;
  }

  double get trackedTotalEmissionPerYear {
    var total = 0.0;
    favoriteItems.forEach((prodItem) {
      print(
          "AddING PRODUCT: ${prodItem.brand}:  ${prodItem.carbonPerYear} with a total of: ${total}");
      total += prodItem.carbonPerYear;
    });
    return total;
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    var url = Uri.parse(
        'https://descartable-server-default-rtdb.firebaseio.com/items.json');
    // 'https://descartable-server-default-rtdb.firebaseio.com/products.json?auth=$authToken&$filterString');
    //
    print("pre filter by String User  in $url");
    try {
      print("Searching filter by String User  in $url");
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      url = Uri.parse(
          'https://descartable-server-default-rtdb.firebaseio.com/userFavorites/$userId.json');
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];

      extractedData.forEach((prodId, prodData) {
        print(prodData);
        loadedProducts.add(Product(
          id: prodId,
          title: "${prodData['brand']} | ${prodData['item_category']}",
          price: prodData['price'].toDouble(),
          isFavorite:
              favoriteData == null ? false : favoriteData[prodId] ?? false,
          imageUrl: prodData['image_url'],
          bioTime: prodData['bio_time'].toDouble(),
          brand: prodData['brand'],
          carbon: prodData['carbon'].toDouble(),
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      print("error");
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        'https://descartable-server-default-rtdb.firebaseio.com/items.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'creatorId': userId,
        }),
      );
      final newProduct = Product(
        title: product.title,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          'https://descartable-server-default-rtdb.firebaseio.com/items/$id.json');
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.parse(
        'https://descartable-server-default-rtdb.firebaseio.com/items/$id.json');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
