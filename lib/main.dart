import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // محاولة تهيئة Firebase، لو حصل خطأ يطبع بس وما يقفلش التطبيق
  try {
    await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: "AIzaSyAZulTq4PnAlFiSwMUAtaOq_L1kWNXZeSg",
    authDomain: "graduation-project-maseer.firebaseapp.com",
    projectId: "graduation-project-maseer", // هذا هو الـ ID الخاص بك
    storageBucket: "graduation-project-maseer.firebasestorage.app",
    messagingSenderId: "612878100202",
    appId: "1:612878100202:web:76fbda0bf56d51adea9993",
  ),
);
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }

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


