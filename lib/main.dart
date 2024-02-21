import 'package:flutter/material.dart';
import 'sharedpref.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Flutter Shared Preferences',
      home:sharedpref(),
    );
  }
}

