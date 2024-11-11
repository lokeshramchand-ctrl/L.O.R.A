// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lora/Authetication/login.dart';
import 'package:lora/Components/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
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
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent
                                .withOpacity(0.5), // Glow color
                            blurRadius: 30, // Glow blur radius
                            spreadRadius: 15, // Glow spread radius
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/14.png",
                        height: 100,
                        fit: BoxFit.contain,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(height: 150),
                    Text(
                      "L.O.R.A",
                      style: GoogleFonts.urbanist(
                        color: Colors.pinkAccent,
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 180),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(
                    context,
                    "assets/4.png",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
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
                    "assets/7.png",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
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
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(
            color: Colors.pinkAccent,
            width: 2,
          ),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            height: 24,
            color: Colors.pinkAccent,
          ),
        ),
      ),
    );
  }
}
