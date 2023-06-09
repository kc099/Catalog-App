import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageurl;
  bool isFavorite;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imageurl,
    required this.id,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
