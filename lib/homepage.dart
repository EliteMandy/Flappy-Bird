import 'dart:async';

import 'package:flappybird/barriers.dart';
import 'package:flappybird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdY = 0;
  double time = 0;
  double velocity = 2.8;
  double gravity = -4.9;
  double height = 0;
  double initialHeight = birdY;
  bool gameHasStarted = false;
  static double barrierX = 1;
  double barrierXtwo = barrierX + 1.5;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdY;
    });
  }


  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdY = 0;
      gameHasStarted = false;
      time = 0;
      initialHeight = birdY;
    });
  }



void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.brown,
              title: Center(
                child: Text(
                  'G A M E  O V E R',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              actions: [
                GestureDetector(
                    onTap: resetGame,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding: EdgeInsets.all(7),
                        color: Colors.white,
                        child: Text(
                          'P L A Y  A G A I N',
                          style: TextStyle(color: Colors.brown),
                        ),
                      ),
                    ))
              ]);
        });
  }




  void startGame() {
    gameHasStarted = true;
    // initialHeight = birdY;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      // barrierX += 0.1;
      // barrierXtwo += 0.1;
      time += 0.04;
      height = gravity * time * time + velocity * time;
      setState(() {
        birdY = initialHeight - height;
        // barrierX -= 0.05;
        // barrierXtwo -= 0.05;
      });

      setState(
        () {
          if (barrierX < -2) {
            barrierX += 3;
          } else {
            barrierX -= 0.05;
          }
        },
      );

      setState(
        () {
          if (barrierXtwo < -2) {
            barrierXtwo += 3.5;
          } else {
            barrierXtwo -= 0.05;
          }
        },
      );

      if (birdY > 1) {
        timer.cancel();
        gameHasStarted = false;
        _showDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                AnimatedContainer(
                  alignment: Alignment(0, birdY),
                  duration: Duration(milliseconds: 0),
                  color: Colors.blue,
                  child: MyBird(),
                ),
                Container(
                  alignment: Alignment(0, -0.5),
                  child: gameHasStarted
                      ? Text(" ")
                      : Text(
                          "T A P  T O  P L A Y",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierX, 1.3),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    size: 200.0,
                  ),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierX, -1.3),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    size: 150.0,
                  ),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXtwo, 1.3),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    size: 250.0,
                  ),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXtwo, -1.3),
                  duration: Duration(milliseconds: 0),
                  child: MyBarrier(
                    size: 100.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 15,
            color: Colors.green,
          ),
          Expanded(
            child: Container(
              color: Colors.brown,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SCORE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text("0",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BEST",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("97",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ],
                    )
                  ]),
            ),
          )
        ],
      )),
    );
  }
}




















































































































// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   static double birdY = 0;
//   double initialPosition = birdY;
//   double height = 0;
//   double time = 0;
//   double gravity = -4.9; // How strong the Gravity is
//   double velocity = 2.8; // How strong the jump is
//   double birdHeight = 0;
//   double birdWidth = 0;
//   double birdWeight = 0;

//   // Games Settings
//   bool gameHasStarted = false;

//   static List<double> barrierX = [2, 2 + 1.5];
//   static double barrierWidth = 0.5;
//   List<List<double>> barrierHeight = [
//     [0.6, 0.4],
//     [0.4, 0.6],
//   ];

// // ON CLICK THE BIRD WILL JUMP
//   void jump() {
//     setState() {
//       time = 0;
//       initialPosition = birdY;
//     }
//   }

//   // THIS WILL START THE GAME AS SOON AS YOU CLICK THE SCREEBN
//   void startGame() {
//     gameHasStarted = true;
//     Timer.periodic(const Duration(milliseconds: 500), (timer) {
//       time += 0.85;
//       height = gravity * time * time + velocity * time;
//       setState(() {
//         birdY = initialPosition - height;
//       });
//       // print(birdY);

      // if (birdY > 1) {
      //   timer.cancel();
      //   gameHasStarted = false;
      //   _showDialog();
      // }

//       time += 0.1;
//     });
//   }

// // RESET GAME FUNCTION
  // void resetGame() {
  //   Navigator.pop(context);
  //   setState(() {
  //     birdY = 0;
  //     gameHasStarted = false;
  //     time = 0;
  //     initialPosition = birdY;
  //   });
  // }

  // void _showDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //             backgroundColor: Colors.brown,
  //             title: Center(
  //               child: Text(
  //                 'G A M E  O V E R',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //             ),
  //             actions: [
  //               GestureDetector(
  //                   onTap: resetGame,
  //                   child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(5),
  //                     child: Container(
  //                       padding: EdgeInsets.all(7),
  //                       color: Colors.white,
  //                       child: Text(
  //                         'P L A Y  A G A I N',
  //                         style: TextStyle(color: Colors.brown),
  //                       ),
  //                     ),
  //                   ))
  //             ]);
  //       });
  // }

// // IT WILLL CHECK IF THE BIRD IS DEAD OR NOT
  // bool birdIsDead() {
  //   if (birdY < -1 || birdY > 1) {
  //     return true;
  //   }
  //   for (int i = 0; i < barrierX.length; i++) {
  //     if (barrierX[i] <= birdWidth &&
  //         barrierX[i] + barrierWidth >= -birdWidth &&
  //         (birdY <= -1 + barrierHeight[i][0] ||
  //             birdY + birdHeight >= 1 - barrierHeight[i][1])) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: gameHasStarted ? jump : startGame,
//       child: Scaffold(
//         body: Column(children: [
//           Expanded(
//               flex: 2,
//               child: Container(
//                 color: Colors.blue,
//                 child: Center(
//                     child: Stack(
//                   children: [
//                     MyBird(
//                       birdY: birdY,
//                       birdHeight: birdHeight,
//                       birdWidth: birdWidth,
//                       birdWeight: birdWeight,
//                     ),

//                     // TAP TO PLAY
//                     //MyCoverScreen(gameHasStarted: gameHasStarted),

//                     MyBarrier(
//                       barrierX: barrierX[0],
//                       barrierWidth: barrierWidth,
//                       barrierHeight: barrierHeight[0][0],
//                       isThisBottomBarrier: false,
//                     ),

//                     // BOTTOM OF THE BARRIER
//                     MyBarrier(
//                       barrierX: barrierX[0],
//                       barrierWidth: barrierWidth,
//                       barrierHeight: barrierHeight[0][1],
//                       isThisBottomBarrier: true,
//                     ),

//                     MyBarrier(
//                         barrierX: barrierX[1],
//                         barrierWidth: barrierWidth,
//                         barrierHeight: barrierHeight[1][0],
//                         isThisBottomBarrier: false),

//                     MyBarrier(
//                         barrierX: barrierX[1],
//                         barrierWidth: barrierWidth,
//                         barrierHeight: barrierHeight[1][1],
//                         isThisBottomBarrier: true),

//                     Container(
//                         alignment: Alignment(0, -0.5),
//                         child: Text(gameHasStarted ? ' ' : 'TAP  TO  PLAY',
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 20)))
//                   ],
//                 )),
//               )),
//           Expanded(child: Container(color: Colors.green))
//         ]),
//       ),
//     );
//   }
// }
