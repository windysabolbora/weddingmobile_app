import 'package:flutter/material.dart';

// The RsvpHomePage StatefulWidget and its corresponding State class
class RsvpHomePage extends StatefulWidget {
  final Function(int) onNavigate; // Add a callback to handle navigation

  const RsvpHomePage({Key? key, required this.onNavigate}) : super(key: key);

  @override
  _RsvpHomePageState createState() => _RsvpHomePageState();
}

class _RsvpHomePageState extends State<RsvpHomePage> {
  final PageController _pageController = PageController(
      viewportFraction: 0.8); // Increased the fraction for a wider view

  final List<String> _carouselImages = [
    'assets/wedcouple2.jpg',
    'assets/wedcouple3.jpg',
    'assets/wedcouple4.jpg',
    'assets/wedcouple5.jpg',
    'assets/wedcouple6.jpg',
    'assets/wedcouple7.jpg',
    'assets/wedcouple8.jpg',
    'assets/wedcouple9.jpg',
    'assets/wedcouple10.jpg',
  ];

  int _currentIndex = 0; // Track the current image index

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double heroImageHeight = screenWidth * 0.3;
    double carouselSize = screenWidth * 0.55; // Adjusted size to be wider

    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero image
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/wedcouple.jpg',
                height: heroImageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                semanticLabel: 'Ivy and Matt wedding banner',
              ),
              Positioned(
                bottom: 15,
                child: Text(
                  'IVY & MATT',
                  style: TextStyle(
                    color: const Color(0xFFAA1E36),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // Navigation icons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.upload_outlined, 'Upload', 1),
                _buildNavItem(Icons.calendar_today_outlined, 'Planning', 2),
                _buildNavItem(Icons.people_outline, 'Us', 3),
              ],
            ),
          ),

          // Manual PageView Carousel with Cursor Dragging
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: carouselSize,
              width: carouselSize,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  if (details.primaryDelta! > 0) {
                    // Swipe right
                    if (_currentIndex > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                      );
                    }
                  } else if (details.primaryDelta! < 0) {
                    // Swipe left
                    if (_currentIndex < _carouselImages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                      );
                    }
                  }
                },
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _carouselImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index; // Update the current index
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildCarouselImage(
                        _carouselImages[index], carouselSize);
                  },
                ),
              ),
            ),
          ),

          // Dot Indicators
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_carouselImages.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: _currentIndex == index ? 12 : 8,
                  height: _currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? const Color(0xFFAA1E36)
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),

          // Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/memories');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAA1E36),
                foregroundColor: Colors.white,
                minimumSize: const Size(180, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'See all memories',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        widget.onNavigate?.call(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFAA1E36).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: const Color(0xFFAA1E36),
              size: 20,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselImage(String assetPath, double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: size,
          height: size,
          child: Image.asset(
            assetPath,
            fit: BoxFit.cover,
            semanticLabel: 'Wedding memory',
          ),
        ),
      ),
    );
  }
}
