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

double getResponsiveFontSize(BuildContext context, {required double fontSize}){
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context){
  double width = MediaQuery.sizeOf(context).width;
  if(width < 600){
    return  width / 400;
  } else if (width < 900){
    return width / 700;
  } else {
    return width / 1000;
  }
}