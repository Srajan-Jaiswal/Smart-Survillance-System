import 'package:flutter/material.dart';
import 'package:hackathon/widgets/widgets.dart';

class MainPage1 extends StatefulWidget {
  static const String id = 'mainpage1';
  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: appBar(context),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Here we got the alerts for the Abnormal Events..",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.purple,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "From the ML predictions..",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text("To be continued !",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 130,
                  ),
                ],
              ),
            )));
  }
}
