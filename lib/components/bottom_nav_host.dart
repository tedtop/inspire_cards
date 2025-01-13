import 'package:flutter/material.dart';

import '../screens/card_play_screen.dart';
import '../screens/placeholder_screen.dart';

class BottomNavHost extends StatefulWidget {
  const BottomNavHost({super.key});

  @override
  State<BottomNavHost> createState() => _BottomNavHostState();
}

class _BottomNavHostState extends State<BottomNavHost> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    CardPlayScreen(),
    PlaceholderScreen(title: 'Decks'),
    PlaceholderScreen(title: 'Feed'),
    PlaceholderScreen(title: 'Groups'),
    PlaceholderScreen(title: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Decks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nature_people),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}