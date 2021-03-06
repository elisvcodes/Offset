import 'dart:convert';

import 'package:flutter/foundation.dart';
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

  List<Product> get trackedItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  double get trackedEmission {
    var total = 0.0;
    trackedItems.forEach((prodItem) {
      // print("Addint ${prodItem.carbon}");
      total += prodItem.carbon;
    });
    return total;
  }

  double get trackedTotalEmissionPerYear {
    var total = 0.0;
    trackedItems.forEach((prodItem) {
      // print(
      //     "AddING PRODUCT: ${prodItem.brand}:  ${prodItem.carbonPerYear} with a total of: ${total}");
      total += prodItem.carbonPerYear;
    });
    return total;
  }

  double get trackedTotalEmissionPerMonth {
    var total = 0.0;
    trackedItems.forEach((prodItem) {
      // print(
      //     "AddING PRODUCT: ${prodItem.brand}:  ${prodItem.carbonPerYear} with a total of: ${total}");
      total += prodItem.carbonPerMonth;
    });
    return total;
  }

  double get totalTrackedEmissions {
    var total = 0.0;
    items.forEach((element) {
      total += element.carbonPerDay * element.datesCounted;
    });

    return total;
  }

  double get trackedTotalEmissionPerDay {
    var total = 0.0;
    trackedItems.forEach((prodItem) {
      // print(
      //     "AddING PRODUCT: ${prodItem.brand}:  ${prodItem.carbonPerYear} with a total of: ${total}");
      // total += prodItem.carbonPerDay;
      // total += prodItem.carbonPerDay +
    });
    return total;
  }

  List<String> get trackedCategories {
    List<String> trackedList = [];
    trackedItems.forEach((prodItem) {
      // print(
      //     "AddING PRODUCT: ${prodItem.brand}:  ${prodItem.carbonPerYear} with a total of: ${total}");
      trackedList
          .add(prodItem.itemCategory == null ? "" : prodItem.itemCategory);
    });
    trackedList = Set.of(trackedList).toList();
    return trackedList;
  }

  List<Product> get trackedCategoriesGenerics {
    List<Product> trackedList = [];
    trackedList = genericItems
        .where((genericItem) =>
            trackedCategories.contains(genericItem.itemCategory))
        .toList();
    trackedList = Set.of(trackedList).toList();
    return trackedList;
  }

  double genericItemCarbonCumsumptionPerDay(String targetCategory) {
    return genericItems
        .firstWhere((element) => element.itemCategory == targetCategory)
        .carbonPerDay;
  }

  double get getTotalSavedUsingEachProductTracking {
    //go through all objects and add ups the tracking multiplayed by the consumption per day
    double totalSaved = 0.0;
    items.forEach((element) {
      totalSaved += (element.carbonPerDay * element.datesCounted -
          genericItemCarbonCumsumptionPerDay(element.itemCategory));
    });

    return totalSaved;
  }

  double get trackedCategoriesGenericsEmissionPerYear {
    var total = 0.0;
    trackedCategoriesGenerics.forEach((prodItem) {
      // print(
      //     "AddING PRODUCT: ${prodItem.brand}:  ${prodItem.carbonPerYear} with a total of: ${total}");
      total += prodItem.carbonPerYear;
    });
    return total;
  }

  double get emissionSavedPerYear {
    return trackedCategoriesGenericsEmissionPerYear -
        trackedTotalEmissionPerYear;
  }

  double get emissionSavedPerMonth {
    return emissionSavedPerYear / 12;
  }

  double get emissionSavedPerDay {
    return emissionSavedPerMonth / 12;
  }

// Estimageted based on adding all products being tracked estiimations per year
  double get estimatedTotalPerYear {
    double total = 0;
    this.trackedItems.forEach((element) {
      print("estimated+: ${element.estimatedPerYear}");
      total += element.estimatedPerYear;
    });
    return total;
  }

  double get estimatedTotalPerMonth {
    return estimatedTotalPerYear / 12;
  }

  double get estimatedTotalPerDay {
    return estimatedTotalPerMonth / 30;
  }

  List<Product> get genericItems {
    return _items.where((prodItem) => prodItem.isGeneric).toList();
  }

  List<Product> get greenItems {
    return _items.where((prodItem) => prodItem.isGreen).toList();
  }

  List<Product> get reusableItems {
    return _items.where((prodItem) => prodItem.isReusable).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> getAlternatives(Product base) {
    final productCategory = base.itemCategory;
    // Get all the items from this category
    List<Product> categoryProducts = _items
        .where((prodItem) => prodItem.itemCategory == productCategory)
        .toList();
    return categoryProducts
        .where((prodItem) => prodItem.id != base.id)
        .toList();
  }

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    var url = Uri.parse(
        'https://descartable-server-default-rtdb.firebaseio.com/items.json');
    // 'https://descartable-server-default-rtdb.firebaseio.com/products.json?auth=$authToken&$filterString');
    //
    // print("pre filter by String User  in $url");
    try {
      // print("Searching filter by String User  in $url");
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      url = Uri.parse(
          'https://descartable-server-default-rtdb.firebaseio.com/userTracking/$userId.json');
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];
      print(favoriteData);

//
      // print(favoriteData['ID1']['isFavorite']);
      extractedData.forEach((prodId, prodData) {
        // print("this is a dates Counted test");
        // print(favoriteData[prodId]);
        loadedProducts.add(Product(
            id: prodId,
            // title: "${prodData['brand']} | ${prodData['item_category']}",
            title: prodData['title'],
            price: prodData['price'].toDouble(),
            isFavorite: favoriteData[prodId] == null
                ? false
                : favoriteData[prodId]['isFavorite'] == null
                    ? false
                    : favoriteData[prodId]['isFavorite'],
            datesCounted: favoriteData[prodId] == null
                ? 0
                : favoriteData[prodId]['datesCounted'] == null
                    ? 0
                    : favoriteData[prodId]['datesCounted'],
            imageUrl: prodData['image_url'],
            bioTime: prodData['bio_time'].toDouble(),
            brand: prodData['brand'],
            carbon: prodData['carbon'].toDouble(),
            followers: prodData['followers'] == "" ? 0 : prodData['followers'],
            lifespam: prodData['lifespam'].toDouble(),
            isGeneric: prodData['is_generic'],
            isGreen: prodData['is_green'],
            isReusable: prodData['is_reusable'],
            description: prodData['description'],
            itemCategory: prodData['item_category'],
            itemTags: prodData["item_tags"]));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      print("error");
      throw (error);
    }
  }

  void addTrackedProductsADay(String authToken, String userId, int daysToAdd) {
//if they are being tracked add a day
    trackedItems.forEach((prodItem) {
      prodItem.addDateValues(daysToAdd);
      prodItem.syncDate(authToken, userId);
    });

    // Get all products carbon footprint by themselves
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
