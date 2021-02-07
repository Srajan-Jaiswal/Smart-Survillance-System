import 'package:koderr/chatbox/chat.dart';
import 'package:flutter/material.dart';

class DiscussionsPage extends StatefulWidget {
  static const String routeName = '/discussions-page';
  @override
  _DiscussionsPageState createState() => _DiscussionsPageState();
}

class _DiscussionsPageState extends State<DiscussionsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      body: Chat(),
    );
  }
}
