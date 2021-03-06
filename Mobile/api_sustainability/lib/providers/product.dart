import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;

  final String imageUrl;
  bool isFavorite;
  int datesCounted;

  double bioTime;
  String brand;
  double carbon;
  int followers;
  bool isGeneric;
  bool isReusable;
  bool isGreen;

  String itemCategory;
  String itemTags;
  double lifespam;
  String description;

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
    this.datesCounted = 0,
    this.bioTime = 0,
    this.brand = "Generic",
    this.carbon = 0,
    this.followers = 0,
    this.isGeneric = false,
    this.itemCategory = "UNDEFINED",
    this.itemTags = "",
    this.lifespam = 0,
    this.isGreen = false,
    this.isReusable = false,
    this.description = "",
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  void addDateValues(int count) {
    print("Counted before adding: ${datesCounted}");
    this.datesCounted += count;
    notifyListeners();
    print("Counted afteradding: ${datesCounted}");
  }

  double get carbonPerMonth {
    return (this.carbon >= 0 ? this.carbon : 0.001) / this.lifespam;
  }

  double get carbonPerDay {
    return carbonPerMonth / 30;
  }

// Based on carbon multipled times purchased = (12/lifespammonths)
  double get estimatedPerYear {
    return 12 * this.carbon / this.lifespam;
  }

  double get carbonPerYear {
    return estimatedPerYear;
  }

  List<String> get categoriesAsList {
    List<String> myList = this.itemTags.split(',').toList();
    print(myList);
    return myList;
  }

// optimistic approach
  void toggleFavoriteStatus(String authToken, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://descartable-server-default-rtdb.firebaseio.com/userTracking/$userId/$id.json');
    try {
      final response = await http.put(
        url,
        body: json.encode({'isFavorite': isFavorite, 'datesCounted': datesCounted}),
      );
      // If there is an error but theconnection works
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      // If the attempts fails
      _setFavValue(oldStatus);
    }
  }

  void syncDate(String authToken, String userId) async {
    // _addDateValues(1);
    // Instead add the dates according to well the dates

    notifyListeners();
    final url = Uri.parse(
        'https://descartable-server-default-rtdb.firebaseio.com/userTracking/$userId/$id.json');
    try {
      final response = await http.put(
        url,
        body: json.encode({'isFavorite': isFavorite, 'datesCounted': datesCounted}),
      );
      // If there is an error but theconnection works
      if (response.statusCode >= 400) {
        addDateValues(-1);
      }
    } catch (error) {
      // If the attempts fails
      addDateValues(-1);
    }
  }
}
