import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  //CODE FOR FEELINGS SLIDER
  double _currentSliderValue = 60;
  String emoji = "\u{1F610}";
  //function to change emoji on slider
  void setEmoji(double value) {
    if (value == 0) {
      emoji = "\u{1F616}";
    }
    if (value == 20) {
      emoji = "\u{1F62A}";
    }
    if (value == 40) {
      emoji = "\u{1F641}";
    }
    if (value == 60) {
      emoji = "\u{1F610}";
    }
    if (value == 80) {
      emoji = "\u{1F600}";
    }
    if (value == 100) {
      emoji = "\u{1F604}";
    }
  }

  // CONTROL TEXT FIELD
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void makeNewPost(String title, String content, String date) {
    String _title = title;
    String _content = content;
    String _date = date;
    Navigator.pop(
        context, {'title': _title, 'content': _content, 'date': _date});
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 43, 108, 1),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
          child: Text(
            'Add new Journal entry',
            style: TextStyle(
              color: Color.fromRGBO(252, 195, 163, 1),
            ),
          ),
        )),
      ),
      body: Container(
        color: Color.fromRGBO(39, 15, 54, 1),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                style: TextStyle(
                  color: Color.fromRGBO(240, 159, 156, 1),
                ),
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(99, 43, 108, .1),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(252, 195, 163, 1),
                    ),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(252, 195, 163, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: contentController,
                style: TextStyle(
                  color: Color.fromRGBO(252, 195, 163, 1),
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(252, 195, 163, 1),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  border: OutlineInputBorder(),
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(252, 195, 163, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'How Are you feeling right now?',
                style: TextStyle(
                  color: Color.fromRGBO(252, 195, 163, 1),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$emoji',
                style: TextStyle(
                  fontSize: 32.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Slider(
                //active and inactive color ??
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 5,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    setEmoji(value);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(240, 159, 156, 1),
        onPressed: () {
          makeNewPost(titleController.text, contentController.text, '22-22-22');
        },
        child: Icon(
          Icons.send_outlined,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
