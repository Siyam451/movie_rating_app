import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool obscure = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    "Filmrate",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "REGISTER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3f6378),
                  ),
                ),

                const SizedBox(height: 10),

                const Text("JOIN US"),

                const SizedBox(height: 30),

                const Text("Username"),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                  ),
                ),

                const SizedBox(height: 20),

                const Text("Email"),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                  ),
                ),

                const SizedBox(height: 20),

                const Text("Password"),
                TextField(
                  obscureText: obscure,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text("Confirm password"),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3f6378),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> LoginScreen()));
                    },
                    child: const Text("REGISTER"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}