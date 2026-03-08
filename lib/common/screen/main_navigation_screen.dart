import 'package:flutter/material.dart';

import '../../features/auth/presentation/home/home_screen.dart';
import '../../features/auth/presentation/main-navbar/screens/favourite_screen.dart';
import '../../features/auth/presentation/main-navbar/screens/profile_screen.dart';
import '../../features/auth/presentation/main-navbar/screens/trending_screen.dart';


class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {

  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    TrendingScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0f1b2b),

      body: pages[currentIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xff1f2c3c),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            IconButton(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Colors.orange : Colors.white70,
              ),
              onPressed: () {
                setState(() => currentIndex = 0);
              },
            ),

            IconButton(
              icon: Icon(
                Icons.diamond_outlined,
                color: currentIndex == 1 ? Colors.orange : Colors.white70,
              ),
              onPressed: () {
                setState(() => currentIndex = 1);
              },
            ),

            IconButton(
              icon: Icon(
                Icons.storefront_outlined,
                color: currentIndex == 2 ? Colors.orange : Colors.white70,
              ),
              onPressed: () {
                setState(() => currentIndex = 2);
              },
            ),

            IconButton(
              icon: Icon(
                Icons.person_outline,
                color: currentIndex == 3 ? Colors.orange : Colors.white70,
              ),
              onPressed: () {
                setState(() => currentIndex = 3);
              },
            ),

          ],
        ),
      ),
    );
  }
}