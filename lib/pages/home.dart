import 'package:flutter/material.dart';
import 'package:world_time/pages/loading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data;

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed through the route
    data ??= ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    print(data);

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: data!.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the content
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text("Edit Location"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data!['location'] ?? 'No Location Found',
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  data!['time'] ?? 'No Location Found',
                  style: const TextStyle(fontSize: 66.0),
                ),
              ],
            )
          : const Center(child: Loading()),
    )));
    //body: Text("Home Screen"),
  }
}
