import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/main.dart';
import 'package:second_project/uihelper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email, String password) async {
    if (email == "" && password == "") {
      Uihelper.CustomAlertBox(context, "Please fill all the fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title:"Home Page")));
        });
      }
      on FirebaseAuthException catch (e) {
        return Uihelper.CustomAlertBox(context, e.code.toString());
  }  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.CustomTextField(
            emailController,
            "Email",
            Icons.email,
            false,
          ),
          Uihelper.CustomTextField(
            passwordController,
            "Password",
            Icons.lock,
            true,
          ),
          SizedBox(height: 30),
          Uihelper.CustomButton("Sign Up", () {
            signUp(emailController.text.toString(), passwordController.text.toString());
          }),
        ],
      ),
    );
  }
}
  