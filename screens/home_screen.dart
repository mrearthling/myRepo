import 'package:flutter/material.dart';
import 'package:naviguide/data/cities.dart';
import 'package:naviguide/widgets/city_card.dart';
import 'package:naviguide/screens/favorites_screen.dart';
import 'package:naviguide/screens/notes_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _pageStorageBucket = PageStorageBucket();
  String _searchText = '';

  List<Widget> get _screens {
    List<CityCard> filteredCities = _search();
    return [
      PageStorage(
        child: ListView.builder(
          itemCount: filteredCities.length,
          itemBuilder: (context, index) {
            return filteredCities[index];
          },
        ),
        bucket: PageStorageBucket(),
      ),
      FavoritesScreen(),
      NotesScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<CityCard> _search() {
    if (_searchText.isEmpty) {
      return cities.map((city) => CityCard(city: city)).toList();
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
        title: _selectedIndex == 0
            ? Row(
          children: [
            Icon(Icons.explore),
            SizedBox(width: 8),
            Text('Naviguide     '),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: '  ...Şehir ara...',
                ),
              ),
            ),
          ],
        )
            : Text('Naviguide'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          PageStorage(
            child: _screens[_selectedIndex],
            bucket: _pageStorageBucket,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Şehirler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoriler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notlar',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}



