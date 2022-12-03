import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'explore_page.dart';
import 'settings.dart';
import 'welcome_page.dart';

class HomePage extends StatefulWidget {
  static String id = "Homepage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const SettingsPage(),
    const WelcomePage(),
    const ExplorePage(),
  ];

  int _selectedIndex = 1;

  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        children: [
          const SettingsPage(),
          const WelcomePage(),
          const ExplorePage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              controller.animateToPage(_selectedIndex,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 72, 69, 105),
          unselectedItemColor: Color(0xff6A64AF),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? Icons.settings : Iconsax.setting_2,
              ),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1 ? Iconsax.home5 : Iconsax.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? Iconsax.flash_circle5
                  : Iconsax.flash_circle),
              label: 'Explore',
            ),
          ],
        ),
      ),
    );
  }
}
