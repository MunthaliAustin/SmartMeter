import 'package:flutter/material.dart';
import 'package:smart_meter/screens/dashboard.dart';
import 'package:smart_meter/screens/sign_in.dart';
import 'package:smart_meter/screens/more_settings.dart';
import 'widgets/floating_bottom_tab_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _darkMode = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Meter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF181C1B),
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat',
      ),
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      home: MainScreen(
        darkMode: _darkMode,
        onDarkModeChanged: _toggleDarkMode,
      ),
    );
  }
}

// Update MainScreen to accept darkMode and onDarkModeChanged
class MainScreen extends StatefulWidget {
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;

  const MainScreen({
    Key? key,
    required this.darkMode,
    required this.onDarkModeChanged,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const DashboardScreen(),
      // const SignInPage(),
      MoreSettingsPage(
        darkMode: widget.darkMode,
        onDarkModeChanged: widget.onDarkModeChanged,
      ),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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