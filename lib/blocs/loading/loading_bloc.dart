import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/errors.dart';
import '../../repository/world_time_repository.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  WorldTimeRepo _worldTimeRepo;
  LoadingBloc(this._worldTimeRepo) : super(LoadingInitial()) {
    on<DataLoadEvent>(_onDataLoadEvent);
  }

  void _onDataLoadEvent(DataLoadEvent event, Emitter<LoadingState> emit) async {
    emit(
      DataLoadingState(),
    );
    await _worldTimeRepo.getTime();
    if (_worldTimeRepo.getLocationTime.time ==
        Errors.TIME_FETCH_FAILED_ERROR) {
      emit(
        LoadingFailedState(),
      );
    } else {
      emit(
        LoadingSuccessState(),
      );
    }
  }
}
