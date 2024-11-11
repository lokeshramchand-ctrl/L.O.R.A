// ignore_for_file: library_private_types_in_public_api, unnecessary_brace_in_string_interps

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scratcher/scratcher.dart';

class ScratchCardScreen extends StatefulWidget {
  const ScratchCardScreen({super.key});

  @override
  _ScratchCardScreenState createState() => _ScratchCardScreenState();
}

class _ScratchCardScreenState extends State<ScratchCardScreen> {
  final double _scratchThreshold = 50;
  int _rewardAmount = 0;
  bool _isRevealed = false;
  final String _discountCoupon = '10% off on your next purchase!';
  final DateTime _expiryDate = DateTime.now().add(const Duration(days: 30));
  final int _totalPoints = 0;
  bool _isScratchingAllowed = true;
  int _dailyScratchCount = 0;
  final int _maxDailyScratches = 3;

  @override
  void initState() {
    super.initState();
    _generateReward();
  }

  void _generateReward() {
    setState(() {
      _rewardAmount =
          Random().nextInt(491) + 10; // Random reward between ₹10 to ₹500
      _isRevealed = false;
    });
  }

  void _onScratchComplete() {
    setState(() {
      _isRevealed = true;
      _isScratchingAllowed = false;
      _dailyScratchCount++;
      if (_dailyScratchCount >= _maxDailyScratches) {
        _isScratchingAllowed = false; // Disable scratching after limit
      }
      _showPopUp();
    });
  }

  void _showPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            '🎉 Congratulations!',
            style: GoogleFonts.urbanist(
              fontSize: 24,
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You\'ve won ₹$_rewardAmount Cashback!',
                style: GoogleFonts.urbanist(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                _discountCoupon,
                style: GoogleFonts.urbanist(
                    fontSize: 16, color: Colors.pinkAccent),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Expires on: ${DateFormat('MMM dd, yyyy').format(_expiryDate)}',
                style:
                    GoogleFonts.urbanist(fontSize: 12, color: Colors.white54),
              ),
              const SizedBox(height: 10),
              Text(
                'Daily Scratch Count: $_dailyScratchCount/${_maxDailyScratches}',
                style:
                    GoogleFonts.urbanist(fontSize: 12, color: Colors.white54),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _isScratchingAllowed = true);
                // Optionally, show feedback dialog here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Earn the Rewards",
              style: GoogleFonts.urbanist(fontSize: 64, color: Colors.pink),
            ),
            const SizedBox(height: 20),
            _buildScratchCard(),
            const SizedBox(height: 20),
            _buildCouponInfo(),
            const SizedBox(height: 20),
            _buildPointsBox(),
            
          ],
        ),
      ),
    );
  }

  Widget _buildPointsBox() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.pinkAccent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star, color: Colors.pinkAccent, size: 24),
          const SizedBox(width: 10),
          Text(
            'Total Points: $_totalPoints',
            style: GoogleFonts.urbanist(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScratchCard() {
    return Scratcher(
      brushSize: 30,
      threshold: _scratchThreshold,
      onThreshold: _isScratchingAllowed ? _onScratchComplete : null,
      color: Colors.pink.shade900,
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.pinkAccent, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: _isRevealed
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '₹$_rewardAmount',
                    style: GoogleFonts.urbanist(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _discountCoupon,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Expires: ${DateFormat('MMM dd, yyyy').format(_expiryDate)}',
                    style: GoogleFonts.urbanist(
                      fontSize: 12,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              )
            : Text(
                'Scratch here',
                style: GoogleFonts.urbanist(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildCouponInfo() {
    return _isRevealed
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Collected Coupons:',
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '- $_discountCoupon',
                style:
                    GoogleFonts.urbanist(fontSize: 18, color: Colors.white70),
              ),
            ],
          )
        : const SizedBox();
  }
}
