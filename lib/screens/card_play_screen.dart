import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'text_response_screen.dart';

class CardPlayScreen extends StatefulWidget {
  const CardPlayScreen({super.key});

  @override
  State<CardPlayScreen> createState() => _CardPlayScreenState();
}

class _CardPlayScreenState extends State<CardPlayScreen> {
  final List<String> _cards = [
    'What do you think your family should do together more often?',
    'What is something you are grateful for right now?',
    'Tell a story about a time you felt truly happy.',
    'If you could learn a new skill instantly, what would it be?',
  ];

  late AppinioSwiperController _swiperController;

  @override
  void initState() {
    super.initState();
    _swiperController = AppinioSwiperController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Play',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
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
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 90, horizontal: 48),
                  child: AppinioSwiper(
                    controller: _swiperController,
                    cardBuilder: (context, index) => _buildCard(_cards[index]),
                    cardCount: _cards.length,
                    duration: const Duration(milliseconds: 300),
                    maxAngle: 15,
                    threshold: 50,
                    backgroundCardCount: 2,
                    backgroundCardScale: 0.9,
                    backgroundCardOffset: const Offset(0, 20),
                    isDisabled: false,
                    loop: false,
                    allowUnSwipe: true,
                    allowUnlimitedUnSwipe: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_left),
                    iconSize: 40,
                    onPressed: () {
                      _swiperController.swipeLeft();
                    },
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      onPressed: () {
                        _swiperController.unswipe();
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_right),
                    iconSize: 40,
                    onPressed: () {
                      _swiperController.swipeRight();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String text) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFCDC0DD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCircleIconButton(
                icon: Icons.text_fields,
                label: 'Text',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TextResponseScreen(question: text),
                    ),
                  );
                },
              ),
              _buildCircleIconButton(
                icon: Icons.videocam,
                label: 'Video',
                onTap: () {},
              ),
              _buildCircleIconButton(
                icon: Icons.mic,
                label: 'Mic',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Submit your response',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
