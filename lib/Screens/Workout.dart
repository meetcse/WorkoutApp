import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
// import 'package:workoutapp/CountdownTimer.dart';
import 'package:workoutapp/ExerciseList.dart';
import 'package:workoutapp/TimingList.dart';
// import 'package:timer_count_down/timer_count_down.dart';

class Workout extends StatefulWidget {
  List<ExerciseList> _exerciseList = [];
  List<int> selectedExercise = [];
  int selectedNoOfSets;

  Workout(this._exerciseList, this.selectedExercise, this.selectedNoOfSets);

  @override
  _WorkoutState createState() =>
      _WorkoutState(_exerciseList, selectedExercise, selectedNoOfSets);
}

class _WorkoutState extends State<Workout> {
  List<ExerciseList> _exerciseList = [];
  List<int> selectedExercise = [];
  int selectedNoOfSets;

  bool _showTimer = true;
  int _seconds;
  int _mainSeconds = 10;

  _WorkoutState(
      this._exerciseList, this.selectedExercise, this.selectedNoOfSets);

  List<int> _timeDurations = [4 * 60, 5 * 60, 3 * 60, 2 * 60, 1 * 60];
  List<String> audioFiles = ["1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3"];

  int leftExercise;
  int startExercise = 0;
  bool isExerciseOver = false;
  bool isBreakTime = false;
  bool isRestartExercise = false;
  Timer _timer;
  bool isTimerStart = true;
  // int _currentSeconds;

  AudioCache audioPlayer = AudioCache();
  // AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer player;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leftExercise = _timeDurations.length - 1;
    _timeDurations.shuffle();
    audioFiles.shuffle();

    _seconds = _timeDurations[startExercise];
    Screen.keepOn(true);

    playAudio();
    countdownTimer(10);
    // print(leftExercise);
  }

  playAudio() async {
    // Random random = Random();
    // int rnd = random.nextInt(4);
    // print("Random Music" + rnd.toString());
    // player = await audioPlayer.play(audioFiles[rnd]);

    player = await audioPlayer.loop(audioFiles[startExercise]);
  }

  pauseAudio() async {
//  await   audioPlayer.pause();
    // await audioPlayer.pause();
    player.pause();
  }

  resumeAudio() async {
    player.resume();
  }

  bool testFlag = true;
  bool testFlagForBreak = true;

//updated ChangeValues()
  changeValues() {
    if (_seconds == 0 && !isExerciseOver && !isTimerStart) {
      // setState(() {
      _mainSeconds = 0;
      // });
      print("\nInside Timer, Main Seconds: " + _mainSeconds.toString());
      print(DateTime.now());
      print("");
      // return this.changeValues();
    }
    if (_mainSeconds == 0 && _seconds == 0 && !isTimerStart) {
      if (startExercise >= 4 && testFlag) {
        selectedNoOfSets = selectedNoOfSets - 1;

        print("No of Sets: " + selectedNoOfSets.toString());

        if (selectedNoOfSets > 0) {
          // startExercise = 0;
          // leftExercise = _timeDurations.length - 1;
          // _mainSeconds = 100;

          isRestartExercise = true;
          _mainSeconds = 0;
          testFlag = false;

          return this.stopTimer();
        } else {
          setState(() {
            isExerciseOver = true;
          });
          // setState(() {
          _mainSeconds = 100;
          // });
          pauseAudio();
        }
      } else if (!isBreakTime && testFlagForBreak) {
        _mainSeconds = 100;
        if (!testFlag) {
          testFlagForBreak = false;
          print("Inside Test Flag For Break");
        }

        isBreakTime = true;
        setState(() {
          //TODO: Change to 40 seconds
          _seconds = 40;
          _mainSeconds = 100;
        });

        print("Inside Break Time: " + isBreakTime.toString());
        print("Inside Break Time, Seconds: " + _seconds.toString());
        print("Inside Break Time,Main Seconds: " + _mainSeconds.toString());

        pauseAudio();
        isTimerStart = true;
        return this.countdownTimer(_seconds);
      } else if (isBreakTime || (isRestartExercise)) {
        _mainSeconds = 100;

        if (isRestartExercise) {
          print("ENTERED HERE........");
          testFlag = true;
          testFlagForBreak = true;
          setState(() {
            startExercise = 0;
          });
          startExercise = 0;
          leftExercise = _timeDurations.length - 1;
          isBreakTime = false;
        } else {
          isBreakTime = false;
          startExercise = startExercise + 1;
          leftExercise = leftExercise - 1;
        }

        setState(() {
          _mainSeconds = 100;

          _seconds = _timeDurations[startExercise];
          isRestartExercise = false;
        });
        // playAudio();
        print("Start Exercise: " + startExercise.toString());
        print("Seconds : " + _seconds.toString());
        print("Main Seconds : " + _mainSeconds.toString());
        print("isBreak Time : " + isBreakTime.toString());
        // resumeAudio();
        playAudio();
        isTimerStart = true;
        return this.countdownTimer(_seconds);
      }
    }
  }

