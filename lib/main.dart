import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const InspireCardsApp());
}

class InspireCardsApp extends StatelessWidget {
  const InspireCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspire Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
