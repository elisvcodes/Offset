import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// import '../models/http_exception.dart';
import '../data/rank.dart';

class Rank {
  final int carbon;
  final String file;
  final String name;
  Rank({this.carbon, this.file, this.name});

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
      carbon: json['carbon'] as int,
      file: json['file'] as String,
      name: json['name'] as String,
    );
  }
}

class Meta with ChangeNotifier {
  String name;
  int dayCount;
  double totalCarbonSaved;
  List<Rank> ranks;

  DateTime lastDateSync;
  final DateTime defaultDate = DateTime.parse('2021-04-12 00:05:41.446919');

  Meta({
    @required this.name,
    @required this.dayCount,
    this.totalCarbonSaved = 0,
    this.lastDateSync,
    this.ranks,
  });

  void addDay(double carbonSavedThatDay) {
    this.dayCount++;
    //for each product add if they are there

    this.totalCarbonSaved += carbonSavedThatDay;
    notifyListeners();
  }

  int getDatesLastNowDifference() {
    return DateTime.now().difference(lastDateSync).inDays;
  }

  void updateLastDateAsToday() {
    this.lastDateSync = DateTime.now();

    notifyListeners();
  }

  void fetchAndSetMeta(String userId) async {
    var url = Uri.parse(
        'https://descartable-server-default-rtdb.firebaseio.com/userMeta/$userId.json');

    final metaResponse = await http.get(url);
    final metaData = json.decode(metaResponse.body);
    print(metaData);
  }

  // optimistic approach
  void postMeta(String authToken, String userId) async {
    notifyListeners();
    final url = Uri.parse(
        'https://descartable-server-default-rtdb.firebaseio.com/userMeta/$userId.json');
    try {
      final response = await http.put(
        url,
        body: json.encode({
          'user_id': userId,
          'name': name,
          'dayCount': dayCount,
          'totalCarbonsaved': totalCarbonSaved,
          'ranks': ranks,
          'lastDateSync': lastDateSync.toIso8601String()
        }),
      );
      // If there is an error but theconnection works

    } catch (error) {
      // If the attempts fails
      print(error);
      // _setFavValue(oldStatus);
    }

    print('Successfully uipdated?');
  }

  void fetchRanks() async {
    var url = Uri.parse('http://wngnelson.com/api/rank.json');

    try {
      // print("Searching filter by String User  in $url");
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      extractedData.forEach((prodId, prodData) {
        // print(prodData);
        ranks.add(Rank(
          carbon: extractedData["carbon"].toInt(),
          name: extractedData["name"],
          file: extractedData["file"],
        ));
      });
    } catch (error) {
      throw (error);
    }
  }

  String get rank {
    var myRanks = rankData.where((element) =>
        int.parse(element["carbon"].toString()) >= this.totalCarbonSaved);

    return myRanks.first["name"];
  }

  String get rankFile {
    var myRanks = rankData.where((element) =>
        int.parse(element["carbon"].toString()) >= this.totalCarbonSaved);

    return myRanks.first["file"];
  }
}
