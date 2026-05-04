import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final username = user?.displayName ?? "No Name";
    final email = user?.email ?? "No Email";

    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /* ===== User Info ===== */
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.deepPurple),
              title: Text(username),
              subtitle: Text(email),
            ),
          ),
          const SizedBox(height: 20),

          /* ===== Settings ===== */
          const Text("Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: false,
            onChanged: (v) {},
            secondary: const Icon(Icons.dark_mode),
          ),
          SwitchListTile(
            title: const Text("Notifications"),
            value: true,
            onChanged: (v) {},
            secondary: const Icon(Icons.notifications),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const SizedBox(height: 20),

          /* ===== Links ===== */
          const Text("Links",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Help / FAQ"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail_outlined),
            title: const Text("Contact Us"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text("Privacy Policy"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text("Terms & Conditions"),
            onTap: () {},
          ),
          const SizedBox(height: 20),

          /* ===== Logout ===== */
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "Log Out",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
