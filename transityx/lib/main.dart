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

                     // remove spaces just in case
                     value = value.trim();

                    // accepts 010xxxxxxxx or 10xxxxxxxx
                    if (!RegExp(r'^0?\d{10}$').hasMatch(value)) {
                        return "Invalid phone number";
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
                  const SizedBox(height: 20),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New user? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterPage()),
                        );
                      },
                      child: const Text(
                        "Create an account",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

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
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                const SizedBox(height: 30),
                const Text("Create Account",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

                const SizedBox(height: 30),

                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: "Username"),
                  validator: (v) =>
                      v!.isEmpty ? "Username required" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone",
                    prefixText: "+20 ",
                  ),
                  validator: (value) {
                    if (!RegExp(r'^0?\d{10}$').hasMatch(value!)) {
                      return "Invalid phone";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password required";
                      }

                      if (!isPasswordValid(value)) {
                        return "Password must be:\n• At least 8 characters\n• contain special letters\n• contain capital letters";
                      }

                      return null;
                    },

                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: const Text("Register"),
                ),
              ],
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
    // القوائم المختلفة لكل تاب
    final pages = [
      /* ========= الصفحة اللي فيها الخريطة و الاتوبيسات ========= */
      Stack(
        children: [
          /* ================= MAP FAKE UI مع صورة حقيقية ================= */
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
        top: 120,
        left: 550,
        child: Icon(Icons.directions_bus, color: Color.fromARGB(255, 6, 80, 141), size: 40),
      ),
      const Positioned(
        top: 70,
        right: 70,
        child: Icon(Icons.directions_bus, color: Color.fromARGB(255, 14, 84, 15), size: 40),
      ),
    ],
  ),
),



          /* ================= BUS LIST ================= */
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

      /* ========= صفحة Travels بسيطة ========= */
      const Center(child: Text("Travels Page")),

      /* ========= صفحة Subscriptions بسيطة ========= */
      const Center(child: Text("Subscriptions Page")),

      /* ========= صفحة More بسيطة ========= */
      const Center(child: Text("More Page")),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffE6E1FF),
      body: pages[selectedindex],

      /* ================= BOTTOM NAVIGATION BAR ================= */
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

      /* ================= FLOATING ACTION BUTTON ================= */
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
