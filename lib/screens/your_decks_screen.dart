import 'package:flutter/material.dart';

class DecksScreen extends StatelessWidget {
  const DecksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Your Decks',
          style: TextStyle(color: Colors.black),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE9FDF5),
              Color(0xFFFCE9F1),
              Color(0xFFF9E4F0),
              Color(0xFFFFFDFD),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.4, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: GridView.count(
            padding: const EdgeInsets.all(16.0),
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: [
              _buildDeckCard(
                title: 'PERSONAL DECK',
                price: 'FREE',
                color: const Color(0xFFE57373),
                icon: Icons.person,
              ),
              _buildDeckCard(
                title: 'FAMILY DECK',
                price: '\$0.99',
                color: const Color(0xFF9575CD),
                icon: Icons.family_restroom,
              ),
              _buildDeckCard(
                title: 'COLLEAGUES DECK',
                price: '\$0.99',
                color: const Color(0xFF4FC3F7),
                icon: Icons.group,
              ),
              _buildDeckCard(
                title: 'GET A CONVERSATION STARTED',
                price: '\$0.99',
                color: const Color(0xFF81C784),
                icon: Icons.chat,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeckCard({
    required String title,
    required String price,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48.0, color: Colors.white),
          const SizedBox(height: 16.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
