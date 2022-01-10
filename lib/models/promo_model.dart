import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Promo({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
      ];

  static List<Promo> promos = [
    Promo(
      id: 1,
      title: 'Free Delivery on Your first 3 Orders.',
      description:
        'Place an oder of \$10 or more and the delivery fee is on us',
      imageUrl:
        'https://images.unsplash.com/photo-1592861956120-e524fc739696?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    Promo(
      id: 2,
      title: '20% off on Selected Restaurants.',
      description:
        'Get a discount at more than 200+ restaurants',
      imageUrl:
        'https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
  ];
}
