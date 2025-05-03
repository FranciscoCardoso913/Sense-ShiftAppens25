import 'dart:async';
import 'package:flutter_compass/flutter_compass.dart';

class RotationTracker {
  StreamSubscription<CompassEvent>? _compassSubscription;
  double _angle = 0.0;
  bool _isInitialized = false;

  /// Start listening to compass changes
  void initialize() {
    if (_isInitialized) return;
    
    _compassSubscription = FlutterCompass.events?.listen((event) {
      if (event.heading != null) {
        _angle = event.heading!; // Already in degrees 0-360
      }
    }, onError: (error) {
      print("Compass error: $error");
    });
    
    _isInitialized = true;
  }

  /// Get the current rotation angle in degrees [0, 360)
  double get currentAngle => _angle;

  /// Get the current rotation angle (same as currentAngle)
  double getCurrentAngle() => _angle;

  /// Check if the tracker is active
  bool get isActive => _isInitialized && _compassSubscription != null;

  /// Stop listening to compass and clean up resources
  void dispose() {
    _compassSubscription?.cancel();
    _compassSubscription = null;
    _isInitialized = false;
  }
}