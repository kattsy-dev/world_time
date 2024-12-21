import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  //   void getData() {
  //   // Simulate network request for a username
  //   Future.delayed(const Duration(seconds: 3), () {
  //     print("Yoshi");
  //   });

  //   // Simulate network request to get bio of the username
  //   Future.delayed(const Duration(seconds: 2), () {
  //     print("Hello 2 bio");
  //   });

  void getData() async {
    // Simulate network request for a username
    String username = await Future.delayed(const Duration(seconds: 3), () {
      return "Yoshi";
    });

    // Simulate network request bio of thea username
    String bio = await Future.delayed(const Duration(seconds: 2), () {
      return 'vegan, musician & egg collector';
    });

    print("$username - $bio");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Choose a Location"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ElevatedButton(
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
          child: Text('Counter is $counter'),
        ));
  }
}
