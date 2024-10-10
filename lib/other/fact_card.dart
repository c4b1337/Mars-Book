import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FactCard extends StatelessWidget {
  final String fact;
  final IconData icon;

  const FactCard({super.key, required this.fact, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.5),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.redAccent),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                fact,
                style: GoogleFonts.robotoSlab(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
