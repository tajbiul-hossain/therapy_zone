import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Breathe extends StatefulWidget {
  @override
  _BreatheState createState() => _BreatheState();
}

class _BreatheState extends State<Breathe> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: height * .6,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/breathe.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                'Sit or lie down for a moment. Just breathe and focus on your breathing. Let go of every negative thinking, just for a moment. Feel any better?',
                style: TextStyle(
                    fontFamily: "FiraSans",
                    fontSize: 18.0,
                    color: Colors.grey[700]),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: height * .15),
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
      ),
    );
  }
}
