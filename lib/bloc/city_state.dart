
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/city_model.dart';


@immutable
abstract class CityState extends Equatable {}

//data loading state

class CityLoadingState extends CityState {
  @override
  List<Object?> get props => [];
}
// data Loaded State

class CityLoadedState extends CityState {
  CityLoadedState(this.ciitiesResponse);

  final CiitiesResponse? ciitiesResponse;
  @override
  List<Object?> get props => [ciitiesResponse];
}


// data errorState

class CityErrorState extends CityState {
  CityErrorState(this.error);

  final String error;
  @override
  List<Object?> get props => [error];
}