import 'package:defi_app/view/screen/friends.dart';
import 'package:defi_app/view/screen/groups.dart';
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
    const FriendsScreen(),
    const GroupsScreen(),
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
          backgroundColor: Colors.black,
          fixedColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Friends',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Groups',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Add Expense',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Activity',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
