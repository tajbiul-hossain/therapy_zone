import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy_zone/services/auth.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:therapy_zone/pages/home/newpost.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Journal extends StatefulWidget with NavigationStates {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  final AuthService _auth = AuthService();
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
      body: Container(
        child: StreamBuilder(
            stream: getUsersPostsStreamSnapshots(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Loading...");
              return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildPostCard(context, snapshot.data.documents[index]));
            }),
      ),
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

  Stream<QuerySnapshot> getUsersPostsStreamSnapshots(
      BuildContext context) async* {
    final uid = await _auth.getCurrentUID();
    yield* Firestore.instance
        .collection('userData')
        .document(uid)
        .collection('posts')
        .snapshots();
  }

  Widget buildPostCard(BuildContext context, DocumentSnapshot post) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Color.fromRGBO(99, 43, 108, .5),
        margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: Color.fromRGBO(99, 43, 108, 0),
            child: Text(
              post['mood'],
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          title: Text(
            post['title'],
            style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          subtitle: Text(
            post['desc'],
            style: TextStyle(fontSize: 17.0, color: Colors.white54),
          ),
          trailing: Text(
            '${DateFormat.yMd().format(post['date'].toDate()).toString()}\n${DateFormat.jm().format(post['date'].toDate()).toString()}',
            style: TextStyle(color: Colors.white38),
          ),
        ),
      ),
    );
  }
}
