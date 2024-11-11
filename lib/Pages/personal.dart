// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInformationPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController monthlyIncomeController = TextEditingController();

  PersonalInformationPage({super.key});

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    bool isObscure = false,
    bool isDateField = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(5),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        readOnly: isDateField, // Make the date field read-only
        style: GoogleFonts.urbanist(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.urbanist(color: Colors.white),
          filled: true,
          fillColor: const Color(0xFF333333).withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.pinkAccent,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 117, 116, 116),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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

  void _handleSubmit(BuildContext context) {
    if (nameController.text.isEmpty ||
        salaryController.text.isEmpty ||
        addressController.text.isEmpty ||
        dobController.text.isEmpty ||
        phoneController.text.isEmpty ||
        monthlyIncomeController.text.isEmpty) {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Handle form submission logic here
      print("Name: ${nameController.text}");
      print("Salary: ${salaryController.text}");
      print("Address: ${addressController.text}");
      print("Date of Birth: ${dobController.text}");
      print("Phone Number: ${phoneController.text}");
      print("Monthly Income: ${monthlyIncomeController.text}");

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Information saved successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      // Optionally clear the text fields
      nameController.clear();
      salaryController.clear();
      addressController.clear();
      dobController.clear();
      phoneController.clear();
      monthlyIncomeController.clear();
    }
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
          "Personal Information",
          style: GoogleFonts.urbanist(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildTextField(
              hintText: "Name",
              controller: nameController,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              hintText: "Salary",
              controller: salaryController,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              hintText: "Monthly Income",
              controller: monthlyIncomeController,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              hintText: "Address",
              controller: addressController,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              hintText: "Date of Birth",
              controller: dobController,
              isDateField: true, // Indicate this is a date field
            ),
            const SizedBox(height: 20),
            _buildTextField(
              hintText: "Phone Number",
              controller: phoneController,
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () => _handleSubmit(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),
                child: Text(
                  "Save",
                  style: GoogleFonts.urbanist(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
