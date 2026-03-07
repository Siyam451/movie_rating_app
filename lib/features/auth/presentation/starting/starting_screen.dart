import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../register/register_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [

          /// Top movie grid
          Expanded(
            flex: 3,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
              ),
              itemCount: 60,
              itemBuilder: (context, index) {
                return Image.network(
                  "https://picsum.photos/200?random=$index",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          /// Bottom white container
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Filmrate",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "FOR MOVIE LOVERS, BY MOVIE LOVERS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3f6378),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "EXPLORE.\nCONNECT.\nDISCOVER",
                    style: TextStyle(
                      color: Color(0xff3f6378),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("LOGIN",style: TextStyle(color: Colors.white),),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "REGISTER",
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
          )
        ],
      ),
    );
  }
}