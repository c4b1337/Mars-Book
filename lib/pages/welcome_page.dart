import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../other/carousel_section.dart';
import '../other/fact_card.dart';
import '../other/footer.dart';

class BackgroundImage extends StatelessWidget {
  final String imagePath;

  const BackgroundImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;

  const WelcomeText({
    super.key,
    required this.text,
    this.fontSize = 48,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      left: 20,
      right: 20,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.robotoSlab(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Color _backgroundColor = Colors.transparent;
  String _currentFact = '';
  late Timer _timer;
  int _currentFactIndex = 0;

  final List<String> _marsFacts = [
    'Mars is named after the Roman god of war.',
    'Mars is the fourth planet from the Sun.',
    'Mars has seasons just like Earth, but they last twice as long.',
    'The atmosphere on Mars is mostly carbon dioxide.',
    'Mars once had liquid water on its surface.',
  ];

  @override
  void initState() {
    super.initState();
    _startFactRotation();
  }

  void _startFactRotation() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentFactIndex =
            (_currentFactIndex + 1) % _marsFacts.length;
      });
    });
  }

  void _flipToFacts() {
    setState(() {
      _backgroundColor = Colors.black;
    });
  }

  void _showFact(String fact) {
    setState(() {
      _currentFact = fact;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: _backgroundColor,
            child: Stack(
              children: [
                BackgroundImage(imagePath: 'assets/images/background_image.png'),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height),
                      WelcomeText(text: 'Welcome to Mars'),
                      const SizedBox(height: 50),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: _flipToFacts,
                                    child: FactCard(
                                      fact:
                                          'Olympus Mons is the tallest volcano in the solar system, standing at 28 km.',
                                      icon: Icons.landscape,
                                    ),
                                  ),
                                  FactCard(
                                    fact:
                                        'Mars has two moons: Phobos and Deimos.',
                                    icon: Icons.circle,
                                  ),
                                  FactCard(
                                    fact:
                                        'A Martian year lasts 687 Earth days.',
                                    icon: Icons.timer,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                '/images/mars_image.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      CarouselSection(onImageTap: _showFact),
                      if (_currentFact.isNotEmpty)
                        Container(
                          color: Colors.black.withOpacity(0.7),
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            _currentFact,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoSlab(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      const SizedBox(height: 30),
                      Divider(color: Colors.grey),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          children: [
                            Text(
                              'Did You Know?',
                              style: GoogleFonts.robotoSlab(
                                fontSize: 24,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _marsFacts[_currentFactIndex],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoSlab(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      FooterSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


