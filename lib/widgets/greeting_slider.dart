import 'package:flutter/material.dart';
import 'dart:async';

class GreetingSlider extends StatefulWidget {
  final String username;
  const GreetingSlider({Key? key, required this.username}) : super(key: key);

  @override
  State<GreetingSlider> createState() => _GreetingSliderState();
}

class _GreetingSliderState extends State<GreetingSlider> {
  final List<String> messages = [
    "Let's keep your data in check!",
    "Don't forget to top up when low.",
    "Monitor your usage regularly."
  ];
  int _currentIndex = 0;
  Timer? _timer;

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Morning';
    if (hour < 17) return 'Afternoon';
    return 'Evening';
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % messages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi ${widget.username},",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Text(
              "Good ${getGreeting()}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.wb_sunny, color: Colors.white70, size: 18)
          ],
        ),
        const SizedBox(height: 8),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          child: Text(
            messages[_currentIndex],
            key: ValueKey(_currentIndex),
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}