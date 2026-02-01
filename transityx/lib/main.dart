import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* ===================== APP ROOT ===================== */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

/* ===================== LOGIN PAGE ===================== */

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordValid(String password) {
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasSpecialChar =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final hasMinLength = password.length >= 8;

    return hasUppercase && hasSpecialChar && hasMinLength;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  const Icon(
                    Icons.location_on,
                    size: 60,
                    color: Colors.deepPurple,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Welcome back\nto Maseer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /* ================= PHONE ================= */

                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone number",
                      prefixText: "+20 ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      }
                      if (value.length < 10) {
                        return "Phone number must be 10 digits";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  /* ================= PASSWORD ================= */

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (!isPasswordValid(value)) {
                        return "Password must be:\n• At least 8 characters\n• contain special letters\n• contain capital letters";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  /* ================= SIGN IN ================= */

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ===================== HOME PAGE (OLD CODE) ===================== */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Selected Tab: $selectedindex",
          style: const TextStyle(fontSize: 20),
        ),
      ),

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

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 40),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

