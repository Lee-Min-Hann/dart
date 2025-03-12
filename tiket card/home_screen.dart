import 'package:flutter/material.dart';
import 'package:tiket_wisata/pages/tiket_page.dart';
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

  // Daftar halaman yang tersedia
  final List<Widget> _pages = [
    OrderPage(), // Order Page
    Center(child: Text('🔍 Explore Page')),
    TiketPage(),
    Center(child: Text('👤 Profile Page')),
  ];

  // Daftar judul halaman
  final List<String> _pageTitles = [
    'Order',
    'Explore',
    'Tiket Saya',
    'Profile',
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
        title: Text(_pageTitles[_selectedIndex]), // Judul berubah sesuai halaman
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
              icon: Icons.card_travel,
              label: 'Tiket Saya',
              isSelected: _selectedIndex == 2,
              onTap: () => _onNavItemTapped(2),
            ),
            NavItem(
              icon: Icons.person,
              label: 'Profile',
              isSelected: _selectedIndex == 3,
              onTap: () => _onNavItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
