import 'package:koderr/chatbox/chat.dart';
import 'package:flutter/material.dart';

class Doubts extends StatefulWidget {
  static const String routeName = '/discussions-page';
  @override
  _DoubtsState createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    appBar: new AppBar(
        title: new Text(
          'Doubt Assistant',
          style: TextStyle(
              color: Colors.red,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Chat(),
    );
  }
}
