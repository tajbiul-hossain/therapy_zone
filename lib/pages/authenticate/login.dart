import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Unwind/pages/sidebar/sidebar_layout.dart';
import 'package:Unwind/services/auth.dart';
import 'package:Unwind/shared/loading.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = new TextEditingController();

  bool loading = false;
  bool verified = false;
  String email, password;

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ALERT'),
            content: Text(errormessage),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  void _showResetPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height * .6,
              color: Color.fromRGBO(47, 94, 161, 1),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey1,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                          color: Color.fromRGBO(252, 195, 163, 1),
                          fontSize: 22.0,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        decoration: InputDecoration(
                            labelText: 'Enter email',
                            labelStyle: new TextStyle(
                                color: Colors.white70,
                                letterSpacing: 1,
                                fontSize: 15.0),
                            prefixIcon: Icon(Icons.email_outlined,
                                color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            errorStyle:
                                TextStyle(fontSize: 18, letterSpacing: 1.5)),
                        validator: (val) =>
                            val.isEmpty ? 'Please enter valid email' : null,
                        onChanged: (val) => email = val),
                    SizedBox(height: 60.0),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey1.currentState.validate()) {
                          _auth.resetPassword(email);
                          Navigator.pop(context);
                          showError(
                              "A password reset link has been sent to $email");
                          _emailcontroller.text = email;
                        }
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.7),
                            letterSpacing: 2),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Color.fromRGBO(240, 159, 156, 1),
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return loading
        ? Loading()
        : Scaffold(
            body: verified
                ? SideBarLayout()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/grad.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: width,
                              padding: EdgeInsets.only(top: height * .20),
                              child: Center(
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Welcome to ',
                                        style: TextStyle(
                                            fontSize: 34.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            letterSpacing: 1.0),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: 'Unwind',
                                          style: TextStyle(
                                              fontSize: 38.0,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 1.0,
                                              color: Colors.lightBlue[900]))
                                    ])),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Find Your Mental Peace',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 2.0),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              width: width,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                        controller: _emailcontroller,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        validator: (val) =>
                                            val.isEmpty ? 'Enter Email' : null,
                                        decoration: InputDecoration(
                                            labelText: 'Email',
                                            labelStyle: new TextStyle(
                                                color: Colors.white70),
                                            prefixIcon: Icon(Icons.email,
                                                color: Colors.white70),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white70),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white70),
                                            ),
                                            errorStyle: TextStyle(
                                                fontSize: 18,
                                                letterSpacing: 1.5)),
                                        onChanged: (val) {
                                          setState(() => email = val);
                                        }),
                                    SizedBox(height: 20.0),
                                    TextFormField(
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        validator: (val) => val.length < 6
                                            ? 'Enter Minimum 6 Characters'
                                            : null,
                                        decoration: InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: new TextStyle(
                                                color: Colors.white70),
                                            prefixIcon: Icon(Icons.lock,
                                                color: Colors.white70),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white70),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white70),
                                            ),
                                            errorStyle: TextStyle(
                                                fontSize: 18,
                                                letterSpacing: 1.5)),
                                        obscureText: true,
                                        onChanged: (val) {
                                          setState(() => password = val);
                                        }),
                                    SizedBox(height: 30.0),
                                    RaisedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          if (result is String) {
                                            showError(result);
                                            _emailcontroller.text = email;
                                          } else
                                            verified = true;
                                          setState(() {
                                            loading = false;
                                          });
                                        }
                                      },
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 70),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            letterSpacing: 2),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.white30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 25.0),
                            GestureDetector(
                                onTap: widget.toggleView,
                                child: Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                            SizedBox(height: 25.0),
                            GestureDetector(
                                onTap: _showResetPanel,
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
  }
}
