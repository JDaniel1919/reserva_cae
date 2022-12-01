import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reserva_cae/DatosQR.dart';
import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  late Timer _timer;
  int _hour = 0;
  int _minute = 1;
  int _seconds = 25;
  bool _startEnable = true;
  bool _stopEnable = false;
  bool _continueEnable = false;

  int get hour => _hour;
  int get minute => _minute;
  int get seconds => _seconds;
  bool get startEnable => _startEnable;
  bool get stopEnable => _stopEnable;
  bool get continueEnable => _continueEnable;

  void InitVariables() {
    _minute = 1;
    _seconds = 25;
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;
  }

  void startTimer() {
    _minute = 1;
    _seconds = 25;
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if (_seconds < 59) {
      //   _seconds++;
      // } else if (_seconds == 59) {
      //   _seconds = 0;
      //   if (_minute == 59) {
      //     _hour++;
      //     _minute = 0;
      //   } else {
      //     _minute++;
      //   }
      // }
      
      if(_seconds == 0 && _minute == 0){
        _timer.cancel();
        Update_pc(num_srv, 0);
        _startEnable = true;
        _continueEnable = true;
        _stopEnable = false;
      }else if (_seconds > 0) {
        _seconds--;
      } else if (_seconds == 0) {
        _seconds = 59;
        _minute--;
      } 

      // if (_seconds == 0) {
      //   _timer.cancel();
      //   Update_pc(num_srv, 0);
      //   _startEnable = true;
      //   _continueEnable = true;
      //   _stopEnable = false;
      //   // _timer = new Timer.periodic(Duration(seconds: 1));
      // } else if (_seconds > 0) {
      //   _seconds--;
      // }

      notifyListeners();
    });
  }

  void stopTimer() {
    if (_startEnable == false) {
      _startEnable = true;
      _continueEnable = true;
      _stopEnable = false;
      _timer.cancel();
    }
    notifyListeners();
  }

  // void whenTimeExpires() {
  //     Update_pc(num_srv, 0);
  // }

  void continueTimer() {
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds < 59) {
        _seconds++;
      } else if (_seconds == 59) {
        _seconds = 0;
        if (_minute == 59) {
          _hour++;
          _minute = 0;
        } else {
          _minute++;
        }
      }

      notifyListeners();
    });
  }
}
