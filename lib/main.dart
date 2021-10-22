import 'package:fast/UI/Launch/launch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fast',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          primaryColor: Colors.blue),
      home: const Launch(),
    );
  }
}
