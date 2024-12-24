import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed through the route
    data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    print(data);

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: const Icon(Icons.edit_location),
            label: const Text("Edit Location"),
          ),
        ],
      )),
      //body: Text("Home Screen"),
    );
  }
}
