import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  String? currentPlan;
  int remainingDays = 0;

  List<Map<String, String>> history = [];

  /// 🔹 Show payment methods first
  void subscribe(String plan, int days) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Choose Payment Method"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text("Credit Card"),
              onTap: () {
                Navigator.pop(context);
                completeSubscription(plan, days);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text("Wallet"),
              onTap: () {
                Navigator.pop(context);
                completeSubscription(plan, days);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Complete subscription after payment
  void completeSubscription(String plan, int days) {
    setState(() {
      currentPlan = plan;
      remainingDays = days;

      history.add({
        "plan": plan,
        "date": "Today",
        "price": _getPrice(plan),
      });
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Success"),
        content: Text("Subscribed to $plan successfully"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  /// 🔹 Prices
  String _getPrice(String plan) {
    if (plan == "Weekly Plan") return "50 EGP";
    if (plan == "Monthly Plan") return "150 EGP";
    return "400 EGP"; // 3 Months
  }

  /// 🔹 Plan Card
  Widget planCard({
    required String title,
    required String price,
    required String duration,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(duration),
          const SizedBox(height: 5),
          Text(price,
              style:
                  TextStyle(color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: currentPlan != null
                ? null
                : () {
                    if (title == "Weekly Plan") subscribe(title, 7);
                    if (title == "Monthly Plan") subscribe(title, 30);
                    if (title == "3 Months Plan") subscribe(title, 90);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Subscribe",
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  /// 🔹 History Card
  Widget historyCard(String plan, String date, String price) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: const Icon(Icons.history),
        title: Text(plan),
        subtitle: Text("$date\n$price"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscriptions"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// 🔹 Current Subscription
          const Text("Current Subscription",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: ListTile(
              leading: const Icon(Icons.subscriptions,
                  color: Colors.deepPurple),
              title: Text(currentPlan ?? "No active subscription"),
              subtitle: currentPlan != null
                  ? Text("Remaining: $remainingDays days")
                  : null,
            ),
          ),

          const SizedBox(height: 25),

          /// 🔹 Available Plans
          const Text("Available Plans",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          planCard(
            title: "Weekly Plan",
            duration: "Unlimited rides for 7 days",
            price: "50 EGP",
            color: Colors.blue,
          ),

          planCard(
            title: "Monthly Plan",
            duration: "Unlimited rides for 30 days",
            price: "150 EGP",
            color: Colors.green,
          ),

          planCard(
            title: "3 Months Plan",
            duration: "Unlimited rides for 90 days",
            price: "400 EGP",
            color: Colors.deepPurple,
          ),

          const SizedBox(height: 25),

          /// 🔹 History
          const Text("Subscription History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          ...history.map((e) =>
              historyCard(e["plan"]!, e["date"]!, e["price"]!)),
        ],
      ),
    );
  }
}