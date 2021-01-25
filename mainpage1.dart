import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hackathon/widgets/widgets.dart';

class MainPage1 extends StatefulWidget {
  //MainPage1() : super();
  static const String id = 'mainpage1';
  final String title = 'Hackathon jeetenge';

  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging(); // instance
  List<Message> _messages;
  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device Token: $deviceToken");
    });
  }

  _configureFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        _setMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _setMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _setMessage(message);
      },
    );
  }

  _setMessage(Map<String, dynamic> message) {
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data['message'];
    setState(() {
      Message m = Message(title, body, mMessage);
      _messages.add(m);
    });
  }

  @override
  void initState() {
    _messages = List<Message>();
    super.initState();
    _getToken();
    _configureFirebaseListeners();
  }

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
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text(
                  "Search Crime Rates nearby places",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Search Place",
                          hintStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(16)),
                          prefixIcon: const Icon(
                            Icons.place,
                            color: Colors.purpleAccent,
                          ),
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                        height: 50.0,
                        child: RaisedButton(
                            onPressed: () async {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(130),
                            ),
                            color: Colors.purpleAccent,
                            textColor: Colors.black,
                            child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Brand-Bold'),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ])),
                SizedBox(
                  height: 0,
                ),
                Expanded(
                    //  flex: 1,
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.purple,
                  ),
                  height: 25,
                  child: ListView.builder(
                      itemCount: null == _messages ? 0 : _messages.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            _messages[index].message == null
                                ? ''
                                : _messages[index].message,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ));
                      }),
                ))
              ]))),
    );
  }
}

class Message {
  String title;
  String body;
  String message;
  Message(title, body, message) {
    this.title = title;
    this.body = body;
    this.message = message;
  }
}
