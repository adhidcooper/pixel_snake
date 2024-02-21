import 'dart:async';
import 'dart:math';

// import 'package:flame/text.dart';
import 'package:pixel_snake/blank_pixel.dart';
import 'package:pixel_snake/food_pixel.dart';
import 'package:pixel_snake/snake_pixel.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum snakeDirection { UP, DOWN, LEFT, RIGHT }

class _HomePageState extends State<HomePage> {
  // grid dimensions
  int rowSize = 10;
  int totalNumberOfSquares = 100;

  bool gameHasStarted = false;

  //Score
  int currentScore = 0;

  // snake position
  List<int> snakePos = [
    0,
    1,
    2,
  ];

  // Snake direction is initially to the right
  var currentDirection = snakeDirection.RIGHT;

  // Food position
  int foodPos = 55;

  // Start the Game
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        // Keep the snake moving!
        moveSnake();

        // check if the game is over
        if (gameOver()) {
          timer.cancel();
          // display a message to user
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Expanded(
                child: AlertDialog(
                  title: const Text('Game Over'),
                  content: Column(
                    children: [
                      Text('Your Score is: ${currentScore.toString()}'),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Enter Name'),
                      )
                    ],
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        submitScore();
                        Navigator.pop(context);
                        newGame();
                      },
                      child: const Text('Submit'),
                      color: Colors.pink,
                    )
                  ],
                ),
              );
            },
          );
        }
      });
    });
  }

  void submitScore() {
    //
  }

  void newGame() {
    setState(() {
      snakePos = [
        0,
        1,
        2,
      ];
      foodPos = 55;
      currentDirection = snakeDirection.RIGHT;
      gameHasStarted = false;
      currentScore = 0;
    });
  }

  void eatFood() {
    currentScore++;
    // making sure the new food is not where the snake is
    while (snakePos.contains(foodPos)) {
      foodPos = Random().nextInt(totalNumberOfSquares);
    }
  }

  void moveSnake() {
    switch (currentDirection) {
      case snakeDirection.RIGHT:
        {
          // Add a head
          // if snake is at the right wall, need to re-adjust
          if (snakePos.last % rowSize == 9) {
            snakePos.add(snakePos.last + 1 - rowSize);
          } else {
            snakePos.add(snakePos.last + 1);
          }
        }
        break;
      case snakeDirection.LEFT:
        {
          // Add a head
          if (snakePos.last % rowSize == 0) {
            snakePos.add(snakePos.last - 1 + rowSize);
          } else {
            snakePos.add(snakePos.last - 1);
          }
        }
        break;
      case snakeDirection.UP:
        {
          // Add a head
          if (snakePos.last < rowSize) {
            snakePos.add(snakePos.last - rowSize + totalNumberOfSquares);
          } else {
            snakePos.add(snakePos.last - rowSize);
          }
        }
        break;
      case snakeDirection.DOWN:
        {
          // Add a head
          if (snakePos.last + rowSize > totalNumberOfSquares) {
            snakePos.add(snakePos.last + rowSize - totalNumberOfSquares);
          } else {
            snakePos.add(snakePos.last + rowSize);
          }
        }
        break;
      default:
    }

    // snake is eating food
    if (snakePos.last == foodPos) {
      eatFood();
    } else {
      // remove tail
      snakePos.removeAt(0);
    }
  }

  // Game over
  bool gameOver() {
    // the game is over when the snake runs into itself
    List<int> bodySnake = snakePos.sublist(0, snakePos.length - 1);
    if (bodySnake.contains(snakePos.last)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // high scores
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // user Current score
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Current Score',
                    // style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    currentScore.toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                ],
              ),

              // highscores, top 5
              const Text('HighScores..'),
            ],
          )),
          // game grid
          Expanded(
            flex: 3,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0 &&
                    currentDirection != snakeDirection.UP) {
                  currentDirection = snakeDirection.DOWN;
                } else if (details.delta.dy < 0 &&
                    currentDirection != snakeDirection.DOWN) {
                  currentDirection = snakeDirection.UP;
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0 &&
                    currentDirection != snakeDirection.LEFT) {
                  currentDirection = snakeDirection.RIGHT;
                } else if (details.delta.dx < 0 &&
                    currentDirection != snakeDirection.RIGHT) {
                  currentDirection = snakeDirection.LEFT;
                }
              },
              child: GridView.builder(
                  itemCount: totalNumberOfSquares,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10),
                  itemBuilder: (context, index) {
                    if (snakePos.contains(index)) {
                      return const SnakePixel();
                    } else if (foodPos == index) {
                      return const FoodPixel();
                    } else {
                      return const BlankPixel();
                    }
                  }),
            ),
          ),

          // play button
          Expanded(
            child: Center(
              child: MaterialButton(
                color: gameHasStarted ? Colors.grey : Colors.pink,
                onPressed: gameHasStarted ? () {} : startGame,
                child: const Text('PLAY'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
