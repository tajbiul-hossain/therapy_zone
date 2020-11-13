import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Talk extends StatefulWidget {
  @override
  _TalkState createState() => _TalkState();
}

class _TalkState extends State<Talk> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * .63,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/talktofriend.gif'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(22.0, 20.0, 22.0, 0.0),
            child: Text(
              'Talking to a close friend or family always helps. They can help you to throw away the unnecessary burden you are carrying for a long time. If '
              'you can\'t find anyone to talk to, see a therapist.',
              style: TextStyle(
                  fontFamily: "FiraSans",
                  fontSize: 18.0,
                  color: Colors.grey[700]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: height * .10),
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
