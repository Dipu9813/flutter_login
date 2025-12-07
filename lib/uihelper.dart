import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Uihelper {
  static CustomTextField(
    TextEditingController controller,
    String text,
    IconData iconData,
    bool toHide,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  static CustomButton(String text, VoidCallback voidCallback) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 94, 198, 230),
        ),
        child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text),
        actions:[
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("OK"))
        ]
      );
    });
  }
}
