// ignore_for_file: prefer_const_constructors
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mars_book_web/pages/welcome_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.protestStrikeTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: WelcomePage(),
        backgroundColor: Colors.black,
      ),
    );
  }
}
