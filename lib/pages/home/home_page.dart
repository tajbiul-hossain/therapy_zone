import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:Unwind/pages/home/meditate.dart';
import 'package:Unwind/pages/home/mindshift.dart';
import 'package:Unwind/pages/home/talk.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:Unwind/pages/home/breathe.dart';

class Home extends StatefulWidget with NavigationStates {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  Future<void> getUserData() async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      name = userData.displayName;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var cardTextStyle = TextStyle(
        fontFamily: "IBMPlexSans",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.lightBlue[800]);
    var cardTextStyleTwo = TextStyle(
        fontFamily: "SpaceGrotesk",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.withOpacity(0.5),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(51, 129, 239, 0.8),
          title: Center(
            child: Text(
              'HOME',
              style: TextStyle(
                  color: Color.fromRGBO(252, 195, 163, 1),
                  letterSpacing: 2,
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
          )),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: size.height * .35,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage('assets/meditation.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: size.width,
                  child: Center(
                    child: Text(
                      "Hey $name, we are glad to have you here!",
                      style: cardTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Expanded(
              child: GridView.count(
                mainAxisSpacing: 20,
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
                crossAxisSpacing: 20,
                primary: false,
                crossAxisCount: 2,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.JournalClickedEvent);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.white30,
                      elevation: 4.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/journal.png'),
                            height: 100.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Mood Journal',
                            style: cardTextStyleTwo,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.LearnClickedEvent);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.white30,
                      elevation: 4.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/learn.png'),
                            height: 100.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Learn',
                            style: cardTextStyleTwo,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.ChartClickedEvent);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.white30,
                      elevation: 4.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/chart.png'),
                            height: 75.0,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Stats',
                            style: cardTextStyleTwo,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.QuizClickedEvent);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.white30,
                      elevation: 4.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/test.png'),
                            height: 80.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Take a test',
                            style: cardTextStyleTwo,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.DoctorListClickedEvent);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.white30,
                      elevation: 4.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/appointment.png'),
                            height: 80.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Professional help',
                            style: cardTextStyleTwo,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        child: Icon(
          Icons.sentiment_satisfied_rounded,
        ),
        backgroundColor: Colors.lightGreen,
        overlayColor: Colors.white,
        overlayOpacity: 0.3,
        curve: Curves.bounceIn,
        elevation: 9.0,
        children: [
          SpeedDialChild(
            child: Icon(Icons.all_inclusive_rounded),
            backgroundColor: Colors.lightBlueAccent,
            label: "Breathe",
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.cyan),
            labelBackgroundColor: Color.fromRGBO(251, 248, 248, 0.9),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Breathe()));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.filter_tilt_shift),
            backgroundColor: Colors.pinkAccent,
            label: "Shift your mind",
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.cyan),
            labelBackgroundColor: Color.fromRGBO(251, 248, 248, 0.9),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MindShift()));
            },
          ),
          SpeedDialChild(
              child: Icon(Icons.accessibility_sharp),
              backgroundColor: Colors.purpleAccent,
              label: "Meditate",
              labelStyle: TextStyle(fontSize: 18.0, color: Colors.cyan),
              labelBackgroundColor: Color.fromRGBO(251, 248, 248, 0.9),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Meditate()));
              }),
          SpeedDialChild(
            child: Icon(Icons.call_end),
            backgroundColor: Colors.orangeAccent,
            label: "Let's Talk",
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.cyan),
            labelBackgroundColor: Color.fromRGBO(251, 248, 248, 0.9),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Talk()));
            },
          )
        ],
      ),
    );
  }
}
