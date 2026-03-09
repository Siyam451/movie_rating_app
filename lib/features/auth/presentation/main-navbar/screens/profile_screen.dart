import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../common/widgets/buttom_navbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {

    final prefs = await SharedPreferences.getInstance();

    usernameController.text = prefs.getString("username") ?? "";
    emailController.text = prefs.getString("email") ?? "";
    phoneController.text = prefs.getString("phone") ?? "";
    passwordController.text = prefs.getString("password") ?? "";

    setState(() {});
  }

  void updateProfile() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("username", usernameController.text);
    await prefs.setString("email", emailController.text);
    await prefs.setString("phone", phoneController.text);
    await prefs.setString("password", passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Updated")),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// HEADER
            Container(
              height: 200,
              width: double.infinity,
              color:  Color(0xfff2846b),
              alignment: Alignment.center,
              child:  Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 50,
              backgroundImage:
              NetworkImage("https://i.pravatar.cc/150?img=3"),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [

                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: updateProfile,
                      child: const Text("Update"),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: const BottomNavbar(selectedIndex: 3),
    );
  }
}