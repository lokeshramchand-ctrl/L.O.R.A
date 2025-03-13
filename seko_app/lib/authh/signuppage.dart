// ignore_for_file: use_build_context_synchronously, deprecated_member_use, library_private_types_in_public_api

import 'dart:ui'; // Required for blur effect
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'loginpage.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

bool isLoading = false;

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // Helps in keyboard handling

  Future<void> signup() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.101:5000/api/auth/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "role": roleController.text,
        }),
      );

      if (response.statusCode == 201) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Signup Failed")));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Network error. Please try again later.")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _focusNode.unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        body: Stack(
          children: [
            // Gradient Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF953C6), Color(0xFFB91D73)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // Scrollable Content to Prevent Overflow
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.only(
                top: 100,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Signup",
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(nameController, "Name"),
                            const SizedBox(height: 15),
                            _buildTextField(emailController, "Email"),
                            const SizedBox(height: 15),
                            _buildTextField(
                              passwordController,
                              "Password",
                              obscureText: true,
                            ),
                            const SizedBox(height: 15),
                            _buildTextField(
                              roleController,
                              "Role (rider/driver)",
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: signup,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent.withOpacity(
                                  0.8,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Signup",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Already have an account? Login",
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText, {
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // Semi-transparent input box
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            blurRadius: 12,
            spreadRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        textAlign: TextAlign.left,
        style: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
