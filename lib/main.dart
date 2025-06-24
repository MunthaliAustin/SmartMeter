import 'package:flutter/material.dart';
import 'package:smart_meter/screens/dashboard.dart';
import 'package:smart_meter/screens/more_settings.dart';
import 'widgets/floating_bottom_tab_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const DashboardScreen(),
      const MoreSettingsPage(),
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Meter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat',
      ),
      home: const MainScreen(),
    );
  }
}