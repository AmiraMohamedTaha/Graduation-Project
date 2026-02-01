import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            setState(() {
              selectedindex = val;
            });
          },
          currentIndex: selectedindex,
          backgroundColor: Colors.white70,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(
            color: Colors.black,
            shadows: [Shadow(color: Colors.deepPurple)],
          ),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showUnselectedLabels: true,

          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: "Travels",
              icon: Icon(Icons.emoji_transportation),
            ),
            BottomNavigationBarItem(
              label: "Subscriptions",
              icon: Icon(Icons.sticky_note_2_outlined),
            ),
            BottomNavigationBarItem(
              label: "More",
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white, size: 40),
          onPressed: () {},
          backgroundColor: Colors.deepPurple,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}

//
// class HomePage extends StatefulWidget{
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return
//   }
// }
