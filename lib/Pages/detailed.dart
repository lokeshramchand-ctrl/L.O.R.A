// ignore_for_file: library_private_types_in_public_api

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lora/Pages/database.dart';

class Category {
  final String name;
  final double amountSpent;

  Category({required this.name, required this.amountSpent});
}

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Category> categories = [];
  bool isMonthly = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() async {
    List<Map<String, dynamic>> expenseData = isMonthly
        ? await _databaseHelper.getMonthlyExpensesByCategory()
        : await _databaseHelper.getWeeklyExpensesByCategory();

    setState(() {
      categories = expenseData
          .map((data) => Category(
                name: data['category'] as String,
                amountSpent: (data['totalAmount'] ?? 0).toDouble(),
              ))
          .toList();
    });
  }

  void updateCategories(bool monthly) {
    setState(() {
      isMonthly = monthly;
      _loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0F0F), Color(0xFF1B1B1B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Detailed Analysis',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              // Toggle switch integration
              Center(
                child: Container(
                  width: 300,
                  height: 70,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xFFFCD956),
                      width: 1.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        alignment: isMonthly
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Container(
                          width: 140,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 254, 254),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFFCD956),
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            updateCategories(true); // Set to monthly
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Center(
                              child: Text(
                                'Monthly',
                                style: GoogleFonts.albertSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            updateCategories(false); // Set to weekly
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Center(
                              child: Text(
                                'Weekly',
                                style: GoogleFonts.albertSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: const FlTitlesData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: _generateSpots(categories),
                          isCurved: true,
                          color: Colors.pinkAccent,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.pinkAccent.withOpacity(0.3),
                          ),
                          barWidth: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.pinkAccent.withOpacity(0.8),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent.withOpacity(0.8),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.category,
                          color: Colors.white,
                        ),
                        title: Text(
                          categories[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        subtitle: Text(
                          '₹${categories[index].amountSpent.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        trailing: const Icon(
                          Icons.monetization_on,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<FlSpot> _generateSpots(List<Category> categories) {
    return List<FlSpot>.generate(
      categories.length,
      (index) => FlSpot(
        index.toDouble(),
        categories[index].amountSpent,
      ),
    );
  }
}
