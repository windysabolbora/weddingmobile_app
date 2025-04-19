import 'package:flutter/material.dart';
import 'home_page.dart';
import 'memories_page.dart';
import 'upload_page.dart';
import 'planning_page.dart';
import 'us_page.dart';
import 'search_page.dart';
import 'menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding RSVP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFAA1E36),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFAA1E36),
          primary: const Color(0xFFAA1E36),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(initialIndex: 0),
        '/memories': (context) => MemoriesPage(),
        '/search': (context) => const SearchPage(),
        '/menu': (context) => const MenuPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: _selectedIndex == 0
          ? RsvpHomePage(onNavigate: _onItemTapped)
          : _getPage(_selectedIndex),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return RsvpHomePage(onNavigate: _onItemTapped);
      case 1:
        return const UploadPage();
      case 2:
        return const PlanningPage();
      case 3:
        return const UsPage();
      default:
        return RsvpHomePage(onNavigate: _onItemTapped);
    }
  }
}
