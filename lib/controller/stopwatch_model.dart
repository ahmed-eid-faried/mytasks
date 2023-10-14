import 'dart:async';
import 'package:flutter/foundation.dart';

class StopwatchModel extends ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();
  bool _isRunning = false;
  late StreamController<Duration> _elapsedTimeController;
  Stream<Duration> get elapsedTimeStream => _elapsedTimeController.stream;

  Duration get elapsedTime => _stopwatch.elapsed;
  bool get isRunning => _isRunning;

  final Duration updateInterval = const Duration(milliseconds: 100);
  Timer? _updateTimer;
  StopwatchModel() {
    _elapsedTimeController = StreamController<Duration>.broadcast();
    _startUpdateTimer();
  }

  void startStopwatch() {
    if (_isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    _isRunning = !_isRunning;
    notifyListeners();
  }

  void _stopUpdateTimer() {
    _updateTimer?.cancel();
    _updateTimer = null;
  }

  void resetStopwatch() {
    _stopwatch.reset();
    _isRunning = false;
    _stopUpdateTimer();
    _elapsedTimeController.add(const Duration(seconds: 0));
    notifyListeners();
  }

  void _startUpdateTimer() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_isRunning) {
        _elapsedTimeController.sink.add(_stopwatch.elapsed);
      }
    });
  }

  @override
  void dispose() {
    _elapsedTimeController.close();
    super.dispose();
  }
}
