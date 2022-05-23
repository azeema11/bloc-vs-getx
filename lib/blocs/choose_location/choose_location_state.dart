part of 'choose_location_bloc.dart';

@immutable
abstract class ChooseLocationState {}

class ChooseLocationInitial extends ChooseLocationState {}

class LocationTimeFetchingState extends ChooseLocationState{}

class LocationTimeFetchSuccess extends ChooseLocationState{}

class LocationTimeFetchFailed extends ChooseLocationState{}