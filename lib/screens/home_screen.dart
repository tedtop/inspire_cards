import 'package:flutter/material.dart';
import 'play_mode_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color greenTileColor = Color(0xFFA8F0BB);
  static const Color tealTileColor = Color(0xFFA4F2F2);
  static const Color purpleTileColor = Color(0xFFE8D8FF);
  static const Color pinkTileColor = Color(0xFFF9C8DD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFF1F3),
                Color(0xFFFFF9FE),
                Color(0xFFF0F7F7),
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'WELCOME TO INSPIRE CARDS 👋',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose your way to play and dive into engaging conversations',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildTile(
                        context,
                        title: 'PLAY',
                        subtitle:
                            'Pick Solo, Multiplayer, or Group\nfor meaningful chats.',
                        color: greenTileColor,
                        iconData: Icons.stars,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PlayModeScreen(),
                            ),
                          );
                        },
                      ),
                      _buildTile(
                        context,
                        title: 'WEBSITE',
                        subtitle:
                            'Shop new card decks\nand fun extras in our store.',
                        color: tealTileColor,
                        iconData: Icons.public,
                        onTap: () {},
                      ),
                      _buildTile(
                        context,
                        title: 'ABOUT ICF',
                        subtitle:
                            'Learn how we help people\nconnect through great talks.',
                        color: purpleTileColor,
                        iconData: Icons.info,
                        onTap: () {},
                      ),
                      _buildTile(
                        context,
                        title: 'DONATION',
                        subtitle:
                            'Give decks to schools\nand youth with your donation.',
                        color: pinkTileColor,
                        iconData: Icons.volunteer_activism,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Color color,
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconData, size: 40, color: Colors.black54),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
