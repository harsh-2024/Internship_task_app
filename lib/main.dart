import 'package:flutter/material.dart';
import 'api_services/api_networking.dart';
import 'api_services/displayData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Networking networking = Networking();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text("Lyrics"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
          child: TextButton(
              onPressed: networking.getTracksDetails,
              child: Text('Click here')),
        ),
      ),
    );
  }
}
