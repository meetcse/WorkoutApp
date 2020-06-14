import 'package:flutter/material.dart';
import 'package:workoutapp/Screens/DayWiseSelect.dart';
import 'package:workoutapp/Screens/HomeScreen.dart';
import 'package:workoutapp/Screens/RandomSelect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout App"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/logo.png")),
            // Text("Welcome To Workout App"),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 250,
              padding: EdgeInsets.only(bottom: 8),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                color: Colors.tealAccent,
                splashColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  "Exercise List",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 250,
              padding: EdgeInsets.only(bottom: 8),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                color: Colors.tealAccent,
                splashColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  "Start Random",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SelectRandom();
                  }));
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 250,
              padding: EdgeInsets.only(bottom: 8),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                color: Colors.tealAccent,
                splashColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  "Start DayWise Mode",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DayWiseSelect();
                  }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
