import 'package:Unwind/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Unwind/services/auth.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigate_back.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:Unwind/pages/home/newpost.dart';

class Journal extends StatefulWidget with NavigationStates {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  final AuthService _auth = AuthService();
  Back back = Back();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(
        fontFamily: "SpaceGrotesk",
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.white);

    void _showPostPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Color.fromRGBO(47, 94, 161, 1),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: NewPost(),
            );
          });
    }

    return WillPopScope(
      onWillPop: () {
        back.moveToHomeScreen(context);
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.9),
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(51, 129, 239, 0.8),
            title: Center(
              child: Text(
                'JOURNAL',
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
                height: size.height * .4,
                width: size.width,
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('assets/whimsical.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      '“Journaling is like whispering to one’s self and listening at the same time.” _Mina Murray',
                      textAlign: TextAlign.center,
                      style: cardTextStyle,
                    ),
                  ),
                )),
            Container(
              child: Expanded(
                child: StreamBuilder(
                    stream: getUsersPostsStreamSnapshots(context),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Loading();
                      return new ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (BuildContext context, int index) =>
                              buildPostCard(
                                  context, snapshot.data.documents[index]));
                    }),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[600],
          onPressed: () => _showPostPanel(),
          child: Icon(
            Icons.create_outlined,
            color: Colors.blue,
          ),
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
        .orderBy("date", descending: true)
        .snapshots();
  }

  Widget buildPostCard(BuildContext context, DocumentSnapshot post) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Color.fromRGBO(99, 43, 108, .5),
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
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
