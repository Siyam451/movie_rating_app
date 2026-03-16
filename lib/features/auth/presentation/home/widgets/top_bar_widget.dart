import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/main-navbar/screens/profile_screen.dart';

class HomeTopBar extends StatelessWidget {
  final VoidCallback onLogout;

  const HomeTopBar({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 22,
            backgroundImage:
            NetworkImage("https://i.pravatar.cc/150?img=3"),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search on KuKu",
                hintStyle: TextStyle(color: Colors.white60),
                prefixIcon:
                Icon(Icons.search, color: Colors.white60),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: onLogout,
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}