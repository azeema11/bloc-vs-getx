import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../../repository/world_time_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  WorldTimeRepo _worldTimeRepo;
  HomeBloc(this._worldTimeRepo)
      : super(HomeInitialState(
          backgroundColor: (_worldTimeRepo.getLocationTime.isDaytime
              ? Colors.blue
              : Colors.indigo[700])!,
          bgImage: _worldTimeRepo.getLocationTime.isDaytime
              ? Images.dayImage
              : Images.nightImage,
          location: _worldTimeRepo.getLocationTime.location,
          time: _worldTimeRepo.getLocationTime.time,
        )) {
    on<HomeUpdateEvent>(_onUpdateHomeEvent);
  }

  void _onUpdateHomeEvent(HomeUpdateEvent event, Emitter<HomeState> emit) {
    emit(
      HomeUpdateState(
        backgroundColor: (_worldTimeRepo.getLocationTime.isDaytime
            ? Colors.blue
            : Colors.indigo[700])!,
        bgImage: _worldTimeRepo.getLocationTime.isDaytime
            ? Images.dayImage
            : Images.nightImage,
        location: _worldTimeRepo.getLocationTime.location,
        time: _worldTimeRepo.getLocationTime.time,
      ),
    );
  }
}
