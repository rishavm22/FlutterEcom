import 'package:ecom_demo/pages/homePage.dart';
import 'package:ecom_demo/providers/isLogProvider.dart';
import 'package:ecom_demo/providers/statusProvider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database.dart';


FirebaseAuth auth = FirebaseAuth.instance;
User? currentUser = auth.currentUser;
final GoogleSignIn _googleSignIn = GoogleSignIn();

void signInWithEmailAndPassword(String email, String pass, BuildContext context) async{
  try {
    await auth
        .signInWithEmailAndPassword(
      email: email,
      password: pass,
    )
        .then((user) {
      if (user != null) {
        Fluttertoast.showToast(
            msg: 'Successful',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 16.0);
        context.read<IsLoggedProvider>().setLoggedStatus(true);
        Navigator.pushNamed(context, HomePage.id);
      }
    });
  } on FirebaseAuthException catch (e) {
    firebaseAuthErrorHandling(e);
    context.read<StatusProvider>().setLoadingStatus(false);
    context.read<IsLoggedProvider>().setLoggedStatus(false);
  }
}

Future<void> register(String email,
    String pass, BuildContext context) async {
  try {
    await auth
        .createUserWithEmailAndPassword(
      email: email,
      password: pass,
    )
        .then((currentUser) {
      context.read<IsLoggedProvider>().setLoggedStatus(true);
      Navigator.pushNamed(context, HomePage.id);
    });
  } on FirebaseAuthException catch (e) {
    firebaseAuthErrorHandling(e);
    context.read<StatusProvider>().setLoadingStatus(false);
    context.read<IsLoggedProvider>().setLoggedStatus(false);
  }
}

firebaseAuthErrorHandling(FirebaseAuthException e) {
  if (e.code == 'user-not-found') {
    Fluttertoast.showToast(
        msg: 'This email is not registered. Please register yourself',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0);
  } else if (e.code == 'account-exists-with-different-credential') {
    Fluttertoast.showToast(
        msg: e.code,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0);
  } else if (e.code == 'wrong-password') {
    Fluttertoast.showToast(
        msg: 'Invalid Password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0);
  } else {
    Fluttertoast.showToast(
        msg: e.message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}

void googleLogin(BuildContext context) async {
  _googleSignIn.disconnect();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    accountGoogle = (await _googleSignIn.signIn())!;
  final GoogleSignInAuthentication googleAuth =
  await accountGoogle.authentication;
  final OAuthCredential credential = GoogleAuthProvider.credential(
  accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  auth.signInWithCredential(credential).then((value) async {
  prefs.setBool('isSigned', true);
  Navigator.pushNamed(context, HomePage.id);
  });
  } on FirebaseAuthException catch (e) {
  prefs.setBool('isSigned', false);
  Fluttertoast.showToast(
  msg: e.message.toString(),
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  timeInSecForIosWeb: 1,
  fontSize: 16.0,
  );
  }
}
