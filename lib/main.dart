import 'package:flutter/material.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'dart:math' as math;

void main() {
  runApp(MaterialApp(
    home: const Scaffold(
        body: Center(
      child: CardDeck(),
    )),
    title: 'SwipingCardDeck',
    theme: ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(245, 230, 200, 1),
    ),
  ));
}

class CardDeck extends StatelessWidget {
  const CardDeck({super.key});

  @override
  Widget build(BuildContext context) {
    final SwipingCardDeck deck = SwipingCardDeck(
      cardDeck: getCardDeck(),
      onDeckEmpty: () => debugPrint("Card deck empty"),
      onLeftSwipe: (Card card) => debugPrint("Swiped left"),
      onRightSwipe: (Card card) => debugPrint("Swiped right"),
      cardWidth: 200,
      swipeThreshold: MediaQuery.of(context).size.width / 3,
      minimumVelocity: 1000,
      rotationFactor: 0.8 / 3.14,
      swipeAnimationDuration: const Duration(milliseconds: 500),
      disableDragging: false,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        deck,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.clear),
              iconSize: 30,
              color: Colors.red,
              onPressed: deck.animationActive ? null : () => deck.swipeLeft(),
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.check),
              iconSize: 30,
              color: Colors.green,
              onPressed: deck.animationActive ? null : () => deck.swipeRight(),
            ),
          ],
        ),
      ],
    );
  }

  // create a data structure to store a list of strings for cards
  List<Card> getCardDeck() {
    List<String> cardData = [
      "What experience in your life has had the most profound impact on shaping who you are today?",
      "If you could impart one piece of wisdom to the entire world, what would it be and why?",
      "How do you define spirituality, and how does it manifest in your daily life?",
      "What's a belief you held strongly in the past that you've since changed your mind about?",
      "In what ways do you think you're still growing as a person?",
      "What's the most beautiful thing you've ever witnessed, and how did it affect you?",
      "How do you find meaning in life during challenging times?",
      "What's a question you've been grappling with lately that you can't seem to answer?",
      "If you could have a conversation with your younger self, what would you say?",
      "How do you think your life experiences have shaped your perception of the world?",
      "What's a fear you've overcome, and how did you do it?",
      "In what ways do you think humanity is evolving, for better or worse?",
      "What's a personal truth you hold that others might find controversial?",
      "How do you define success, and has this definition changed over time?",
      "What role does forgiveness play in your life, both for yourself and others?",
      "If you could change one thing about the world, what would it be and why?",
      "What's a moment in your life where you felt truly connected to something greater than yourself?",
      "How do you navigate the balance between accepting things as they are and striving for change?",
      "What's a book, movie, or piece of art that has profoundly influenced your worldview?",
      "How do you cultivate inner peace in a world that often seems chaotic?",
      "What do you think happens after we die, and how does this belief impact how you live?",
      "In what ways do you think technology is affecting our spiritual or emotional well-being?",
      "What's a personal ritual or practice that helps you stay grounded?",
      "How do you define love, and how has your understanding of it evolved over time?",
      "What's the most valuable lesson you've learned from a difficult situation?",
      "How do you think your cultural background has influenced your spiritual or philosophical beliefs?",
      "What's a question you wish more people would ask themselves?",
      "How do you maintain authenticity in a world that often pressures us to conform?",
      "What role does nature play in your spiritual or emotional well-being?",
      "How do you think we can bridge the divides that seem to be growing in society?",
      "What's a personal contradiction you've noticed in yourself, and how do you reconcile it?",
      "How do you define consciousness, and do you think it extends beyond humans?",
      "What's a societal norm you question, and why?",
      "How do you think we can better balance individual needs with collective responsibility?",
      "What's a transformative moment of self-discovery you've experienced?",
      "How do you cultivate compassion for those who are different from you?",
      "What do you think is the biggest misconception people have about happiness?",
      "How do you think we can create more meaningful connections in an increasingly digital world?",
      "What's a personal value you hold that you're unwilling to compromise on, and why?",
      "How do you think we can better prepare future generations for the challenges they might face?",
      "What's a paradox in life that you find particularly intriguing?",
      "How do you navigate the tension between personal growth and accepting yourself as you are?",
      "What role does intuition play in your decision-making process?",
      "How do you think we can cultivate more empathy and understanding in society?",
      "What's a personal limitation you've had to accept, and how has this acceptance affected you?",
      "How do you think we can find common ground with those who hold fundamentally different beliefs?",
      "What's a life philosophy or mantra that you try to live by?",
      "How do you think we can maintain hope in the face of global challenges?",
      "What's a personal truth you've discovered that you wish you had known earlier in life?",
      "How do you think we can create a society that values both individual freedom and collective well-being?",
    ];

    List<Card> cardDeck = [];

    for (int i = 0; i < cardData.length; ++i) {
      cardDeck.add(
        Card(
          color: getRandomColor(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Text(
                cardData[i],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'sans-serif',
                ),
              ),
            ),
          ),
        ),
      );
    }
    return cardDeck;
  }
}

Color? _lastColor; // Store the last color used

Color getRandomColor() {
  List<Color> colors = [
    const Color.fromRGBO(228, 165, 74, 1.0),
    const Color.fromRGBO(189, 103, 79, 1.0),
    const Color.fromRGBO(55, 59, 77, 1.0),
    const Color.fromRGBO(92, 92, 92, 1.0),
    const Color.fromRGBO(81, 122, 161, 1.0)
  ];

  Color nextColor;
  do {
    nextColor = colors[math.Random().nextInt(colors.length)];
  } while (nextColor ==
      _lastColor); // Ensure the next color is different from the last color

  _lastColor = nextColor; // Update the last color
  return nextColor;
}
