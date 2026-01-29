import 'package:flutter/material.dart';
import 'widgets/top_bar.dart';
import 'widgets/bottom_bar.dart';
import 'screens/home_screen.dart';
import 'screens/my_list_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MyListScreen(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        // AppBar
        appBar: const TopBar(title: 'Quickly'),
        // Body
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: BottomBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
