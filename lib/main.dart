import 'dart:async';
import 'clock.dart';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title: Text('StopWatch',),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
        body: StopWatch()
    );
  }
}


class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  String timerButtonText = 'Start';
  bool timerIsrunning = false; 
  var stopWatch = clock.stopwatch();

  void startTimer(){
    // If user clicks start button and timer is already running, stop the timer
    if (timerIsrunning == true){
      stopWatch.stop();
      timerIsrunning = false;
      timerButtonText = 'Resume';   
    }
    else {
    stopWatch.start();
    timerIsrunning = true;
    timerButtonText = 'Pause';
    }

    Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {}
      );
    }
    );
  }

  void resetTimer(){
    setState(() {
      stopWatch.stop();
      timerIsrunning = false;
      timerButtonText = 'Start Timer';
      stopWatch.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(clockDuration(stopWatch.elapsed), style: TextStyle(fontSize: 60)),
          margin: EdgeInsets.only(bottom:30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
          child: MaterialButton(
            child: Text(timerButtonText, style: TextStyle(color: Colors.white),),
            color: Colors.blue[800],
            onPressed: (){
              startTimer();
              }

          ),
          margin: EdgeInsets.only(left: 40, top: 20),
          height: 50,
          width: 100,
        ),
        Container(
          child: MaterialButton(
            child: Text('Reset', style: TextStyle(color: Colors.white),),
            color: Colors.grey,
            onPressed: (){
              resetTimer();
              }

          ),
          margin: EdgeInsets.only(right: 40, top: 20),
          height: 50,
          width: 100,
        ),
          ],
        ),
        
      ],
  );
  }
}
