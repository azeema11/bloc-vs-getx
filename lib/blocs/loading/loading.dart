import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../repository/world_time_repository.dart';
import 'loading_bloc.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoadingBloc>(
      create: (context) => LoadingBloc(
        RepositoryProvider.of<WorldTimeRepo>(context),
      )..add(
          DataLoadEvent(),
        ),
      child: BlocListener<LoadingBloc, LoadingState>(
        listener: (context, state) {
          if (state is LoadingFailedState) {
            context.read<LoadingBloc>().add(
                  DataLoadEvent(),
                );
          } else if (state is LoadingSuccessState) {
            Navigator.pushReplacementNamed(
              context,
              "/home",
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.blue[900],
          body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
