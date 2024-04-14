import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/utils/game.dart';
import 'package:rock_paper_scissors_game/widgets/custom_button.dart';
import 'package:rock_paper_scissors_game/widgets/home_page.dart';
import 'package:rock_paper_scissors_game/widgets/rules_screen.dart';

class GameScreen extends StatefulWidget {
  final Choice gameChoice;

  const GameScreen(this.gameChoice, {super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    String? robotChoice = Game().randomChoice();
    String robotChoicePath = "";
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = 'assets/images/rock_btn.png';
        break;
      case "Paper":
        robotChoicePath = 'assets/images/paper_btn.png';
        break;
      case "Scissor":
        robotChoicePath = 'assets/images/scissor_btn.png';
        break;
      default:
    }
    String? playerChoice;
    switch (widget.gameChoice.type) {
      case "Rock":
        playerChoice = 'assets/images/rock_btn.png';
        break;
      case "Paper":
        playerChoice = 'assets/images/paper_btn.png';
        break;
      case "Scissor":
        playerChoice = 'assets/images/scissor_btn.png';
        break;
      default:
    }

    if (Choice.gameRule[widget.gameChoice.type]![robotChoice] == "You Win") {
      setState(() {
        Game.score++;
      });
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "${widget.gameChoice.type}",
                      child: gameButton(null, playerChoice!, btnWidth),
                    ),
                    const Text(
                      'VS',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                    gameButton(null, robotChoicePath, btnWidth)
                  ],
                ),
              ),
            ),
            Text(
              "${Choice.gameRule[widget.gameChoice.type]![robotChoice]}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                padding: const EdgeInsets.all(16),
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 5,
                  ),
                ),
                child: const Text(
                  'Play Again',
                  style: TextStyle(color: Colors.white, fontSize: 24),
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
                  ),
                ),
                child: Text(
                  'rules'.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
