import 'package:flutter/material.dart';
import 'package:actividad_2/models/restaurant.dart';
import 'package:actividad_2/screens/restaurant_details.dart';

class RestaurantList extends StatelessWidget {
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Restaurante 1',
      description: 'Descripción del Restaurante 1',
      rating: 4.5,
      latitude: 18.85015331653934,
      longitude: -99.20113107189124,
      imageUrl: 'https://via.placeholder.com/100',
    ),
    Restaurant(
      name: 'Restaurante 2',
      description: 'Descripción del Restaurante 2',
      rating: 4.0,
      latitude: 19.432608,
      longitude: -99.133209,
      imageUrl: 'https://via.placeholder.com/100',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Restaurantes'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return ListTile(
            leading: Image.network(restaurant.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(restaurant.name),
            subtitle: Text(restaurant.description),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetails(restaurant: restaurant),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
