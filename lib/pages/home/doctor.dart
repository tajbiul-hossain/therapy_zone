import 'package:Unwind/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tag_highlighting/tag_highlighting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigate_back.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigation_bloc.dart';

class Doctor extends StatefulWidget with NavigationStates {
  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  Back back = Back();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        back.moveToHomeScreen(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(51, 129, 239, 0.8),
          title: Center(
              child: Text(
            'MAKE AN APPOINMENT',
            style: TextStyle(
                color: Color.fromRGBO(252, 195, 163, 1),
                letterSpacing: 2,
                fontSize: 22,
                fontWeight: FontWeight.w900),
          )),
        ),
        body: Container(
          color: Colors.lightBlueAccent.withOpacity(0.5),
          child: Expanded(
            child: StreamBuilder(
                stream: getdocInfoStreamSnapshots(context),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Loading();
                  return new ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index) =>
                          buildDocCard(
                              context, snapshot.data.documents[index]));
                }),
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> getdocInfoStreamSnapshots(BuildContext context) async* {
    yield* Firestore.instance.collection('docInfo').snapshots();
  }

  Widget buildDocCard(BuildContext context, DocumentSnapshot doc) {
    var width = MediaQuery.of(context).size.width * .7;
    return GestureDetector(
      onTap: () {
        showDialogFunc(context, "${doc['img']}", doc['name'], doc['contact'],
            doc['email']);
      },
      child: Card(
          color: Color.fromRGBO(47, 94, 161, 0.8),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset('${doc['img']}'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 0, 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doc['name'],
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: width,
                        child: TagHighlighting(
                          text:
                              "<bold>Counsellor at:</bold> ${doc['hospital']}\n\n"
                              "<bold>Expertise:</bold> ${doc['expertise']}",
                          defaultTextStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[200],
                          ),
                          tags: [
                            TagHighlight(
                              tagName: "bold",
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.grey[100],
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print('could not launch $command');
  }
}

showDialogFunc(context, img, name, mobile, email) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(47, 94, 161, 0.9),
              ),
              padding: EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(img, width: 130, height: 130),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton.icon(
                        onPressed: () {
                          customLaunch('tel: $mobile');
                        },
                        icon: Icon(Icons.phone),
                        label: Text('Call'),
                      ),
                      RaisedButton.icon(
                        onPressed: () {
                          customLaunch(
                              'mailto:$email?subject=make%20appoinment&body=i%20want%20to%20make%20an%20appointment%20on%20dd/mm/yy%20at%20hh:mm');
                        },
                        icon: Icon(Icons.email),
                        label: Text('Email'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
