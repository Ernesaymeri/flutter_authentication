import 'package:equatable/equatable.dart';
import 'models.dart';

class Restaurant extends Equatable {
  final String name;
  final String imageUrl;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  const Restaurant({
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.priceCategory,
    required this.deliveryFee,
    required this.distance,
  });

  @override
  List<Object> get props {
    return [ 
      imageUrl,
      name, 
      tags, 
      menuItems,
      deliveryTime,
      priceCategory, 
      deliveryFee, 
      distance,
    ];
  }

  static List<Restaurant> restaurants = [
    Restaurant(
      imageUrl:
          'https://media.istockphoto.com/photos/empty-restaurant-interior-picture-id1290237592',
      name: 'Golden Ice Gelato Artigianale',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$' ,
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      imageUrl:
          'https://media.istockphoto.com/photos/portrait-of-asian-senior-man-barista-or-coffee-owner-using-coffee-picture-id1286796686',
      name: 'Killer Pizza from Mars',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 2)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 2)
          .toList(),
      deliveryTime: 30,
      priceCategory: '\$' ,
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      imageUrl:
          'https://www.ilcannetorestaurant.com/resourcefiles/homeimages/canneto-1.jpg?version=12062021125750',
      name: 'The French Laundry',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .toList(),
      deliveryTime: 20,
      priceCategory: '\$' ,
      deliveryFee: 2.50,
      distance: 0.4,
    ),
    Restaurant(
      imageUrl:
          'https://www.dianagardenmilan.com/resourcefiles/hero-image/h-club-diana-restaurant.jpg?version=12132021153516',
      name: 'Goosefoot',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .toList(),
      deliveryTime: 40,
      priceCategory: '\$' ,
      deliveryFee: 1.5,
      distance: 0.3,
    ),
    Restaurant(
      imageUrl:
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&w=1000&q=80',
      name: 'Golden Ice Gelato Artigianale',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .toList(),
      deliveryTime: 25,
      priceCategory: '\$',
      deliveryFee: 2.99,
      distance: 3.6,
    ),
    Restaurant(
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/18/5e/17/62/restaurant.jpg',
      name: 'La Tartina',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 6)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 6)
          .toList(),
      deliveryTime: 45,
      priceCategory: '\$',
      deliveryFee: 1.5,
      distance: 1.2,
    ),
  ];
}
