import 'package:flutter/material.dart';
import 'main.dart';

class MemoriesPage extends StatefulWidget {
  const MemoriesPage({Key? key}) : super(key: key);

  @override
  _MemoriesPageState createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
  // List of album titles and images for each album
  final List<String> albumTitles = [
    "All Memories",
    "Cocktail",
    "Dinner",
    "Party",
    "Venue",
    "Preparation"
  ];

  final Map<String, List<String>> albumImages = {
    "All Memories": [
      'assets/wedcouple5.jpg',
      'assets/wedcouple6.jpg',
      'assets/wedcouple5.jpg',
      'assets/wedcouple6.jpg',
    ],
    "Cocktail": [
      'assets/wedcouple5.jpg',
      'assets/wedcouple6.jpg',
    ],
    "Dinner": [
      'assets/wedcouple6.jpg',
      'assets/wedcouple5.jpg',
    ],
    "Party": [
      'assets/wedcouple5.jpg',
      'assets/wedcouple6.jpg',
      'assets/wedcouple5.jpg',
    ],
    "Venue": [
      'assets/wedcouple6.jpg',
    ],
    "Preparation": [
      'assets/wedcouple5.jpg',
      'assets/wedcouple6.jpg',
      'assets/wedcouple5.jpg',
    ],
  };

  String selectedAlbum = "All Memories"; // Default selected album

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
            Navigator.pop(context);
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
      body: Column(
        children: [
          // Title section with scrolling album titles
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                const Text(
                  'IVY & MATT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Select Album',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),

                // Horizontal scrolling for album titles
                SizedBox(
                  height: 40, // Limit height for title scrolling
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: albumTitles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAlbum = albumTitles[index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Chip(
                            label: Text(albumTitles[index]),
                            backgroundColor: selectedAlbum == albumTitles[index]
                                ? const Color(0xFFAA1E36)
                                : Colors.white,
                            labelStyle: TextStyle(
                              color: selectedAlbum == albumTitles[index]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Photo grid based on selected album
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: albumImages[selectedAlbum]!.length,
                itemBuilder: (context, index) {
                  String image = albumImages[selectedAlbum]![index];
                  return GestureDetector(
                    onTap: () {
                      // Show a dialog when a photo is tapped
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Bottom Navigation Bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(context, Icons.upload_outlined, 'Upload', 1),
                _buildNavItem(context, Icons.chat_bubble_outline, 'Chat', 2),
                _buildNavItem(
                    context, Icons.calendar_today_outlined, 'Planning', 3),
                _buildNavItem(context, Icons.people_outline, 'Us', 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(initialIndex: index),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFFAA1E36),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFFAA1E36),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
