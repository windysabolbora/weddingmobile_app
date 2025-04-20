import 'package:flutter/material.dart';
import 'main.dart'; // Assuming this is where your MainScreen class is

class PlanningPage extends StatelessWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAA1E36),
        title: const Text(
          'RSVP',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const MainScreen(initialIndex: 0), // Navigate back to home
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _buildEventCard(
                time: '3:00 PM',
                title: 'Ceremony',
                location: 'Garden Pavilion',
                description:
                    'Join us as we exchange vows in the beautiful garden pavilion.',
              ),
              _buildEventCard(
                time: '4:30 PM',
                title: 'Cocktail Hour',
                location: 'Terrace',
                description:
                    'Enjoy drinks and hors d\'oeuvres while we take photos.',
              ),
              _buildEventCard(
                time: '6:00 PM',
                title: 'Reception',
                location: 'Grand Ballroom',
                description: 'Dinner, dancing, and celebration!',
              ),
              _buildEventCard(
                time: '10:00 PM',
                title: 'After Party',
                location: 'Lounge',
                description:
                    'Continue the celebration with late-night snacks and drinks.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String time,
    required String title,
    required String location,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFAA1E36).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFAA1E36),
                ),
              ),
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
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
