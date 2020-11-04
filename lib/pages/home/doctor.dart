import 'package:therapy_zone/models/doctorinfo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Doctor extends StatelessWidget {
  //DUMMY DOCTOR LIST

  final List<DoctorInfo> doc = [
    DoctorInfo(
        name: 'Dr. Hanif Seddiqui',
        description: 'Random Hospital1',
        contactNumber: '+8801933236173'),
    DoctorInfo(
        name: 'Dr.Manzurul Kabir Ayon',
        description: 'Random Hospital2',
        contactNumber: '+8801521316593'),
    DoctorInfo(
        name: 'Dr. Fairooz Azim',
        description: 'Random Hospital3',
        contactNumber: '+8801817602086'),
    DoctorInfo(
        name: 'Dr. Tajbi-ul Hossain',
        description: 'Random Hospital4',
        contactNumber: '+8801705504590'),
    DoctorInfo(
        name: 'Dr. Ishmamur Rahman',
        description: 'Random Hospital5',
        contactNumber: '+8801930541402'),
  ];

  //FUNCTION FOR CALLS
  // void callDoctor(command) async {
  //   if (await canLaunch(command)) {
  //     await launch(command);
  //   } else {
  //     print('could not call doctor');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 43, 108, 1),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
          child: Text(
            'Make an appointment',
            style: TextStyle(
              color: Color.fromRGBO(252, 195, 163, 1),
            ),
          ),
        )),
      ),
      body: Container(
        color: Color.fromRGBO(39, 15, 54, 1),
        child: ListView.builder(
          itemCount: doc.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Card(
                color: Color.fromRGBO(99, 43, 108, 5),
                child: ListTile(
                    title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton.icon(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        label: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                        onPressed: () {
                          launch('tel: ${doc[index].contactNumber}');
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doc[index].name,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red[100],
                          ),
                        ),
                        Text(
                          doc[index].description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red[100],
                          ),
                        )
                      ],
                    ),
                  ],
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
