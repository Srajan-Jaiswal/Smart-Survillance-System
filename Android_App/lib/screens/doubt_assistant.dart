import 'package:hackathon/chatbox/chat.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DiscussionsPage extends StatefulWidget {
  static const String routeName = '/discussions-page';
  @override
  _DiscussionsPageState createState() => _DiscussionsPageState();
}

class _DiscussionsPageState extends State<DiscussionsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(




      appBar: AppBar(
        iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
          title: appBar(context),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          brightness: Brightness.light,
      ),
      backgroundColor: Colors.white10,
      body: Chat(),
    );
  }
}
