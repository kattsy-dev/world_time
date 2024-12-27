import 'package:flutter/material.dart';
import 'package:world_time/pages/loading.dart';

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
    // data = (ModalRoute.of(context)?.settings.arguments as Map?) ?? {};
    data = data.isNotEmpty
        ? data
        : (ModalRoute.of(context)?.settings.arguments as Map?) ?? {};

    // Set Background
    bool isDaytime = data['isDaytime'] ?? true;
    String bgImage = isDaytime ? 'day.jpg' : 'night.jpg';

    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/$bgImage'),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: data!.isNotEmpty
            ? Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'flag': result['flag'],
                          'time': result['time'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      "Edit Location",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
                            color: Colors.white,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data!['time'] ?? 'No Location Found',
                    style: const TextStyle(fontSize: 66.0, color: Colors.white),
                  ),
                ],
              )
            : const Center(child: Loading()),
      ),
    )));
    //body: Text("Home Screen"),
  }
}
