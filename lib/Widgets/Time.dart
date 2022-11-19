import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reserva_cae/DatosQR.dart';

int secondsLeft = 30;

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({Key? key}) : super(key: key);
  
  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer countDown;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown = Timer.periodic(Duration(seconds: 1), (timer) {
      secondsLeft--;
      if (secondsLeft == 0) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Container getTimer() {
//   if (isTimerActive) {
//     return Container(
//         width: 60.0,
//         padding: EdgeInsets.only(top: 3.0, right: 4.0),
//         child: CountDownTimer());
//   } else {
//     return Container(
//       width: 5.0,
//     );
//   }
// }