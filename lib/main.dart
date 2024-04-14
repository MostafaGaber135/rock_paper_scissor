import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/widgets/home_page.dart';
import 'package:rock_paper_scissors_game/widgets/rules_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        RulesScreen.id: (context) => const RulesScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF124076),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
