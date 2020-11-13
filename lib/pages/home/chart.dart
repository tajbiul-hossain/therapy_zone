import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Unwind/models/tag.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigate_back.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:Unwind/pages/home/ChartContainer.dart';
import 'package:Unwind/services/auth.dart';

class Chart extends StatefulWidget with NavigationStates {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final AuthService _auth = AuthService();
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
            'STATISTICS',
            style: TextStyle(
                color: Color.fromRGBO(252, 195, 163, 1),
                letterSpacing: 2,
                fontSize: 22,
                fontWeight: FontWeight.w900),
          )),
        ),
        body: StreamProvider<List<Tag>>.value(
            value: _auth.tags, child: Container(child: ChartContainer())),
      ),
    );
  }
}
