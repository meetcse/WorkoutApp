import 'package:flutter/material.dart';
import 'package:workoutapp/ExerciseList.dart';
import 'dart:math';

import 'package:workoutapp/Screens/Workout.dart';
// import 'HomeScreen.dart';

class SelectRandom extends StatefulWidget {
  @override
  _SelectRandomState createState() => _SelectRandomState();
}

class _SelectRandomState extends State<SelectRandom> {
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

  List<int> selectedExercise = [];
  int selectedNoOfSets = 1;

  selectRandomExercises() {
    var list = List<int>.generate(14, (int index) => index);
    list.shuffle();
    for (var i = 0; i < 5; i++) {
      selectedExercise.add(list[i]);
    }
  }

  displaySelectedExercise() {
    return GridView.builder(
      addRepaintBoundaries: true,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.8,
        crossAxisCount: 2,
      ),
      itemCount: selectedExercise.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          width: 50,
          child: Image(
              height: 50,
              width: 20,
              image: AssetImage(
                  "${_exerciseList[selectedExercise[index]].imageURL}")),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectRandomExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Exercise"),
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
                                "${_exerciseList[selectedExercise[index]].imageURL}")),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            // Expanded(
            // child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 8, right: 10),
                  // height: ,
                  // width: 340,
                  child: TextField(
                    decoration: InputDecoration(
                      // labelText: "Select No. of Sets",

                      hintText: "No. of Sets",
                      // alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (input) => {selectedNoOfSets = int.parse(input)},
                  ),
                ),
                // Expanded(
                //   child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            return Workout(_exerciseList, selectedExercise,
                                selectedNoOfSets);
                          }));
                        },
                      ),
                    )
                  ],
                ),
                // ),
              ],
            ),
            // )
          ],
        ),
      ),
    );
  }
}
