// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, deprecated_member_use

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seko_app/authh/addpro.dart';
import 'package:seko_app/authh/signuppage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();
  bool isLoading = false;

  Future<void> login() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.101:5000/api/auth/login"), // Backend URL
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await storage.write(key: "token", value: data["token"]);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AddProductPage()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Failed")));
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
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        body: Stack(
          children: [
            // Gradient Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFEC008C), Color(0xFFC33764)],
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
                            const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(emailController, "Email"),
                            const SizedBox(height: 15),
                            _buildTextField(
                              passwordController,
                              "Password",
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: login,
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
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 15),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Don't have an account? Sign Up",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'NotoSans',
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
        color: Colors.white.withOpacity(0.2),
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
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: 'Nunito',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
            fontFamily: 'Nunito',
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
