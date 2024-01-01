import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset('lib/images/flappybird.png'));
  }
}


















// class MyBird extends StatelessWidget {
//   final birdY;
//   final double birdWidth;
//   final double birdHeight;
//   final double birdWeight;
//   MyBird(
//       {this.birdY,
//       required this.birdWidth,
//       required this.birdWeight,
//       required this.birdHeight});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         //alignment: Alignment(0, (2 * birdY + birdHeight) / 2 - birdHeight),
//         alignment: Alignment(0,0),
//         child: Image.asset('lib/images/flappybird.png',
//             width: MediaQuery.of(context).size.height * birdWidth / 2,
//             height: MediaQuery.of(context).size.height * 3 / 4 * birdWeight / 2,
//             fit: BoxFit.fill));
//   }
// }
