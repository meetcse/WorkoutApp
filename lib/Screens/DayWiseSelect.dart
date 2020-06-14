import 'package:flutter/material.dart';
import 'package:workoutapp/ExerciseList.dart';
import 'package:workoutapp/Screens/Workout.dart';

class DayWiseSelect extends StatefulWidget {
  @override
  _DayWiseSelectState createState() => _DayWiseSelectState();
}

class _DayWiseSelectState extends State<DayWiseSelect> {
  List<ExerciseList> _exerciseList = [
    ExerciseList("1", "images/1.png"),
    ExerciseList("2", "images/2.png"),
    ExerciseList("3", "images/3.png"),
    ExerciseList("4", "images/4.png"),
    ExerciseList("5", "images/5.png"),
    ExerciseList("6", "images/6.png"),
    ExerciseList("7", "images/7.png"),
    ExerciseList("8", "images/8.png"),
    ExerciseList("9", "images/9.png"),
    ExerciseList("10", "images/10.png"),
    ExerciseList("11", "images/11.png"),
    ExerciseList("12", "images/12.png"),
    ExerciseList("13", "images/13.png"),
    ExerciseList("14", "images/14.png"),
  ];
  String _todaysDay;
  List<int> selectedExercise = [0, 1, 2, 3, 4];
  List<ExerciseList> dayWiseSelectedExercise = List<ExerciseList>();

  generateDay() {
    // String date = DateTime.now().toString();
    DateTime date = DateTime.now();
    // print("Date: " + date.weekday.toString());

    switch (date.weekday) {
      case 1:
        {
          dayWiseSelectedExercise.add(_exerciseList[0]);
          dayWiseSelectedExercise.add(_exerciseList[1]);
          dayWiseSelectedExercise.add(_exerciseList[2]);
          dayWiseSelectedExercise.add(_exerciseList[3]);
          dayWiseSelectedExercise.add(_exerciseList[4]);
          _todaysDay = "Monday";
          break;
        }
      case 2:
        {
          dayWiseSelectedExercise.add(_exerciseList[1]);
          dayWiseSelectedExercise.add(_exerciseList[12]);
          dayWiseSelectedExercise.add(_exerciseList[9]);
          dayWiseSelectedExercise.add(_exerciseList[4]);
          dayWiseSelectedExercise.add(_exerciseList[7]);
          _todaysDay = "Tuesday";
          break;
        }
      case 3:
        {
          dayWiseSelectedExercise.add(_exerciseList[2]);
          dayWiseSelectedExercise.add(_exerciseList[8]);
          dayWiseSelectedExercise.add(_exerciseList[13]);
          dayWiseSelectedExercise.add(_exerciseList[10]);
          dayWiseSelectedExercise.add(_exerciseList[6]);
          _todaysDay = "Wednesday";
          break;
        }
      case 4:
        {
          dayWiseSelectedExercise.add(_exerciseList[3]);
          dayWiseSelectedExercise.add(_exerciseList[9]);
          dayWiseSelectedExercise.add(_exerciseList[4]);
          dayWiseSelectedExercise.add(_exerciseList[11]);
          dayWiseSelectedExercise.add(_exerciseList[7]);
          _todaysDay = "Thursday";
          break;
        }
      case 5:
        {
          dayWiseSelectedExercise.add(_exerciseList[4]);
          dayWiseSelectedExercise.add(_exerciseList[12]);
          dayWiseSelectedExercise.add(_exerciseList[10]);
          dayWiseSelectedExercise.add(_exerciseList[7]);
          dayWiseSelectedExercise.add(_exerciseList[1]);
          _todaysDay = "Friday";
          break;
        }
      case 6:
        {
          dayWiseSelectedExercise.add(_exerciseList[5]);
          dayWiseSelectedExercise.add(_exerciseList[6]);
          dayWiseSelectedExercise.add(_exerciseList[3]);
          dayWiseSelectedExercise.add(_exerciseList[13]);
          dayWiseSelectedExercise.add(_exerciseList[9]);
          _todaysDay = "Saturday";
          break;
        }
      case 7:
        {
          dayWiseSelectedExercise.add(_exerciseList[10]);
          dayWiseSelectedExercise.add(_exerciseList[11]);
          dayWiseSelectedExercise.add(_exerciseList[12]);
          dayWiseSelectedExercise.add(_exerciseList[13]);
          dayWiseSelectedExercise.add(_exerciseList[3]);
          _todaysDay = "Sunday";
          break;
        }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your " + _todaysDay + "'s Exercises"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  // addRepaintBoundaries: true,
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 50,
                    childAspectRatio: 1.4,
                    crossAxisCount: 1,
                  ),
                  scrollDirection: Axis.vertical,

                  itemCount: selectedExercise.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.green))),
                      child: SizedBox(
                        height: 10,
                        width: 40,
                        child: Image(

                            // fit: BoxFit.fitHeight,
                            height: 10,
                            width: 40,
                            image: AssetImage(
                                "${dayWiseSelectedExercise[index].imageURL}")),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            // Expanded(
            // child:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(padding: EdgeInsets.only(left: 10.0, right: 5.0)),
                  Container(
                    // height: 40,
                    width: 150,
                    padding: EdgeInsets.only(bottom: 8),
                    child: RaisedButton(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        "Start",
                        style: TextStyle(fontSize: 22),
                      ),
                      color: Colors.tealAccent,
                      splashColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        //TODO: Add function here
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Workout(
                              dayWiseSelectedExercise, selectedExercise, 1);
                        }));
                      },
                    ),
                  )

                  // ),
                ],
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}
