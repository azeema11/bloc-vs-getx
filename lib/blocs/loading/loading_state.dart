part of 'loading_bloc.dart';

@immutable
abstract class LoadingState {}

class LoadingInitial extends LoadingState {}

class DataLoadingState extends LoadingState {}

class LoadingSuccessState extends LoadingState {}

class LoadingFailedState extends LoadingState {}
