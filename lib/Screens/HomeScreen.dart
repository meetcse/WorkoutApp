import 'package:flutter/material.dart';
import 'package:workoutapp/ExerciseList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  totalExerciseList() {
    return GridView.builder(
      addRepaintBoundaries: true,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisSpacing: 0,
        // mainAxisSpacing: 50,
        childAspectRatio: 1.1,
        crossAxisCount: 2,
      ),
      itemCount: _exerciseList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(color: Colors.green),
            right: BorderSide(color: Colors.green),
            bottom: BorderSide(color: Colors.green),
          )),
          child: SizedBox(
            height: 100,
            width: 20,
            child: Image(
                height: 100,
                width: 20,
                image: AssetImage("${_exerciseList[index].imageURL}")),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Exercises"),
        backgroundColor: Colors.green,
      ),
      body: totalExerciseList(),
    );
  }
}
