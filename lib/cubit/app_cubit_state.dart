// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:travelapp/model/data_model.dart';

abstract class CubitState extends Equatable {}

class InitialState extends CubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState {
  LoadedState(this.places);
  List<DataModel> places;

  @override
  List<Object> get props => [places];
}

class DetailState extends CubitState {
  DetailState(this.place);

  DataModel place;

  @override
  List<Object> get props => [place];
}
