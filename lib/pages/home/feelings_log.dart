// import 'package:flutter/material.dart';

// class Feelings extends StatefulWidget {
//   @override
//   _FeelingsState createState() => _FeelingsState();
// }

// class _FeelingsState extends State<Feelings> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color.fromRGBO(39, 15, 54, 1),
//         child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 250, horizontal: 50),
//             child: Column(
//               children: [
//                 Text(
//                   'How Are you feeling right now?',
//                   style: TextStyle(
//                     color: Color.fromRGBO(240, 159, 156, 1),
//                     fontSize: 20,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Text(
//                   '$emoji',
//                   style: TextStyle(
//                     fontSize: 32.0,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Slider(
//                   value: _currentSliderValue,
//                   min: 0,
//                   max: 100,
//                   divisions: 5,
//                   onChanged: (double value) {
//                     setState(() {
//                       _currentSliderValue = value;
//                       setEmoji(value);
//                     });
//                   },
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 FlatButton(
//                     color: Color.fromRGBO(240, 159, 156, 1),
//                     onPressed: () {
//                       Navigator.popAndPushNamed(context, '/home');
//                     },
//                     child: Text('Home'))
//               ],
//             )),
//       ),
//     );
//   }
// }
