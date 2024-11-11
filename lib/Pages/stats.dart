// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lora/Pages/add_expense.dart';
import 'package:lora/Pages/loan.dart';
import 'package:lora/Pages/profile.dart';
import 'package:lora/Pages/rewards.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoanApplicationView()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ScratchCardScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RootApp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              // Hi text with glow effect
              Stack(
                children: [
                  Text(
                    'Hi,',
                    style: GoogleFonts.orbitron(
                      color: Colors.pink.withOpacity(0.5), // Glow effect color
                      fontSize: 64,
                    ),
                  ),
                  Text(
                    'Hi,',
                    style: GoogleFonts.orbitron(
                      color: Colors.pink,
                      fontSize: 64,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Your Financial Overview",
                style: GoogleFonts.urbanist(
                  color: Colors.pink,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),

              // Balance, Save, and Spent containers
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent
                          .withOpacity(0.6), // Glow effect color
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: GoogleFonts.urbanist(
                        color: Colors.pink,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹96,500.56',
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Spent',
                              style: GoogleFonts.urbanist(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '₹30,000.56',
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Save',
                              style: GoogleFonts.urbanist(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '₹1,234.56',
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Insights Section
              Row(
                children: [
                  _buildInsightContainer('Monthly Income', '₹1,10,000'),
                  const SizedBox(width: 10),
                  _buildInsightContainer('Savings', '₹3,10,000'),
                ],
              ),
              const SizedBox(height: 24),

              const SizedBox(height: 24),
              // Recent Transactions Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        'Recent Transactions',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 90),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddExpensePage()),
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.pink,
                          ))
                    ]),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart,
                          color: Colors.pinkAccent),
                      title: Text(
                        'Grocery Shopping',
                        style: GoogleFonts.urbanist(color: Colors.white),
                      ),
                      subtitle: Text(
                        '29 Oct, 2024',
                        style: GoogleFonts.urbanist(color: Colors.white70),
                      ),
                      trailing: Text(
                        '-₹1,200.00',
                        style: GoogleFonts.urbanist(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.fastfood, color: Colors.pinkAccent),
                      title: Text(
                        'Dinner at a Restaurant',
                        style: GoogleFonts.urbanist(color: Colors.white),
                      ),
                      subtitle: Text(
                        '27 Oct, 2024',
                        style: GoogleFonts.urbanist(color: Colors.white70),
                      ),
                      trailing: Text(
                        '-₹1,500.00',
                        style: GoogleFonts.urbanist(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.pinkAccent
              .withOpacity(0.3), // Light background for glow effect
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              Colors.black, // Base background color
              Colors.pinkAccent.withOpacity(0.8), // Blend with neon pink
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black, // Make the background transparent
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/12.png'),
                color: Colors.pinkAccent, // Neon pink color for icon
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/11.png'),
                color: Colors.pinkAccent, // Neon pink color for icon
              ),
              label: 'Loan',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/10.png'),
                color: Colors.pinkAccent, // Neon pink color for icon
              ),
              label: 'Rewards',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/13.png'),
                color: Colors.pinkAccent, // Neon pink color for icon
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.pink, // Color of the selected item
          unselectedItemColor: Colors.black38, // Unselected icon color
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

Widget _buildInsightContainer(String title, String amount) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.pinkAccent.withOpacity(0.5),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.pinkAccent.withOpacity(0.6), // Glow effect color
          blurRadius: 20,
          spreadRadius: 5,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.6),
          blurRadius: 15,
          spreadRadius: 2,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.urbanist(
            fontSize: 20,
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          amount,
          style: GoogleFonts.urbanist(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
