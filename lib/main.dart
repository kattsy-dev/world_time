import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(useMaterial3: false),
      initialRoute: '/', // Initial or first screen
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      }));
}
