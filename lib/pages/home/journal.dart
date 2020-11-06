import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:therapy_zone/pages/home/newpost.dart';

class Journal extends StatefulWidget with NavigationStates {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    void _showPostPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Color.fromRGBO(99, 43, 108, 1),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: NewPost(),
            );
          });
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 15, 54, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(99, 43, 108, 1),
          title: Center(
            child: Text(
              'JOURNAL',
              style: TextStyle(
                  color: Color.fromRGBO(252, 195, 163, 1),
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(240, 159, 156, 1),
        onPressed: () => _showPostPanel(),
        child: Icon(
          Icons.create_outlined,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
