import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/world_time_repository.dart';
import 'home_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<WorldTimeRepo>(context),
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.backgroundColor,
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/${state.bgImage}'),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    120.0,
                    0,
                    0,
                  ),
                  child: Column(
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(
                                context,
                                "/location",
                              ) ??
                              false;
                          if (result) {
                            context.read<HomeBloc>().add(
                                  HomeUpdateEvent(),
                                );
                          }
                        },
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                        ),
                        label: Text(
                          'Edit Location',
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            state.location.replaceAll(
                              "_",
                              " ",
                            ),
                            style: TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        state.time,
                        style: TextStyle(
                          fontSize: 66.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
