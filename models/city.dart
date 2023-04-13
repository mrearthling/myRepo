import 'package:flutter/foundation.dart';

class City {
  final String name;
  final String imageUrl;
  final String description;
  ValueNotifier<bool> isFavorite;

  City({
    required this.name,
    required this.imageUrl,
    required this.description,
    bool isFavorite = false,
  }) : isFavorite = ValueNotifier<bool>(isFavorite);

  void toggleFavoriteStatus() {
    isFavorite.value = !isFavorite.value;
  }
}