part of 'choose_location_bloc.dart';

@immutable
abstract class ChooseLocationEvent {
  WorldTime newLocationData;
  ChooseLocationEvent({
    required this.newLocationData,
  });
}

class FetchLocationTimeEvent extends ChooseLocationEvent {
  FetchLocationTimeEvent({
    required super.newLocationData,
  });
}
