import 'package:flutter/material.dart';
import 'components/FlowerSection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sense/UI/modal.dart';
import 'package:tflite_audio/tflite_audio.dart';
import 'dart:async';
import 'dart:developer';

import 'package:sense/UI/HelpModal.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  Future<void> requestSensorsPermission() async {
    var status = await Permission.sensors.status;
    if (!status.isGranted) {
      await Permission.sensors.request();
    }
  }

  final isRecording = ValueNotifier<bool>(false);
  Stream<Map<dynamic, dynamic>>? result;

  ///Values for model config
  final String model = 'assets/models/sound_classifier.tflite';
  final String label = 'assets/models/labels.txt';
  final String inputType = 'rawAudio';
  final int sampleRate = 44100;
  final int bufferSize = 11016;

  ///Optional parameters to modify input and output
  final bool outputRawScores = false;
  final int numOfInferences = 10;
  final int numThreads = 1;
  final bool isAsset = true;

  ///Adjust the values below when tuning model detection.
  final double detectionThreshold = 0.3;
  final int averageWindowDuration = 1000;
  final int minimumTimeBetweenSamples = 30;
  final int suppressionTime = 1500;

  @override
  void initState() {
    super.initState();
    requestMicrophonePermission();
    requestSensorsPermission();

    TfliteAudio.loadModel(
      inputType: inputType,
      model: model,
      label: label,
    );

    // mfcc parameters
    TfliteAudio.setSpectrogramParameters(nMFCC: 40, hopLength: 16384);
  }

  Future<String> getResult() async {
    Completer<String> completer = Completer<String>();
    Map<String, int> resultCounts = {}; // To count occurrences of each result

    result = TfliteAudio.startAudioRecognition(
      sampleRate: sampleRate,
      bufferSize: bufferSize,
      numOfInferences: numOfInferences,
    );

    result?.listen(
      (event) {
        String detectedClass = event["recognitionResult"] ?? "Unknown";
        print("Recognition Result: $detectedClass");

        // Count occurrences of each result
        resultCounts[detectedClass] = (resultCounts[detectedClass] ?? 0) + 1;
      },
      onDone: () {
        print("Recognition stream completed.");
        isRecording.value = false;

        // Determine the most repeated result
        String mostRepeatedResult = resultCounts.entries
            .reduce((a, b) => a.value > b.value ? a : b)
            .key;

        // Complete the future with the most repeated result
        if (!completer.isCompleted) {
          completer.complete(mostRepeatedResult);
        }
      },
      onError: (error) {
        print("Error during recognition: $error");

        // Complete the future with an error message
        if (!completer.isCompleted) {
          completer.complete("Error: $error");
        }
      },
    );

    // Return the future that completes when the recognition finishes
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            FlowerSection(onGetResult: getResult,),
           
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomModal(),
                          );
                        },
                        icon: Icon(Icons.volunteer_activism_outlined),
                        iconSize: 30,
                      ),
                      SizedBox(width: 30), // Adds space between the buttons
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => HelpModal(),
                          );
                        },
                        icon: Icon(Icons.help_outline_rounded),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
