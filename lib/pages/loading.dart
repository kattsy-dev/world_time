import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';
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

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time ?? 'Unknown time';
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
