import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Meditate extends StatefulWidget {
  @override
  _MeditateState createState() => _MeditateState();
}

class _MeditateState extends State<Meditate> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: height * .5,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/unwind_meditation.gif'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
              child: Text(
                'In mindfulness meditation, you broaden your conscious awareness. You focus on what you experience during meditation, such as the flow of your breath. You can observe your thoughts and emotions, but let them pass without judgment.',
                style: TextStyle(
                    fontFamily: "FiraSans",
                    fontSize: 18.0,
                    color: Colors.grey[700]),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: height * .13),
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
