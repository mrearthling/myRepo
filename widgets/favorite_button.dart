import 'package:flutter/material.dart';
import 'package:naviguide/data/cities.dart';
import 'package:naviguide/models/city.dart';
import 'package:naviguide/widgets/city_card.dart';

class FavoritesScreen extends StatelessWidget {
  List<City> get _favoriteCities => cities.where((city) => city.isFavorite.value).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favori Şehirler'),
      ),
      body: ListView.builder(
        itemCount: _favoriteCities.length,
        itemBuilder: (context, index) {
          return CityCard(city: _favoriteCities[index]);
        },
      ),
    );
  }
}