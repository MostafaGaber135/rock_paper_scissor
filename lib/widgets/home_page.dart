import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/utils/game.dart';
import 'package:rock_paper_scissors_game/widgets/custom_button.dart';
import 'package:rock_paper_scissors_game/widgets/game_screen.dart';
import 'package:rock_paper_scissors_game/widgets/rules_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'Home Page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Score".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${Game.score}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 -
                          btnWidth / 2 -
                          20,
                      child: Hero(
                        tag: 'Rock',
                        child: gameButton(
                          () {
                            log('Tou choose Rock!');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(
                                  Choice("Rock"),
                                ),
                              ),
                            );
                          },
                          "assets/images/rock_btn.png",
                          btnWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left:
                          MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: 'Paper',
                        child: gameButton(
                          () {
                            log('Tou choose Paper!');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(
                                  Choice("Paper"),
                                ),
                              ),
                            );
                          },
                          "assets/images/paper_btn.png",
                          btnWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      right:
                          MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: 'Scissor',
                        child: gameButton(
                          () {
                            log('Tou choose Scissor!');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(
                                  Choice("Scissor"),
                                ),
                              ),
                            );
                          },
                          "assets/images/scissor_btn.png",
                          btnWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, RulesScreen.id);
                },
                padding: const EdgeInsets.all(16),
                shape: const StadiumBorder(
                    side: BorderSide(
                  color: Colors.white,
                  width: 5,
                )),
                child: Text(
                  'rules'.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
