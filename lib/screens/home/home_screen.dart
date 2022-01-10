import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_authentication/models/category_model.dart';
import 'package:flutter_authentication/models/models.dart';
import 'package:flutter_authentication/models/promo_model.dart';
import 'package:flutter_authentication/widgets/category_box.dart';
import 'package:flutter_authentication/widgets/food_search_box.dart';
import 'package:flutter_authentication/widgets/promo_box.dart';
import 'package:flutter_authentication/widgets/restaurant_card.dart';
import 'package:flutter_authentication/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(category: Category.categories[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 125.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.promos.length,
                  itemBuilder: (context, index) {
                    return PromoBox(promo: Promo.promos[index]);
                  },
                ),
              ),
            ),
            FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Rated',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                      restaurant: Restaurant.restaurants[index]);
                }),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFE3C5B),
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {
           Navigator.pushNamed(context, "/login-screen");
        },
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/location");
            },
            child: Text(
              'CURRENT LOCATION',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            
          ),
          Text(
            'Milan',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
}
