import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:therapy_zone/pages/bloc.navigation_bloc/navigation_bloc.dart';

class Chart extends StatefulWidget with NavigationStates {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(99, 43, 108, 1),
          title: Center(
              child: Text(
            'STATISTICS',
            style: TextStyle(
                color: Color.fromRGBO(252, 195, 163, 1),
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
        ),
        body: Container(
          color: Color.fromRGBO(39, 15, 54, 1),
          child: PieChart(
            dataMap: {
              "\u{1F616}": 5,
              "\u{1F62A}": 3,
              "\u{1F641}": 10,
              "\u{1F610}": 5,
              "\u{1F600}": 4
            },
            chartRadius: 400,
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValuesInPercentage: true,
            ),
            legendOptions: LegendOptions(
                legendPosition: LegendPosition.top,
                legendTextStyle: TextStyle(fontSize: 20)),
          ),
        ));
  }
}
