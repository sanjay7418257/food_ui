import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'homescreen.dart';
import 'startpage.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  var screen = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  int initialpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: initialpage,
          selectedItemColor: Colors.orange,
          selectedFontSize: 0,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            inherit: true,
          ),
          onTap: (index) {
            setState(() {
              initialpage = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: initialpage == 0
                  ? Text(
                      'Home',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            initialpage == 0 ? Colors.orange : Colors.grey[300],
                      ),
                    )
                  : Icon(
                      Icons.home,
                      color: Colors.grey[400],
                    ),
              label: '.',
            ),
            BottomNavigationBarItem(
              icon: initialpage == 1
                  ? Text(
                      'Favorite',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.grey[400],
                    ),
              label: '.',
            ),
            BottomNavigationBarItem(
              icon: initialpage == 2
                  ? Text(
                      'Cart',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Icon(
                      Icons.card_travel_outlined,
                      color: Colors.grey[400],
                    ),
              label: '.',
            ),
            BottomNavigationBarItem(
              icon: initialpage == 3
                  ? Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Icon(
                      Icons.perm_contact_calendar_outlined,
                      color: Colors.grey[400],
                    ),
              label: '.',
            ),
          ]),
      body: screen[initialpage],
    );
  }
}
