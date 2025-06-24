import 'package:flutter/material.dart';
import 'package:smart_meter/screens/dashboard.dart';
import 'widgets/floating_bottom_tab_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Meter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const DashboardScreen(),
      Center(child: Text('More', style: Theme.of(context).textTheme.headlineLarge)),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          pages[_tabIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingBottomTabBar(
              currentIndex: _tabIndex,
              onTap: (i) => setState(() => _tabIndex = i),
            ),
          ),
        ],
      ),
    );
  }
}