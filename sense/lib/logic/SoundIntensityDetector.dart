import 'dart:async';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundIntensityDetector {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  double _currentLevel = 0.0;
  bool _isRecording = false;
  String? _tempFilePath;
  StreamSubscription<RecordingDisposition>? _progressSubscription;

 Future<void> startMonitoring() async {
  if (_isRecording) return;
  
  print("Starting monitoring...");
  
  if (!await _requestPermission()) {
    throw Exception('Microphone permission not granted');
  }

  print("Permission granted");
  
  // Get temporary directory
  final tempDir = await getTemporaryDirectory();
  _tempFilePath = '${tempDir.path}/temp_recording.aac';
  print("Temp file path: $_tempFilePath");
  
  // Open recorder
  await _recorder.openRecorder();
  print("Recorder opened");
  
  // Set subscription duration for progress updates
  await _recorder.setSubscriptionDuration(const Duration(milliseconds: 100));
  
  try {
    // Try default codec first
    await _recorder.startRecorder(
      toFile: _tempFilePath,
      codec: Codec.pcm16, // PCM is more reliable for level monitoring
      sampleRate: 16000,
      numChannels: 1,
    );
    print("Started recording with PCM codec");
  } catch (e) {
    print("Failed to start with PCM, trying AAC: $e");
    // Fallback to AAC
    await _recorder.startRecorder(
      toFile: _tempFilePath,
      codec: Codec.aacADTS,
      sampleRate: 16000,
      numChannels: 1,
    );
    print("Started recording with AAC codec");
  }

  // Set up progress listener
  _progressSubscription = _recorder.onProgress?.listen(
    (RecordingDisposition disposition) {
      print("Progress update - Decibels: ${disposition.decibels}");
      _currentLevel = disposition.decibels ?? 0;
    },
    onError: (error) {
      print("Progress listener error: $error");
    },
  );

  _isRecording = true;
  print("Monitoring started successfully");
}
  double _normalizeLevel(double rawDb) {
    const minDb = -60.0; // Adjusted for better range
    const maxDb = -10.0;
    return ((rawDb - minDb) / (maxDb - minDb)).clamp(0.0, 1.0);
  }

  Future<bool> _requestPermission() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  double get currentLevel => _currentLevel;

  Future<void> stopMonitoring() async {
    if (!_isRecording) return;
    print("Stopping monitoring...");
    
    try {
      await _progressSubscription?.cancel();
      _progressSubscription = null;
      
      await _recorder.stopRecorder();
      print("Recorder stopped");
    } finally {
      await _recorder.closeRecorder();
      print("Recorder closed");
      _isRecording = false;
      
      // Clean up the temporary file
      if (_tempFilePath != null) {
        final file = File(_tempFilePath!);
        if (await file.exists()) {
          await file.delete();
          print("Temporary file deleted");
        }
        _tempFilePath = null;
      }
    }
  }

  void dispose() {
    stopMonitoring();
  }
}