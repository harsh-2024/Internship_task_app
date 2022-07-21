import 'package:flutter/material.dart';
import 'api_services/api_networking.dart';
import 'api_services/displayData.dart';
import 'screens/homePage.dart';

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
