import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/forgotpassword.dart';
import 'package:second_project/main.dart';
import 'package:second_project/signuppage.dart';
import 'package:second_project/uihelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  login(String email, String password) async {
    if(email=="" && password==""){
      Uihelper.CustomAlertBox(context, "Please fill all the fields");
    }
    else{
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
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
        title: Text("Login Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
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
            Icons.password,
            true,
          ),
          SizedBox(height: 30),
          Uihelper.CustomButton("Login", () {
            login(emailController.text.toString(), passwordController.text.toString());
          }),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPassword()),
              );
            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
