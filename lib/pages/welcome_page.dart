// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              '/images/mars.png',
              fit: BoxFit.cover, 
            ),
          ),
          Center(
            child: Text(
              'Welcome to Mars',
              style: GoogleFonts.protestStrike(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
