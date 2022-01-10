import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_authentication/blocs/autocomplete/autocomplete_bloc.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, state) {
        if (state is AutocompleteLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AutocompleteLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Your Location',
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                context
                    .read<AutocompleteBloc>()
                    .add(LoadAutocomplete(searchInput: value));
              },
            ),
          );
        } else {
          return Text('Something went wrong');
        }
      },
    );
  }
}
