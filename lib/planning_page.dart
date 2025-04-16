import 'package:flutter/material.dart';

class PlanningPage extends StatelessWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Wedding Schedule',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFAA1E36),
                ),
              ),
            ),
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
                  'Continue the celebration with late night snacks and drinks.',
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Show RSVP confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('RSVP Confirmation'),
                        content: const Text(
                            'Are you attending Ivy & Matt\'s wedding?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('We\'re sorry you can\'t make it.'),
                                ),
                              );
                            },
                            child: const Text('Decline'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Thank you for your RSVP!'),
                                  backgroundColor: Color(0xFFAA1E36),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFAA1E36),
                            ),
                            child: const Text('Accept'),
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
                child: const Text('RSVP Now'),
              ),
            ),
          ],
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
