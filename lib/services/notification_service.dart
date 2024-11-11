import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 200),
                    Image.asset(
                      "assets/8.png",
                      height: 100,
                      fit: BoxFit.contain,
                      color: Colors.pink,
                    ),
                    const SizedBox(height: 20), // Space between logo and text
                    const Text(
                      'L.O.R.A',
                      style: TextStyle(
                        color: Colors.pink, // Text color
                        fontSize: 24, // Font size for the abbreviation
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Adjust spacing above the slogan
            const Text(
              'Your Modern Personal Finance Partner',
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 16, // Font size
                fontWeight: FontWeight.bold, // Font weight
              ),
            ),
            const SizedBox(height: 20), // Spacing below the text
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(
                    context,
                    "assets/4.png",
                    () {},
                  ),
                  const SizedBox(width: 20),
                  _buildButton(
                    context,
                    "assets/5.png",
                    () {},
                  ),
                  const SizedBox(width: 20),
                  _buildButton(
                    context,
                    "assets/6.png",
                    () {},
                  ),
                  const SizedBox(width: 20),
                  _buildButton(
                    context,
                    "assets/7.png",
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget _buildButton(
      BuildContext context, String iconPath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed, // Handle the button press
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(2.0), // Padding for outer glow and border
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.3), // Reduced glow effect
              blurRadius: 8, // Reduced blur radius
              spreadRadius: 1, // Reduced spread radius
            ),
          ],
          border: Border.all(
            color: Colors.pinkAccent, // Border color to match aesthetic
            width: 2, // Thickness of the border
          ),
        ),
        child: Center(
          // Ensures the icon is centered
          child: Image.asset(
            iconPath,
            height: 24,
            color: Colors.pinkAccent, // Icon color
          ),
        ),
      ),
    );
  }
}

class LoginPage {
  const LoginPage();
}

class HomePage {
  const HomePage();
}
