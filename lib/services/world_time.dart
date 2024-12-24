import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String? location; // Location namr for the UI
  String? time; // The time in that location
  String? flag; // URL to an asset flag icon
  String? url; // Location URL for API endpoint

  WorldTime({this.location, this.flag, this.url});
  Future<void> getTime() async {
    // make the request
    http.Response response = await http
        .get(Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    print("");
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
    // Set the time property
    time = now.toString();
  }
}
