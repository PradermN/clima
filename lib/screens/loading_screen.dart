import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Latitude: ${location.latitude}, Longitude: ${location.longitude}');
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print('Failed to get data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(appBar: AppBar(title: const Text('Loading Screen')));
  }
}
