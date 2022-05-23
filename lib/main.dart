import 'package:bloc_demo/services/world_time_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repository/world_time_repository.dart';
import 'routes/routes.dart';
import 'utils/app_bloc_observer.dart';

void main() async {
  BlocOverrides.runZoned(
    () => runApp(Main(),),
    blocObserver: AppBlocObserver(),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WorldTimeRepo(
        WorldTimeService(),
      ),
      child: MaterialApp(
        initialRoute: '/',
        routes: Routes.routes,
      ),
    );
  }
}
