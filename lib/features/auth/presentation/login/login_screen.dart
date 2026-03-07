import 'package:flutter/material.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscure = true;

  String? emailValidator(String? value) {

    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    if (!value.contains("@")) {
      return "Email must contain @";
    }

    if (!value.contains(".")) {
      return "Email must contain .";
    }

    return null;
  }

  String? passwordValidator(String? value) {

    if (value == null || value.isEmpty) {
      return "Password required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: formKey,
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
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3f6378),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "WELCOME TO THE WORLD OF MOVIES",
                    style: TextStyle(fontSize: 12),
                  ),

                  const SizedBox(height: 30),

                  const Text("Email"),

                  TextFormField(
                    controller: emailController,
                    validator: emailValidator,
                    decoration: const InputDecoration(
                      hintText: "Enter your email",
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text("Password"),

                  TextFormField(
                    controller: passwordController,
                    validator: passwordValidator,
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

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
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
                        if (formKey.currentState!.validate()) {
                          print("Login success");
                        }
                      },
                      child: const Text("LOGIN"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Don't have an account? Register",
                        style: TextStyle(
                          color: Color(0xff3f6378),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}