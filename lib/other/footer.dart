import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  // Method to launch the 3D Mars link
  void _launch3DMars() async {
    final Uri url = Uri.parse('https://solarsystem.nasa.gov/gltf_embed/2372/');

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        if (kDebugMode) {
          print('Could not launch $url');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred: $e');
      }
    }
  }

  // Method to launch the URL SpaseX link
  void _launchSpaceX() async {
    final Uri url = Uri.parse('https://www.spacex.com/');

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        if (kDebugMode) {
          print('Could not launch $url');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred: $e');
      }
    }
  }

  // Method to launch the Mars Trilogy link
  void _launchMarsTrilogy() async {
    final Uri url = Uri.parse('https://en.wikipedia.org/wiki/Mars_trilogy');

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        if (kDebugMode) {
          print('Could not launch $url');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.black.withOpacity(0.8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SpaceX button
              ElevatedButton(
                onPressed: () {
                  _launchSpaceX();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(1),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                ),
                child: const Text(
                  'SpaceX',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              // Book button linking to the Mars Trilogy page
              ElevatedButton(
                onPressed: _launchMarsTrilogy,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(1),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                ),
                child: const Text(
                  'Book',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              // 3D Mars button
              ElevatedButton(
                onPressed: _launch3DMars,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(1),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                ),
                child: const Text(
                  '3D Mars',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© 2024 Mars Exploration | All rights reserved.',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
