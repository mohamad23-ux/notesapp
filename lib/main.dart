import 'package:chatapp/widgets/custombutton.dart';
import 'package:chatapp/widgets/cutsomtextfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Scholar chat",
                      style: TextStyle(fontSize: 33),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("LOGIN")],
                ),
                CustomTextfield(
                    textInputType: TextInputType.emailAddress,
                    isPassword: false,
                    hinttexttt: "Email"),
                CustomTextfield(
                    textInputType: TextInputType.emailAddress,
                    isPassword: true,
                    hinttexttt: "Password"),
                CustomButton(text: "Log In", onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
