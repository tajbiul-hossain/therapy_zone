import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MindShift extends StatefulWidget {
  @override
  _MindShiftState createState() => _MindShiftState();
}

class _MindShiftState extends State<MindShift> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * .63,
            width: size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mindshift.gif'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(
              'Sit down and relax. Give all of your thoughts a temporary pause. Think about a happy thought, watch your favourite funny movie or go out and look at nature. For a minute, think about something happy.',
              style: TextStyle(
                  fontFamily: "FiraSans",
                  fontSize: 18.0,
                  color: Colors.grey[700]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: size.height * .10),
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Done'),
              color: Colors.cyan,
              elevation: 8.0,
            ),
          ),
        ],
      ),
    );
  }
}
