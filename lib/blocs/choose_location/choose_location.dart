import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/world_time.dart';
import '../../repository/world_time_repository.dart';
import '../../utils/utils.dart';
import 'choose_location_bloc.dart';

class ChooseLocation extends StatelessWidget {
  final List<WorldTime> _locations = Utils.generateTimeZones();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseLocationBloc>(
      create: (context) => ChooseLocationBloc(
        RepositoryProvider.of<WorldTimeRepo>(context),
      ),
      child: BlocListener<ChooseLocationBloc, ChooseLocationState>(
        listener: (context, state) {
          if (state is LocationTimeFetchSuccess) {
            Navigator.pop(context, true);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text('Choose a Location'),
            centerTitle: true,
            elevation: 0,
          ),
          body: ListView.builder(
            itemCount: _locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 1.0,
                  horizontal: 4.0,
                ),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      context.read<ChooseLocationBloc>().add(
                            FetchLocationTimeEvent(
                              newLocationData: _locations[index],
                            ),
                          );
                    },
                    title: Text(
                      _locations[index].location.replaceAll(
                            "_",
                            " ",
                          ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/${_locations[index].flag}',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
