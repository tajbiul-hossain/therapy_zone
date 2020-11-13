import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Unwind/models/user.dart';
import 'package:Unwind/pages/authenticate/authenticate.dart';
import 'package:Unwind/pages/sidebar/sidebar_layout.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null || !user.isEmailverified) {
      return Authenticate();
    } else {
      return SideBarLayout();
    }
  }
}

// add app icon

// change app name
