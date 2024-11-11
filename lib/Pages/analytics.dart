import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text(
          'Analytics',
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(color: Colors.pinkAccent),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Wrap the body with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Limit Section
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Limit',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            color: Colors.pinkAccent,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹10,000.00',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 28,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.pinkAccent,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // My Spending Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Spending',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            color: Colors.pinkAccent,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹7,221.18',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 28,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.pinkAccent,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 50,
                      child: BarChart(
                        BarChartData(
                          barGroups: [
                            for (int i = 0; i < 7; i++)
                              BarChartGroupData(
                                x: i,
                                barRods: [
                                  BarChartRodData(
                                    toY: (i % 2 == 0 ? 8 : 5).toDouble(),
                                    color: Colors.pinkAccent,
                                    width: 12,
                                  ),
                                ],
                              ),
                          ],
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const days = [
                                    'S',
                                    'M',
                                    'T',
                                    'W',
                                    'T',
                                    'F',
                                    'S'
                                  ];
                                  return Text(
                                    days[value.toInt() % days.length],
                                    style: GoogleFonts.urbanist(
                                        textStyle: const TextStyle(
                                            color: Colors.pinkAccent)),
                                  );
                                },
                              ),
                            ),
                          ),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Expense Section with Line Chart
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expense',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            color: Colors.pinkAccent,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '-₹2,082.12',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 28,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.pinkAccent,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 10,
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
                            spots: [
                              const FlSpot(0, 3),
                              const FlSpot(1, 2),
                              const FlSpot(2, 5),
                              const FlSpot(3, 3.1),
                              const FlSpot(4, 4),
                              const FlSpot(5, 3),
                              const FlSpot(6, 4),
                            ],
                            isCurved: true,
                            color: Colors.pinkAccent, // Set line color to pink
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.pinkAccent.withOpacity(
                                  0.3), // Set below area color to pink
                            ),
                            barWidth: 5,
                            shadow: const Shadow(
                              color: Colors
                                  .pinkAccent, // Pink shadow for glow effect
                              blurRadius: 15,
                            ),
                          ),
                          // Second line for electricity consumption type 2 with pink glow
                          LineChartBarData(
                            spots: [
                              const FlSpot(0, 2),
                              const FlSpot(1, 1.8),
                              const FlSpot(2, 3),
                              const FlSpot(3, 2.5),
                              const FlSpot(4, 2.8),
                              const FlSpot(5, 2.3),
                              const FlSpot(6, 3),
                            ],
                            isCurved: true,
                            color: Colors
                                .pink[300], // Set line color to a darker pink
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.pink.withOpacity(
                                  0.2), // Set below area color to pink
                            ),
                            barWidth: 6,
                            shadow: const Shadow(
                              color: Color.fromARGB(126, 41, 36,
                                  38), // Pink shadow for glow effect
                              blurRadius: 10,
                            ),
                          ),
                        ],
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
}
