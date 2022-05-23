import 'package:flutter/material.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/loading.dart';
import 'package:demo/pages/choose_location.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/location': (context) => ChooseLocation(),
        },
      ),
    );
