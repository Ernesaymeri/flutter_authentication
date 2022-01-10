import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/models/restaurant_model.dart';
import 'package:flutter_authentication/screens/basket/basket_screen.dart';
import 'package:flutter_authentication/screens/checkout/checkout_screen.dart';
import 'package:flutter_authentication/screens/delivery_time/delivery_time_screen.dart';
import 'package:flutter_authentication/screens/edit_basket/edit_basket_screen.dart';
import 'package:flutter_authentication/screens/filter/filter_screen.dart';
import 'package:flutter_authentication/screens/home/home_screen.dart';
import 'package:flutter_authentication/screens/location/location_screen.dart';
import 'package:flutter_authentication/screens/login_and_register/login.dart';

import 'package:flutter_authentication/screens/restaurant_details/restaurant_details_screen.dart';
import 'package:flutter_authentication/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:flutter_authentication/screens/voucher/voucher_screen.dart';


class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments as Restaurant);
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
            restaurants: settings.arguments as List<Restaurant>);
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
      ),
      settings: RouteSettings(name: '/error'),
    );
  }
}
