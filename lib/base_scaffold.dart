import 'package:flutter/material.dart';

// Import your screen files
import 'home_screen.dart';
import 'all_projects.dart';
import 'my_projects.dart';
import 'account.dart';
import 'single_project_screen.dart'; // Add this if not already imported

class BaseScaffold extends StatefulWidget {
  final Widget child; // The content/body of the specific screen
  final int initialIndex; // Parameter to set the initial selected index for the bottom nav

  const BaseScaffold({required this.child, this.initialIndex = 0});

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  bool _isMenuOpen = false;
  late int _selectedIndex; // Use late to initialize in initState

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Set initial index from the parameter
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the selected screen
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AllProjectsScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyProjectsScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AccountScreen()),
        );
        break;
    }
  }

  Widget _buildBottomNavItem(String title, IconData icon, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onBottomNavTap(index),
        child: Container(
          color: _selectedIndex == index ? Colors.green : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: _selectedIndex == index ? Colors.white : Colors.black,
                size: 24,
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(_isMenuOpen ? Icons.close : Icons.menu, color: Colors.black),
          onPressed: _toggleMenu,
        ),
      ),
      body: Stack(
        children: [
          widget.child, // The specific screen content
          // Sidebar Menu
          if (_isMenuOpen)
            GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 250,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('About Us'),
                          leading: Icon(Icons.info_outline),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Blog'),
                          leading: Icon(Icons.book),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('News'),
                          leading: Icon(Icons.article),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('FAQ'),
                          leading: Icon(Icons.help_outline),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          // Bottom Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem('Home', Icons.home, 0),
                  _buildBottomNavItem('All Projects', Icons.list, 1),
                  _buildBottomNavItem('My Projects', Icons.folder, 2),
                  _buildBottomNavItem('Account', Icons.person, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}