import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int _remainingTime = 59; // Default timer value in seconds
  final int _initialTime = 59;
  Timer? _timer;
  bool _isRunning = false;
  String formattedTime = '00:00';

  int get remainingTime => _remainingTime;
  int get initialTime => _initialTime; // Getter for _initialTime
  bool get isRunning => _isRunning;

  //formatted timer String
  void formattedTimer(int seconds) {
    int minutes = seconds ~/ 60;
    String mins = '0$minutes';
    // seconds = seconds - (60*minutes);
    String sec = (seconds % 60) < 10
        ? '0${(seconds % 60).toStringAsFixed(0)}'
        : (seconds % 60).toStringAsFixed(0);
    formattedTime = '$mins:$sec';
    notifyListeners();
  }

  // Starts the timer and updates the remaining time every second.
  void startTimer() {
    if (_timer != null || _remainingTime == 0) return;

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        formattedTimer(_remainingTime);
        _remainingTime--;
        // notifyListeners();
      } else {
        _timer?.cancel();
        _timer = null;
        formattedTime = '00:00';
        _remainingTime = _initialTime; // Reset to initial time when timer ends
        _isRunning = false;
        notifyListeners();
      }
    });
  }

  // Sets the timer to a specified number of seconds.
  // void setTime(int seconds) {
  //   _remainingTime = seconds;
  //   _initialTime = seconds;
  //   notifyListeners();
  // }
}
