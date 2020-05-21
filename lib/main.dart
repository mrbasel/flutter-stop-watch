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
      home: DefaultTabController(
        length: 2,
        child: HomePage()
        ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title: Text('Clock'),
        backgroundColor: Colors.blue,
        bottom: TabBar(
          tabs: [
            Container(child: Icon(Icons.timer, size: 30,), margin: EdgeInsets.symmetric(vertical: 7),),
            Container(child: Icon(Icons.timelapse, size: 30,),),
          ] 
          ),
      ),
        body: TabBarView(
          children: [
            ClockTimer(),
            StopWatch()
          ]
           ),
    );
  }
}


class ClockTimer extends StatefulWidget {
  @override
  _ClockTimerState createState() => _ClockTimerState();
}

class _ClockTimerState extends State<ClockTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  String timerButtonText = 'Start Timer';
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
          margin: EdgeInsets.only(bottom:20),
          // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(
          child: MaterialButton(
            child: Text(timerButtonText, style: TextStyle(color: Colors.white),),
            color: Colors.blueAccent,
            onPressed: (){
              startTimer();
              }

          ),
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
        
        Container(
          child: MaterialButton(
            child: Text('Reset', style: TextStyle(color: Colors.white),),
            color: Colors.grey,
            onPressed: (){
              resetTimer();
              }

          ),
          // margin: EdgeInsets.symmetric(: 20),
        ),
          ],
        ),
        
      ],
  );
  }
}
