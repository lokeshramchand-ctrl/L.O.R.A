import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lora/Authetication/login.dart';
import 'package:lora/Pages/personal.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
// Store the local image path
      });
    }
  }

  void _showProfileImageOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Profile Image Options", style: GoogleFonts.urbanist()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.image),
                  title: Text("Choose from Gallery",
                      style: GoogleFonts.urbanist()),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    _pickImage(); // Call the pick image function
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.cancel),
                  title: Text("Cancel", style: GoogleFonts.urbanist()),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.pinkAccent,
        title: Text(
          "Your Profile",
          style: GoogleFonts.urbanist(color: Colors.pinkAccent),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Profile Picture and Info
          Column(
            children: [
              GestureDetector(
                onTap: () => _showProfileImageOptions(context),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      Colors.pink.withOpacity(0.3), // Load from local file
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "John Doe",
                style: GoogleFonts.urbanist(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
              Text(
                "@john",
                style: GoogleFonts.urbanist(
                  color: Colors.pinkAccent,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Profile Options
          const Divider(color: Colors.white24),
          const SizedBox(height: 10),

          // List of settings options with pink outline
          _buildProfileOption(context, Icons.person_outline,
              "Personal Information", PersonalInformationPage()),
          _buildProfileOption(context, Icons.lock_outline, "Login and Security",
              null, "Login and Security selected"),
          _buildProfileOption(context, Icons.support_agent_outlined,
              "Customer Support", null, "Customer Support selected"),
          _buildProfileOption(
              context, Icons.share_outlined, "Share the App", null, null),
          _buildProfileOption(
              context, Icons.logout, "Log Out", null, "Logging out..."),

          const SizedBox(height: 30),

          // Member ID section
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Member ID",
              style: GoogleFonts.urbanist(color: Colors.white54, fontSize: 14),
            ),
          ),
          Row(
            children: [
              Text(
                "233232",
                style: GoogleFonts.urbanist(color: Colors.white),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copy to clipboard')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),
                child: const Text("Copy"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
      BuildContext context, IconData icon, String title, Widget? page,
      [String? snackbarMessage]) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.pinkAccent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Card(
        color: Colors.grey[900],
        elevation: 2,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.pinkAccent),
          title: Text(
            title,
            style: GoogleFonts.urbanist(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: Colors.white54,
          ),
          onTap: () {
            if (title == "Log Out") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logging out...")),
              );
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              });
            } else if (title == "Share the App") {
              _showShareOptions(context);
            } else if (page != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            } else if (snackbarMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(snackbarMessage)),
              );
            }
          },
        ),
      ),
    );
  }

  void _showShareOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Share the App", style: GoogleFonts.urbanist()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.share),
                  title:
                      Text("Share via Facebook", style: GoogleFonts.urbanist()),
                  onTap: () {
                    // Add sharing logic for Facebook here
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title:
                      Text("Share via Twitter", style: GoogleFonts.urbanist()),
                  onTap: () {
                    // Add sharing logic for Twitter here
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title:
                      Text("Share via WhatsApp", style: GoogleFonts.urbanist()),
                  onTap: () {
                    // Add sharing logic for WhatsApp here
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel", style: GoogleFonts.urbanist()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// Other classes remain unchanged
