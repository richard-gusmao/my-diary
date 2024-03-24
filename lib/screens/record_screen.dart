import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecoredScreen extends StatefulWidget {
  const RecoredScreen({super.key});

  @override
  State<RecoredScreen> createState() => _RecoredScreenState();
}

class _RecoredScreenState extends State<RecoredScreen> {
  bool isRecording = false;
  bool recorded = false;
  int minutes = 0;
  int seconds = 0;
  String label = "Record";
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (seconds != 60) {
        setState(() {
          seconds++;
        });
      } else {
        setState(() {
          minutes++;
          seconds = 0;
        });
      }
      if (seconds == 60 && minutes == 10) {
        stopTimer();
        return;
      }
    });
  }

  void stopTimer() {
    setState(() {
      isRecording = false;
      recorded = true;
    });
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          const Icon(
            Icons.mic,
            size: 100,
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          CupertinoButton(
            color: Colors.black,
            onPressed: () {
              if (isRecording) {
                setState(() {
                  label = "Record";
                });
                stopTimer();
              }
              if (!isRecording && recorded) {
                startTimer();
                setState(() {
                  label = "Recording";
                  isRecording = true;
                });
              }
            },
            child: isRecording
                ? const Text("Stop")
                : recorded
                    ? const Text("Save")
                    : const Text("Start"),
          ),
          const SizedBox(
            height: 30,
          ),
          (isRecording || recorded)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      minutes.toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      ":",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      seconds.toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 10,
                ),
        ],
      ),
    );
  }
}
