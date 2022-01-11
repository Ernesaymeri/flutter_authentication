import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_authentication/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:flutter_authentication/blocs/geolocation/geolocation_bloc.dart';
import 'package:flutter_authentication/blocs/place/place_bloc.dart';
import 'package:flutter_authentication/widgets/gmap.dart';
import 'package:flutter_authentication/widgets/location_search_box.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state is PlaceLoading) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: BlocBuilder<GeolocationBloc, GeolocationState>(
                          builder: (context, state) {
                            if (state is GeolocationLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is GeolocationLoaded) {
                              return Gmap(
                                lat: state.position.latitude,
                                lng: state.position.longitude,
                              );
                            } else {
                              return Text('Something went wrong.');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SaveButton(),
                Location(),
              ],
            );
          } else if (state is PlaceLoaded) {
            return Stack(
              children: [
                Gmap(
                  lat: state.place.lat,
                  lng: state.place.lon,
                ),
                SaveButton(),
                Location(),
              ],
            );
          } else {
            return Text('Something went wrong.');
          }
        },
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50,
        left: 50,
        right: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            child: Text('Save'),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ));
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      right: 30,
      child: Container(
        height: 200,
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/food_app_logo.svg',
              height: 20,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              children: [
                LocationSearchBox(),
                BlocBuilder<AutocompleteBloc, AutocompleteState>(
                  builder: (context, state) {
                    if (state is AutocompleteLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is AutocompleteLoaded) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        color: state.autocomplete.length > 0
                            ? Colors.black.withOpacity(0.6)
                            : Colors.transparent,
                        child: ListView.builder(
                            itemCount: state.autocomplete.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  state.autocomplete[index].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.white),
                                ),
                                onTap: () {
                                  context.read<PlaceBloc>().add(
                                        LoadPlace(
                                          placeId:
                                              state.autocomplete[index].placeId,
                                        ),
                                      );
                                },
                              );
                            }),
                      );
                    } else {
                      return Text('Something went wrong');
                    }
                  },
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
