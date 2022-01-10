import 'package:flutter/material.dart';
import 'package:flutter_authentication/models/models.dart';
import 'package:flutter_authentication/widgets/widgets.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant-listing';

  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListingScreen(restaurants: restaurants),
      settings: const RouteSettings(name: routeName),
    );
  }

  final List<Restaurant> restaurants;

  const RestaurantListingScreen({
    required this.restaurants,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurants'),
      backgroundColor: Color(0xFFFE3C5B),),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return RestaurantCard(restaurant: restaurants[index]);
          },
        ),
      ),
    );
  }
}
