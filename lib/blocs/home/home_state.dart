part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  Color backgroundColor;
  String bgImage;
  String location;
  String time;
  HomeState({
    required this.backgroundColor,
    required this.bgImage,
    required this.location,
    required this.time,
  });
}

class HomeInitialState extends HomeState {
  HomeInitialState({
    required super.backgroundColor,
    required super.bgImage,
    required super.location,
    required super.time,
  });
}

class HomeUpdateState extends HomeState {
  HomeUpdateState({
    required super.backgroundColor,
    required super.bgImage,
    required super.location,
    required super.time,
  });
}
