import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer/timeContent.dart';

class TimerContainer extends StatefulWidget {
  @override
  _TimerContainerState createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  int _seconds = 0;

  bool _isActive = false;

  final oneSec = const Duration(seconds: 1);
  Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(oneSec, (timer) {
      handleTick();
    });
  }

  void handleTick() {
    if (_isActive) {
      setState(() {
        _seconds += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int second = _seconds % 60;
    int minutes = (_seconds / 60).toInt();
    int hours = (_seconds / (60 * 60)).toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeContent(time: '$hours'.padLeft(2, '0'), label: 'HRS'),
                TimeContent(time: '$minutes'.padLeft(2, '0'), label: 'MIN'),
                TimeContent(time: '$second'.padLeft(2, '0'), label: 'SEC'),
              ],
            ),
            SizedBox(height: 80),
            Container(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _isActive = !_isActive;
                  });
                },
                child: Text(_isActive ? 'STOP' : 'START'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
