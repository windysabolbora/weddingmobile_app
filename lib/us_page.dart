import 'package:flutter/material.dart';

class UsPage extends StatelessWidget {
  const UsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero image (without overlay text)
            Image.asset(
              'assets/wedcouple.jpg',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Couple info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Ivy & Matt',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFAA1E36),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'June 15, 2025',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'We met five years ago at a coffee shop in downtown Seattle. What started as a chance encounter turned into the love of our lives. After three years of dating, Matt proposed during our vacation in Italy, and now we\'re excited to celebrate our special day with all of you!',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Wedding Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildInfoCard(
                    icon: Icons.location_on,
                    title: 'Venue',
                    description:
                        'Sunset Gardens\n123 Wedding Lane\nSeattle, WA 98101',
                  ),
                  _buildInfoCard(
                    icon: Icons.hotel,
                    title: 'Accommodations',
                    description:
                        'Grand Hotel Seattle\nSpecial rates available for wedding guests',
                  ),
                  _buildInfoCard(
                    icon: Icons.card_giftcard,
                    title: 'Registry',
                    description:
                        'We\'ve registered at:\nCrate & Barrel\nWilliams-Sonoma\nAmazon',
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Contact Us'),
                            content: const Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('For any questions about our wedding:'),
                                SizedBox(height: 8),
                                Text('Email: ivy.matt@wedding.com'),
                                Text('Phone: (555) 123-4567'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA1E36),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(200, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text('Contact Us'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(0xFFAA1E36),
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
