import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;

  final String imageUrl;
  bool isFavorite;

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

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
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
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  double get carbonPerMonth {
    return this.carbon >= 0 ? this.carbon : 0.001 / this.lifespam;
  }

  double get carbonPerDay {
    return carbonPerMonth / 30;
  }

  double get carbonPerYear {
    return carbonPerMonth * 12;
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
        body: json.encode(
          isFavorite,
        ),
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
}
