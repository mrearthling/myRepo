import 'package:flutter/material.dart';
import 'package:naviguide/models/city.dart';
import 'package:naviguide/screens/city_detail_screen.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard({required this.city});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CityDetailScreen(city: city),
          ),
        );
      },
      child: Card(
        child: ListTile(
          leading: Image.asset(city.imageUrl, width: 60, fit: BoxFit.cover),
          title: Text(city.name),
          trailing: ValueListenableBuilder(
            valueListenable: city.isFavorite,
            builder: (context, bool isFavorite, _) {
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  city.toggleFavoriteStatus();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}