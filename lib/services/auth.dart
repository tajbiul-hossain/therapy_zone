import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapy_zone/models/post.dart';
import 'package:therapy_zone/models/user.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final navigatorKey = GlobalKey<NavigatorState>();
  final db = Firestore.instance;
  //create user object based on firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // GET UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }

  //auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in with email & pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return e.message;
    }
  }

  //register with email & pass
  Future registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      UserUpdateInfo updateUser = UserUpdateInfo();
      updateUser.displayName = name;
      await user.updateProfile(updateUser);

      return _userFromFirebaseUser(user);
    } catch (e) {
      return e.message;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return e.message;
    }
  }

  Future postUpdate(
      String title, String desc, String mood, DateTime date) async {
    final uid = await getCurrentUID();
    Post post = Post(title, date, desc, mood);
    await db
        .collection("userData")
        .document(uid)
        .collection("posts")
        .add(post.toJson());
  }
}
