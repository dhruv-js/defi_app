import 'package:defi_app/view/screen/login.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List _screens = [
    LoginScreen(),
    LoginScreen(),
    LoginScreen(),
    LoginScreen(),
    LoginScreen()
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          backgroundColor: const Color(0xff282A2F),
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Friends',
              icon: Icon(color: Colors.white, Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Groups',
              icon: Icon(color: Colors.white, Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Add Expense',
              icon: Icon(color: Colors.white, Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Activity',
              icon: Icon(color: Colors.white, Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(color: Colors.white, Icons.person),
            ),
          ]),
    );
  }
}
