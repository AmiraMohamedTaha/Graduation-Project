import 'package:flutter/material.dart';
import 'travels_page.dart';
import 'more_page.dart';
import 'bus_card.dart';

/* ===================== HOME PAGE ===================== */
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      /* ========= Home page: Map + Buses ========= */
      Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  "images/Map-of-Alexandria.jpeg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                const Positioned(
                  top: 50,
                  left: 600,
                  child: Icon(Icons.directions_bus,
                      color: Color.fromARGB(255, 6, 80, 141), size: 40),
                ),
                const Positioned(
                  top: 70,
                  right: 50,
                  child: Icon(Icons.directions_bus,
                      color: Color.fromARGB(255, 14, 84, 15), size: 40),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.8,
            builder: (context, controller) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView(
                  controller: controller,
                  children: const [
                    BusCard(
                      color: Colors.blue,
                      name: "Mone Maseer",
                      time: "10 mins",
                      stops: [
                        "Sidi Gaber",
                        "Sporting",
                        "Mahran",
                        "Camp Shezar",
                        "Alshatby"
                      ],
                    ),
                    SizedBox(height: 16),
                    BusCard(
                      color: Colors.green,
                      name: "Metro Maseer",
                      time: "10 mins",
                      stops: [
                        "Sidi Gaber",
                        "Raml",
                        "Stanley",
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      const TravelsPage(),
      const Center(child: Text("Subscriptions Page")),
      const MorePage(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffE6E1FF),
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (val) {
          setState(() {
            selectedindex = val;
          });
        },
        backgroundColor: Colors.white70,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          shadows: [Shadow(color: Colors.deepPurple)],
        ),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        showUnselectedLabels: true,
        items: const [
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
      floatingActionButton: selectedindex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white, size: 40),
            )
          : null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
