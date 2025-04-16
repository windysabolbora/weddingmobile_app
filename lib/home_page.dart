import 'dart:async';
import 'package:flutter/material.dart';

class RsvpHomePage extends StatefulWidget {
  final Function(int)? onNavigate;

  const RsvpHomePage({Key? key, this.onNavigate}) : super(key: key);

  @override
  _RsvpHomePageState createState() => _RsvpHomePageState();
}

class _RsvpHomePageState extends State<RsvpHomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero image with couple name overlay
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/wedcouple.jpg',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 30,
                child: Text(
                  'IVY & MATT',
                  style: TextStyle(
                    color: const Color(0xFFAA1E36),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // Navigation bar with circular backgrounds
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.upload_outlined, 'Upload', 1),
                _buildNavItem(Icons.chat_bubble_outline, 'Chat', 2),
                _buildNavItem(Icons.calendar_today_outlined, 'Planning', 3),
                _buildNavItem(Icons.people_outline, 'Us', 4),
              ],
            ),
          ),

          // Auto-moving carousel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 250,
              child: PageView(
                controller: _pageController,
                children: [
                  _buildCarouselImage('assets/wedcouple2.jpg'),
                  _buildCarouselImage('assets/wedcouple3.jpg'),
                  _buildCarouselImage('assets/wedcouple4.jpg'),
                ],
              ),
            ),
          ),

          // See all memories button
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/memories');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAA1E36),
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
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
        if (widget.onNavigate != null) {
          widget.onNavigate!(index);
        }
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
          const SizedBox(height: 4),
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

  Widget _buildCarouselImage(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