//original chanheValues()
  // changeValues() {
  //   if (_seconds == 0) {
  //     if ((isBreakTime && startExercise != 5 && leftExercise != 0) ||
  //         (restartExerciseFlag())) {
  //       print("Seconds in removing Break: " + _seconds.toString());

  //       if (restartExerciseFlag()) {
  //         // if (!mounted) return;

  //         // setState(() {
  //         startExercise = 0;
  //         leftExercise = _timeDurations.length - 1;
  //         isRestartExercise = false;
  //         // });
  //       } else {
  //         // if (!mounted) return;

  //         // setState(() {
  //         startExercise = startExercise + 1;
  //         print("Start Exercise:" + startExercise.toString());
  //         leftExercise = leftExercise - 1;
  //         print("Left Exercise:" + leftExercise.toString());
  //         // });
  //       }
  //       isBreakTime = false;

  //       if (!mounted) return;

  //       setState(() {
  //         print("Break Time:" + isBreakTime.toString());
  //         _seconds = _timeDurations[startExercise];
  //         // playAudio();
  //       });

  //       resumeAudio();
  //       // if()
  //       return _buildCountDown(context);
  //     } else if ((startExercise < 5 && leftExercise > 0) || (checkNoOfSets())) {
  //       if (!mounted) return;
  //       setState(() {
  //         _seconds = 40;
  //         // previousSeconds = 40;
  //       });
  //       pauseAudio();
  //       isBreakTime = true;

  //       print("Seconds in Break True: " + _seconds.toString());
  //       // if (restartExerciseFlag()) {
  //       //   isRestartExercise = false;
  //       //   startExercise = 0;
  //       //   leftExercise = _timeDurations.length - 1;
  //       // }
  //       print("Break Time:" + isBreakTime.toString());
  //       return _buildCountDown(context);
  //     } else if (startExercise >= 4) {
  //       // if (!mounted) return;

  //       pauseAudio();
  //       // isExerciseOver = true;
  //       if (!checkNoOfSets()) {
  //         setState(() {
  //           isExerciseOver = true;
  //         });
  //       }
  //     }
  //   } else {
  //     return;
  //   }
  //   // return true;
  // }

  restartExerciseFlag() {
    if (isRestartExercise) {
      return true;
    } else {
      return false;
    }
  }

  checkNoOfSets() {
    selectedNoOfSets = selectedNoOfSets - 1;
    if (selectedNoOfSets > 0) {
      if (!mounted) return;

      setState(() {
        isRestartExercise = true;
      });
      return true;

      // if (!mounted) return;
      // setState(() {
      //   leftExercise = _timeDurations.length - 1;
      //   startExercise = 0;
      // });
      // isBreakTime = true;
      // changeValues();
    } else {
      // return false;
      if (!mounted) return;

      setState(() {
        isRestartExercise = false;
      });
      return false;
    }
  }

  Container _buildCountDown(BuildContext context) {
    // _seconds = sec;
    // if (_seconds != 0) {
    // int _currentSeconds;
    // setState(() {
    int _currentSeconds = _seconds;
    // });
    // print("Inside Build Count Down at seconds: " + _seconds.toString());
    // print(_currentSeconds);
    int minutes = (_currentSeconds / 60).floor();
    String minutesString;
    setState(() {
      minutesString = minutes.toString().padLeft(2, '0');
    });
    // String minutesString = minutes.toString().padLeft(2, '0');

    int tempSeconds = (_currentSeconds - (minutes * 60));
    int seconds = tempSeconds > 60 ? (tempSeconds / 60).floor() : tempSeconds;
    String secondsString;
    setState(() {
      secondsString = seconds.toString().padLeft(2, '0');
    });
    // String secondsString = seconds.toString().padLeft(2, '0');
    // print(secondsString);
    // print(seconds);
    // this.countdownTimer(_seconds);
    // if (this._seconds == 0) {
    //   this.changeValues();
    // }

    // Future.delayed(Duration(seconds: 7), () {
    //   // _seconds = 8;
    //   print(_seconds);
    //   countdownTimer(8);
    // });
    // if (_seconds == 0) {

    // }

    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            // height: 100,
            // width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Text(
              '$minutesString',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 80.0,
                // fontWeight: FontWeight.bold,
              ),
              // style: widget.style,
            ),
          ),
          // Padding(padding: EdgeInsets.all(0.3)),
          Container(
            padding: EdgeInsets.all(8),
            // height: 100,
            // width: 150,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2),
                top: BorderSide(color: Colors.black, width: 2),
                right: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: Text(
              '$secondsString',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 80.0,
                // fontWeight: FontWeight.bold,
              ),
              // style: widget.style,
            ),
          ),
        ],
      ),
    );
  }

  stopTimer() {
    _timer.cancel();
    isTimerStart = false;
    changeValues();
  }

