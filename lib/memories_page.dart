import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'main.dart';

class MemoriesPage extends StatefulWidget {
  final File? imageFile; // Make imageFile nullable

  const MemoriesPage({Key? key, this.imageFile}) : super(key: key);

  @override
  _MemoriesPageState createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
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
      'assets/dinner4.jpg',
      'assets/dinner5.jpg',
      'assets/venue1.jpg',
      'assets/venue2.jpg',
      'assets/venue3.jpg',
    ],
    "Cocktail": [
      'assets/wedcouple5.jpg',
      'assets/wedcouple6.jpg',
    ],
    "Dinner": [
      'assets/dinner1.jpg',
      'assets/dinner2.jpg',
      'assets/dinner3.jpg',
      'assets/dinner4.jpg',
      'assets/dinner5.jpg',
      'assets/dinner6.jpg',
      'assets/dinner7.jpg',
    ],
    "Party": [
      'assets/party1.jpg',
      'assets/party2.jpg',
      'assets/party3.jpg',
      'assets/party4.jpg',
      'assets/party5.jpg',
    ],
    "Venue": [
      'assets/venue1.jpg',
      'assets/venue2.jpg',
      'assets/venue3.jpg',
      'assets/venue4.jpg',
      'assets/venue5.jpg',
      'assets/venue6.jpg',
      'assets/venue7.jpg',
    ],
    "Preparation": [
      'assets/prepare1.jpg',
      'assets/prepare2.jpg',
      'assets/prepare3.jpg',
      'assets/prepare4.jpg',
      'assets/prepare5.jpg',
    ],
  };

  String selectedAlbum = "All Memories";
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        albumImages[selectedAlbum]?.add(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAA1E36),
        title: const Text(
          'RSVP',
          style: TextStyle(
            fontFamily: 'Moldyen',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
                context); // This will navigate back to the previous screen
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
                SizedBox(
                  height: 40,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: albumImages[selectedAlbum]?.length ?? 0,
                itemBuilder: (context, index) {
                  String image = albumImages[selectedAlbum]![index];
                  return GestureDetector(
                    onTap: () {
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(context, Icons.upload_outlined, 'Upload', 1),
                _buildNavItem(
                    context, Icons.calendar_today_outlined, 'Planning', 2),
                _buildNavItem(context, Icons.people_outline, 'Us', 3),
              ],
            ),
          ),
          // Upload button for picking images
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo_camera),
              label: const Text('Add Photo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAA1E36),
                foregroundColor: Colors.white,
              ),
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
            style: const TextStyle(
              color: Color(0xFFAA1E36),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
