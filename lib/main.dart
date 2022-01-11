
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_authentication/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:flutter_authentication/blocs/basket/basket_bloc.dart';
import 'package:flutter_authentication/blocs/filters/filters_bloc.dart';
import 'package:flutter_authentication/blocs/geolocation/geolocation_bloc.dart';
import 'package:flutter_authentication/respositories/geolocation/geolocation_repository.dart';
import 'package:flutter_authentication/respositories/places/places_repository.dart';
import 'package:flutter_authentication/blocs/place/place_bloc.dart';
import 'package:flutter_authentication/screens/screens.dart';

import 'blocs/place/place_bloc.dart';
import 'package:flutter_authentication/config/theme.dart';
import 'package:flutter_authentication/config/app_router.dart';
import 'screens/home/home_screen.dart';
import 'screens/screens.dart';
import 'simple_bloc_observer.dart';


Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation())),
          BlocProvider(
              create: (context) => AutocompleteBloc(
                  placesRepository: context.read<PlacesRepository>())
                ..add(LoadAutocomplete())),
          BlocProvider(
              create: (context) => PlaceBloc(
                  placesRepository: context.read<PlacesRepository>())),
          BlocProvider(
            create: (context) => FiltersBloc()
              ..add(
                FilterLoad(),
              ),
          ),
          BlocProvider(
            create: (context) => BasketBloc()
              ..add(
                StartBasket(),
              ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Animal Shop',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}

