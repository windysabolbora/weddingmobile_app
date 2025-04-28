import 'package:flutter/material.dart';

class StoriesPage extends StatelessWidget {
  final String imagePath;

  const StoriesPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-screen image
          Positioned.fill(
            child: Image.asset(
              imagePath, // Display the exact image passed
              fit: BoxFit.cover,
            ),
          ),
          // Close button
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Reaction buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildReactionButton('assets/reactions/heart.png', "Heart"),
                _buildReactionButton('assets/reactions/laugh.png', "Laugh"),
                _buildReactionButton('assets/reactions/wow.png', "Wow"),
                _buildReactionButton('assets/reactions/sad.png', "Sad"),
                _buildReactionButton('assets/reactions/angry.png', "Angry"),
                _buildReactionButton('assets/reactions/like.png', "Like"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionButton(String imagePath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 30, // Set the size of the reaction image
          height: 30,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
