import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/widgets/home_page.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});
  static String id = 'Rules Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, HomePage.id);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        title: const Text(
          "Rules",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Image.asset('assets/images/rules.png'),
      ),
    );
  }
}
