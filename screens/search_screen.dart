import 'package:flutter/material.dart';
import 'package:naviguide/data/cities.dart';
import 'package:naviguide/widgets/city_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchText = '';

  List<CityCard> _search() {
    if (_searchText.isEmpty) {
      return [];
    }

    return cities
        .where((city) =>
        city.name.toLowerCase().contains(_searchText.toLowerCase()))
        .map((city) => CityCard(city: city))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              _searchText = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Şehir ara...',
          ),
        ),
      ),
      body: ListView(
        children: _search(),
      ),
    );
  }
}
