import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/main.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkuser();
  }

  checkuser(){
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      //user is logged in
      return MyHomePage(title: "HomeScreen");
    } else {
      //user is not logged in
      return LoginPage();
    }
  }
}
