import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //   void getData() {
  //   // Simulate network request for a username
  //   Future.delayed(const Duration(seconds: 3), () {
  //     print("Yoshi");
  //   });

  //   // Simulate network request to get bio of the username
  //   Future.delayed(const Duration(seconds: 2), () {
  //     print("Hello 2 bio");
  //   });

  // Asynchronous Function
  // void getData() async {
  //   // Simulate network request for a username
  //   String username = await Future.delayed(const Duration(seconds: 3), () {
  //     return "Yoshi";
  //   });

  //   // Simulate network request bio of thea username
  //   String bio = await Future.delayed(const Duration(seconds: 2), () {
  //     return 'vegan, musician & egg collector';
  //   });

  //   print("$username - $bio");
  // }

  void getTime() async {
    // make the request
    http.Response response = await http.get(
        Uri.parse('https://www.worldtimeapi.org/api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);
    print(data);
    // Get propertie from data

    String dateTime = data['datetime'];
    String offSet = data['utc_offset'].substring(1, 3);
    // print("");
    // print(dateTime);
    // print(offSet);

    // Create Dae Time object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offSet)));
    print("");
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
