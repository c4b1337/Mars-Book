import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselSection extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': '/images/mars1.jpeg',
      'fact': 'example fact 1'
    },
    {
      'image': '/images/mars2.jpeg',
      'fact': 'example fact 2'
    },
    {
      'image': '/images/mars3.jpeg',
      'fact': 'example fact 3'
    },
    {
      'image': '/images/mars4.jpeg',
      'fact': 'example fact 4'
    },
    {
      'image': '/images/mars5.jpeg',
      'fact': 'example fact 5'
    },
  ];

  final Function(String) onImageTap;

  CarouselSection({super.key, required this.onImageTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onImageTap(items[index]['fact']!),
            child: Container(
              width: 200, 
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(items[index]['image']!, fit: BoxFit.cover),
                  ),
                  SizedBox(height: 12),
                  Text(
                    items[index]['fact']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoSlab(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
