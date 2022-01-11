import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_authentication/models/category_filter_model.dart';
import 'package:flutter_authentication/models/models.dart';
import 'package:flutter_authentication/models/price_filter_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FilterLoading());

  Stream<FiltersState> mapEvenToState(
    FiltersEvent event,
  ) async* {
    if (event is FilterLoad) {
      yield* _mapFilterLoadToState();
    }
    if (event is CategoryFilterUpdated) {
      yield* _mapCategoryFilterUpdatedToState(event, state);
    }
    if (event is PriceFilterUpdated) {
      yield* _mapPriceFilterUpdatedToState(event, state);
    }
  }

  Stream<FiltersState> _mapFilterLoadToState() async* {
    yield FilterLoaded(
      filter: Filter(
        categoryFilters: CategoryFilter.filters,
        priceFilters: PriceFilter.filters,
      ),
    );
  }

  Stream<FiltersState> _mapCategoryFilterUpdatedToState(
    CategoryFilterUpdated event,
    FiltersState state,
  ) async* {
    if (state is FilterLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      yield FilterLoaded(
        filter: Filter(
          categoryFilters: updatedCategoryFilters,
          priceFilters: state.filter.priceFilters,
        ),
      );
    }
  }

  Stream<FiltersState> _mapPriceFilterUpdatedToState(
    PriceFilterUpdated event,
    FiltersState state,
  ) async* {
    if (state is FilterLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();

      yield FilterLoaded(
        filter: Filter(
          categoryFilters: state.filter.categoryFilters,
          priceFilters: updatedPriceFilters,
        ),
      );
    }
  }
}
