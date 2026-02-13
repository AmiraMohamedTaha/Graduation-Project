import 'package:flutter/material.dart';

/* ===================== BUS CARD ===================== */
class BusCard extends StatelessWidget {
  final Color color;
  final String name;
  final String time;
  final List<String> stops;

  const BusCard({
    super.key,
    required this.color,
    required this.name,
    required this.time,
    required this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.directions_bus, color: color),
              const SizedBox(width: 8),
              Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(time),
            ],
          ),
          const SizedBox(height: 10),
          const Text("Stops",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          ...stops.map(
            (s) => Row(
              children: [
                const Icon(Icons.circle, size: 6),
                const SizedBox(width: 6),
                Text(s),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
