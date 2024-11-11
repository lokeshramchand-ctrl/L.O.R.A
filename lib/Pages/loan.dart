// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanApplicationView extends StatefulWidget {
  const LoanApplicationView({super.key});

  @override
  State<LoanApplicationView> createState() => _LoanApplicationViewState();
}

class _LoanApplicationViewState extends State<LoanApplicationView> {
  double _loanAmount = 0;
  String _selectedPeriod = '6 months';
  final List<String> _periods = [
    '6 months',
    '1 year',
    '2 years',
    '3 years',
    '4 years',
    '5 years'
  ];

  // To hold the uploaded file path

  Future<void> _uploadDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      File file = File(result.files.single.path!);
      if (await file.length() <= 5 * 1024 * 1024) {
        // Check file size (5MB)
        setState(() {});
        // Optionally, you can show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Document uploaded: ${result.files.single.name}')),
        );
      } else {
        // Handle the case where the file is too large
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File size exceeds 5MB limit')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Get Loan in Minutes',
                  style: GoogleFonts.urbanist(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent, // Neon pink color
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Loan Application',
                  style: GoogleFonts.urbanist(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Neon pink color
                  ),
                ),
                Text(
                  '₹${_loanAmount.toStringAsFixed(0)}',
                  style: GoogleFonts.urbanist(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent, // Neon pink color
                  ),
                ),
                Slider(
                  value: _loanAmount,
                  min: 0,
                  max: 100000,
                  divisions: 100,
                  activeColor: Colors.pinkAccent, // Neon pink color
                  inactiveColor: Colors.pinkAccent.withOpacity(0.4),
                  label: '₹${_loanAmount.toStringAsFixed(0)}',
                  onChanged: (double value) {
                    setState(() {
                      _loanAmount = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  'Period',
                  style: GoogleFonts.urbanist(
                    fontSize: 20,
                    color: Colors.white, // Neon pink color
                  ),
                ),
                DropdownButton<String>(
                  value: _selectedPeriod,
                  dropdownColor: const Color.fromARGB(255, 127, 42, 104),
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Colors.pinkAccent), // Neon pink color
                  isExpanded: true,
                  items: _periods.map((String period) {
                    return DropdownMenuItem<String>(
                      value: period,
                      child: Text(
                        period,
                        style: GoogleFonts.urbanist(
                            color: Colors.pinkAccent, fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPeriod = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _uploadDocument();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent, // Neon pink color
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Upload Document',
                        style: GoogleFonts.urbanist(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
