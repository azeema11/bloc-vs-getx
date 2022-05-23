import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/errors.dart';
import '../../models/world_time.dart';
import '../../repository/world_time_repository.dart';
import '../../utils/utils.dart';

part 'choose_location_event.dart';
part 'choose_location_state.dart';

class ChooseLocationBloc
    extends Bloc<ChooseLocationEvent, ChooseLocationState> {
  WorldTimeRepo _worldTimeRepo;
  List<WorldTime> locations = Utils.generateTimeZones();
  ChooseLocationBloc(this._worldTimeRepo) : super(ChooseLocationInitial()) {
    on<FetchLocationTimeEvent>(_onFetchLocationTimeEvent);
  }

  void _onFetchLocationTimeEvent(
    FetchLocationTimeEvent event,
    Emitter<ChooseLocationState> emit,
  ) async {
    emit(
      LocationTimeFetchingState(),
    );
    _worldTimeRepo.setLocation(
      event.newLocationData,
    );
    await _worldTimeRepo.getTime();
    if (_worldTimeRepo.getLocationTime.time ==
        Errors.TIME_FETCH_FAILED_ERROR) {
      emit(
        LocationTimeFetchFailed(),
      );
    } else {
      emit(
        LocationTimeFetchSuccess(),
      );
    }
  }
}
