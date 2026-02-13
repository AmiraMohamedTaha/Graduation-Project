import 'package:flutter/material.dart';

/* ===================== TRAVELS PAGE ===================== */
class TravelsPage extends StatelessWidget {
  const TravelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travels"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Active Trip",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: ListTile(
              leading: const Icon(Icons.directions_bus,
                  color: Colors.deepPurple),
              title: const Text("Mone Maseer"),
              subtitle: const Text(
                "Next stop: Sporting\nETA: 10 mins",
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Trip History",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          _historyCard(
            bus: "Metro Maseer",
            route: "Sidi Gaber → Raml",
            date: "Yesterday",
          ),
          _historyCard(
            bus: "Mone Maseer",
            route: "Sporting → Alshatby",
            date: "2 days ago",
          ),
          _historyCard(
            bus: "Metro Maseer",
            route: "Stanley → Sidi Gaber",
            date: "Last week",
          ),
        ],
      ),
    );
  }

  static Widget _historyCard({
    required String bus,
    required String route,
    required String date,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: const Icon(Icons.history),
        title: Text(bus),
        subtitle: Text("$route\n$date"),
      ),
    );
  }
}
