import 'package:flutter/material.dart';
import '../../../../../common/widgets/buttom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0f1b2b),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            CircleAvatar(
              radius: 50,
              backgroundImage:
              NetworkImage("https://i.pravatar.cc/150?img=3"),
            ),

            SizedBox(height: 15),

            Text(
              "John Doe",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 5),

            Text(
              "moviefan@email.com",
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const BottomNavbar(selectedIndex: 3),
    );
  }
}