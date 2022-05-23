import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/choose_location_controller.dart';

class ChooseLocationView extends GetView<ChooseLocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: controller.locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1.0,
              horizontal: 4.0,
            ),
            child: Card(
              child: ListTile(
                onTap: () {
                  controller.updateTime(index);
                },
                title: Text(
                  controller.locations[index].location.replaceAll(
                    "_",
                    " ",
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${controller.locations[index].flag}',
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
