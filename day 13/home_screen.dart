import 'package:flutter/material.dart';
import '../utils/navigator_extensions.dart';
import '../widgets/nav_item.dart';
import '../pages/order_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
  OrderPage(), // Ganti Home Page dengan OrderPage
  Center(child: Text('🔍 Explore Page')),
  Center(child: Text('👤 Profile Page')),
];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            context.navigateToLogin();
          },
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavItem(
              icon: Icons.home,
              label: 'Home',
              isSelected: _selectedIndex == 0,
              onTap: () => _onNavItemTapped(0),
            ),
            NavItem(
              icon: Icons.explore,
              label: 'Explore',
              isSelected: _selectedIndex == 1,
              onTap: () => _onNavItemTapped(1),
            ),
            NavItem(
              icon: Icons.person,
              label: 'Profile',
              isSelected: _selectedIndex == 2,
              onTap: () => _onNavItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}
