import 'package:flutter/material.dart';
import 'main.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAA1E36),
        title: const Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: ListView(
        children: [
          _buildMenuItem(
            context,
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.photo_library,
            title: 'All Photos',
            onTap: () {
              Navigator.pushNamed(context, '/memories');
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.upload,
            title: 'Upload Photos',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(initialIndex: 1),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.chat,
            title: 'Chat',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(initialIndex: 2),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.calendar_today,
            title: 'Wedding Schedule',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(initialIndex: 3),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.people,
            title: 'About Us',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(initialIndex: 4),
                ),
              );
            },
          ),
          const Divider(),
          _buildMenuItem(
            context,
            icon: Icons.card_giftcard,
            title: 'Registry',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Wedding Registry'),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('We\'ve registered at:'),
                        SizedBox(height: 8),
                        Text('• Crate & Barrel'),
                        Text('• Williams-Sonoma'),
                        Text('• Amazon'),
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
          ),
          _buildMenuItem(
            context,
            icon: Icons.mail,
            title: 'RSVP',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('RSVP Confirmation'),
                    content:
                        const Text('Are you attending Ivy & Matt\'s wedding?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('We\'re sorry you can\'t make it.'),
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
          ),
          _buildMenuItem(
            context,
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('App Settings'),
                    content: const Text(
                        'Settings functionality would be implemented here.'),
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
          ),
          _buildMenuItem(
            context,
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Help & Support'),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Need help with the app?'),
                        SizedBox(height: 8),
                        Text('Email: support@weddingapp.com'),
                        Text('Phone: (555) 987-6543'),
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
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFFAA1E36),
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}
