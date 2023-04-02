import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable

abstract class CityEvent extends Equatable{
  const CityEvent();
}

//data loading state

class CityLoadingEvent extends CityEvent{
  @override
  List<Object?> get props=>[];
  
}
