import 'package:not_found_404/widgets/Contact.dart';
import 'package:not_found_404/widgets/Profile.dart';

import 'Keypad.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  void goToPage(index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  List _pages = [
    const PhoneKeypad(),
    Contact(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
      body: _pages[currentPageIndex],
      bottomNavigationBar: GNav(
        onTabChange: (index) => goToPage(index),
        tabs: [
          GButton(
            icon: Icons.keyboard_command_key_rounded,
            text: 'Keypad',
          ),
          GButton(
            icon: Icons.access_time,
            text: 'Recents',
          ),
          GButton(
            icon: Icons.person_outline_rounded,
            text: 'Profile',
          ),
        ],
      ),
      // NavigationBar(
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       currentPageIndex = index;
      //     });
      //   },
      //   // indicatorColor: Colors.amber,
      //   selectedIndex: currentPageIndex,
      //   destinations: const <Widget>[
      //     NavigationDestination(
      //         icon: Icon(Icons.access_time), label: 'Recents'),
      //     NavigationDestination(
      //       icon: Icon(Icons.keyboard_command_key_rounded),
      //       label: 'Keypad',
      //     ),
      //     NavigationDestination(
      //         icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
      //   ],
      // ),
    );
  }
}
