import 'package:flutter/material.dart';
import '../../features/auth/presentation/home/home_screen.dart';
import '../../features/auth/presentation/main-navbar/screens/favourite_screen.dart';
import '../../features/auth/presentation/main-navbar/screens/profile_screen.dart';
import '../../features/auth/presentation/main-navbar/screens/trending_screen.dart';


class BottomNavbar extends StatelessWidget {

  final int selectedIndex;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
  });

  void navigate(BuildContext context, int index) {

    Widget page;

    switch (index) {
      case 0:
        page = const HomeScreen();
        break;

      case 1:
        page = const TrendingScreen();
        break;

      case 2:
        page = const FavoriteScreen();
        break;

      default:
        page = const ProfileScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
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
              color: selectedIndex == 0 ? Colors.orange : Colors.white70,
            ),
            onPressed: () => navigate(context, 0),
          ),

          IconButton(
            icon: Icon(
              Icons.diamond_outlined,
              color: selectedIndex == 1 ? Colors.orange : Colors.white70,
            ),
            onPressed: () => navigate(context, 1),
          ),

          IconButton(
            icon: Icon(
              Icons.storefront_outlined,
              color: selectedIndex == 2 ? Colors.orange : Colors.white70,
            ),
            onPressed: () => navigate(context, 2),
          ),

          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: selectedIndex == 3 ? Colors.orange : Colors.white70,
            ),
            onPressed: () => navigate(context, 3),
          ),
        ],
      ),
    );
  }
}