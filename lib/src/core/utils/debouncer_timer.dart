import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Debouncer({required this.delay});
  final Duration delay;

  Timer? timer;

  /// Runs the function [action]. If this method is called multiple times in less
  /// than [delay], only the last call will be executed.
  void run(VoidCallback action) {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    timer = Timer(delay, action);
  }

  void dispose() {
    timer?.cancel();
  }
}
