import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'us.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'gojo.jpg'),
    WorldTime(url: 'Asia/Manila', location: 'Manila', flag: 'ph.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];

    // Show a loading spinner while fetching data
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await instance.getTime();

      // Navigate back with data
      Navigator.pop(context); // Dismiss loading spinner
      Navigator.pop(context, {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      });
    } catch (e) {
      Navigator.pop(context); // Dismiss loading spinner
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch time: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Choose a Location"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                onTap: () => updateTime(index),
                title: Text(
                  locations[index].location,
                  style: const TextStyle(fontSize: 18),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
