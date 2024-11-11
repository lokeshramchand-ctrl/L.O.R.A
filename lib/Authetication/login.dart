// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lora/Authetication/auth_service.dart';
import 'package:lora/Authetication/signup.dart';
import 'package:lora/Pages/stats.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
/*
  void signUserIn(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
          _usernamecontroller.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black87,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Handle Login button press
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.pink,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                child: Text(
                                  'Signup',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.pink,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                              child: Opacity(
                                opacity: 0.9,
                                child: Container(
                                  width: 350,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.pinkAccent.withOpacity(0.4),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Colors.pinkAccent.withOpacity(0.6),
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                      ),
                                      BoxShadow(
                                        color:
                                            Colors.pinkAccent.withOpacity(0.4),
                                        blurRadius: 30,
                                        spreadRadius: 8,
                                      ),
                                      BoxShadow(
                                        color:
                                            Colors.pinkAccent.withOpacity(0.2),
                                        blurRadius: 60,
                                        spreadRadius: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.pinkAccent.withOpacity(0.5),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 30,
                                    spreadRadius: 8,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 60,
                                    spreadRadius: 16,
                                  ),
                                ],
                              ),
                              width: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Signup()),
                                          );
                                        },
                                        child: Text(
                                          'Login',
                                          style: GoogleFonts.urbanist(
                                            color: Colors.pink,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()),
                                          );
                                        },
                                        child: Text(
                                          'Signup',
                                          style: GoogleFonts.urbanist(
                                            color: Colors.grey[500],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  _buildTextField(
                                    hintText: 'Email',
                                    controller: _usernamecontroller,
                                  ),
                                  const SizedBox(height: 20),
                                  _buildTextField(
                                    hintText: 'Password',
                                    isObscure: true,
                                    controller: _passwordController,
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 70),
                        _buildButton(
                            text: "Next",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Stats()),
                              );
                            }),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required controller,
    bool isObscure = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      padding: const EdgeInsets.all(5),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        style:
            GoogleFonts.urbanist(color: const Color.fromARGB(255, 94, 94, 94)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.urbanist(
              color: const Color.fromARGB(255, 94, 94, 94)),
          filled: true,
          fillColor: const Color(0xFF333333).withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              color: Colors.pinkAccent,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 117, 116, 116),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              color: Colors.pinkAccent,
              width: 1,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  void signUserIn(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
        _usernamecontroller.text,
        _passwordController.text,
      );

      // Navigate to the home page after a successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Stats()),
      );
    } catch (e) {
      // Show an error dialog if login fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Login Failed"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}

Widget _buildButton({required String text, required VoidCallback onPressed}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.2),
      borderRadius: BorderRadius.circular(0),
      border: Border.all(
        color: Colors.pinkAccent.withOpacity(0.4),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.pinkAccent.withOpacity(0.6),
          blurRadius: 15,
          spreadRadius: 2,
        ),
        BoxShadow(
          color: Colors.pinkAccent.withOpacity(0.4),
          blurRadius: 30,
          spreadRadius: 8,
        ),
        BoxShadow(
          color: Colors.pinkAccent.withOpacity(0.2),
          blurRadius: 60,
          spreadRadius: 16,
        ),
      ],
    ),
    padding: const EdgeInsets.all(5),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF333333).withOpacity(0.5),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            width: 1,
          ),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.urbanist(
          color: Colors.pink,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}