import 'package:flutter/material.dart';
import 'package:therapy_zone/services/auth.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _title;
  String _desc;
  String _mood;
  DateTime _date;
  double _value = 0;

  String _emojify(x) {
    switch (x.floor()) {
      case 0:
        return '\u{1F621}';
      case 1:
        return '\u{1F624}';
      case 2:
        return '\u{1F616}';
      case 3:
        return '\u{1F622}';
      case 4:
        return '\u{1F614}';
      case 5:
        return '\u{1F610}';
      case 6:
        return '\u{1F642}';
      case 7:
        return '\u{1F604}';
      case 8:
        return '\u{1F607}';
      case 9:
        return '\u{1F970}';
      case 10:
        return '\u{1F973}';
    }
    return '\u{1F621}';
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Share With Us',
            style: TextStyle(
                color: Color.fromRGBO(252, 195, 163, 1),
                fontSize: 22.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 10.0),
          TextFormField(
              style: TextStyle(color: Colors.white60, fontSize: 20.0),
              decoration: InputDecoration(
                labelText: 'Your mood right now',
                labelStyle:
                    new TextStyle(color: Colors.white60, fontSize: 15.0),
                prefixIcon: Icon(Icons.mood, color: Colors.white60),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60),
                ),
              ),
              validator: (val) =>
                  val.isEmpty ? 'Please enter current mood' : null,
              onChanged: (val) => _title = val),
          SizedBox(height: 5.0),
          TextFormField(
              style: TextStyle(color: Colors.white60, fontSize: 20.0),
              decoration: InputDecoration(
                labelText: 'Tell us how are you feeling',
                labelStyle:
                    new TextStyle(color: Colors.white60, fontSize: 15.0),
                prefixIcon: Icon(Icons.description, color: Colors.white60),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60),
                ),
              ),
              validator: (val) =>
                  val.isEmpty ? 'Please tell us your feeling?' : null,
              onChanged: (val) => _desc = val),
          SizedBox(height: 10.0),
          Slider(
            value: _value,
            activeColor: Color.fromRGBO(252, 195, 163, 1),
            max: 10,
            min: 0,
            divisions: 10,
            onChanged: (val) {
              setState(() => _value = val);
              _mood = _emojify(_value);
              _date = DateTime.now();
            },
          ),
          Text(_emojify(_value), style: TextStyle(fontSize: 30)),
          SizedBox(height: 15.0),
          FloatingActionButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _auth.postUpdate(_title, _desc, _mood, _date);
                Navigator.of(context).pop();
              }
            },
            backgroundColor: Color.fromRGBO(240, 159, 156, 1),
            child: Icon(
              Icons.send_outlined,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