//update Countdown Timer
  countdownTimer(int sec) async {
    int duration = 1;

    int _currentSeconds = _seconds;

    if (isTimerStart) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        // Run callback with custom [duration]
        (Timer timer) {
          // int _currentSeconds = _seconds;
          // print("Inside CountDOwn TImer, Seconds :- " + _seconds.toString());

          if (_currentSeconds >= 1) {
            // _currentSeconds = _currentSeconds - 1;
            // if(_currentSeconds == 0 && _seconds !=0) {
            //   setState(() {
            //     _seconds = 0;
            //   });
            // }
            // else if(_currentSeconds)
            setState(() {
              _currentSeconds = _currentSeconds - 1;

              this._seconds = _currentSeconds;
            });

            // print("Inside CountDown Timer,inside condition, Current Seconds :- " +
            //     _currentSeconds.toString());
            // print("Inside CountDOwn TImer,inside condition, Seconds :- " +
            //     _seconds.toString());
          } else {
            timer.cancel();
            return stopTimer();
            // this.changeValues();
            // this._timer.cancel();
            // if (_seconds == 0) {
            //   // setState(() {
            //   _mainSeconds = 0;
            //   // });
            //   print("\nInside Timer, Main Seconds: " + _mainSeconds.toString());
            //   print(DateTime.now());
            //   print("");
            //   return changeValues();
            // }
          }
        },
      );
    }

    //Original CountDown countDown;

    // countdownTimer(int sec) async {
    //   int duration = 1;

    //   int _currentSeconds = _seconds;

    //   _timer = Timer.periodic(
    //     Duration(seconds: 1),
    //     // Run callback with custom [duration]
    //     (Timer timer) {
    //       if (_currentSeconds == 0) {

    //         timer.cancel();

    //         changeValues();

    //       } else {
    //         if (!mounted) return;
    //         setState(() {
    //           // TIP: _currentSeconds -= 1 make insane!
    //           _currentSeconds = _currentSeconds - 1;

    //           // }
    //           _seconds = _currentSeconds;

    //         });
    //       }

    //     },
    //   );

    // int minutes = (_currentSeconds / 60).floor();
    // String minutesString = minutes.toString().padLeft(2, '0');

    // int tempSeconds = (_currentSeconds - (minutes * 60));
    // int seconds = tempSeconds > 60 ? (tempSeconds / 60).floor() : tempSeconds;
    // String secondsString = seconds.toString().padLeft(2, '0');

    // return Text(
    //   '$minutesString:$secondsString',
    // );
  }

  @override
  void dispose() {
    super.dispose();
    // _timer.
    _timer.cancel();
    // pauseAudio();
    player.stop();
  }

  // breakTime() {
  //   setState(() {
  //     _seconds = 20;
  //   });
  //   // showTimer();
  //   print(_seconds);
  // }

  // int breakTimeText = 5;
  // int actualTime = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Start Workout"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: (isExerciseOver)
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "Successfully Completed",
                        style: TextStyle(fontSize: 30),
                      ),
                    ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image(
                          height: 400,
                          width: 300,
                          image: AssetImage(
                              "${_exerciseList[selectedExercise[startExercise]].imageURL}")),
                      Container(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // if (_seconds == 0)
                            //   Text("00:00")
                            // else
                            (isBreakTime)
                                ? Text(
                                    "Take a Break  ",
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    "Start Exercise  ",
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            // Expanded(
                            // child:
                            Container(
                              padding: EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  _buildCountDown(context),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "No of Sets: " +
                                        selectedNoOfSets.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
          ),
        ));
  }
}
