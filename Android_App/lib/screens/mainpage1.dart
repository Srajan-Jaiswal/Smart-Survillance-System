import 'dart:convert';
import 'package:hackathon/models/api_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon/styles/styles.dart';
import 'package:hackathon/widgets/DividerLine.dart';
//import 'package:hackathon/widgets/widgets.dart';
import 'package:hackathon/screens/about_us.dart';
import 'package:http/http.dart' as http;
import 'package:hackathon/screens/doubt_assistant.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'dart:async';

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

  Completer<GoogleMapController> _controller = Completer();
  // controller for google map
  GoogleMapController mapController;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  double mapBottomPadding = 0;

  var geoLocator = Geolocator();
  Position currentPosition; // current position of the  user
  // method that gives us the current position  of the user
  void setPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    // Move the app along this position

    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = new CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);










List<Crime> _cdata = List<Crime>() ;

Future<List<Crime>> fetchData() async{

  var url = 'https://hack-5.herokuapp.com/areadata/123';
  var response = await http.get(url);
  var cdata =  List<Crime>();
  if(response.statusCode == 200){
    var dataJson = json.decode(response.body); 
    for(var datas  in dataJson){
      cdata.add(Crime.fromJson(datas));
    }
  }
  return cdata;
}




  @override
  Widget build(BuildContext context) {

  fetchData().then((value){
   _cdata.addAll(value);
  });

    return Theme(
      data: ThemeData(primaryIconTheme: IconThemeData(color: Colors.purple)),
      child: Scaffold(
          appBar: AppBar(
            title: Theme(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  //labelText: "Email",
                  hintText: "Search Crime Rate",
                ),
                autofocus: true,
              ),
              data: Theme.of(context).copyWith(
                primaryColor: Colors.purple
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            brightness: Brightness.dark,
          ),
          key: scaffoldKey,
          drawer: Container(
              width: 250,
              color: Colors.white,
              child: Drawer(
                  child: ListView(
                padding: EdgeInsets.all(0),
                children: <Widget>[
                  Container(
                      height: 160,
                      color: Colors.white,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset('images/user_icon.jpeg',
                                height: 60, width: 60),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(height: 20),
                                Text('Srajan Jaiswal',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Brand-Bold')),
                                SizedBox(height: 5),
                                Text('Edit Profile',
                                    style: TextStyle(fontSize: 15)),
                              ],
                            )
                          ],
                        ),
                      )),
                  DividerLine(),
                  SizedBox(height: 10),









ListTile(
                  leading: Icon(Icons.help, color: Colors.black),
                  title: Text(
                    'Help Assistant',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiscussionsPage(),
                      ),
                    );
                  },
                ),





SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.account_box, color: Colors.black),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ),
                    );
                  },
                ),
SizedBox(height: 10),



                  ListTile(
                    leading: Icon(OMIcons.contactSupport),
                    title: Text("Support", style: kDrawerItemStyle),
                  ),
                ],
              ))),
          body: Stack(children: <Widget>[
            GoogleMap(
              padding: EdgeInsets.only(
                  bottom: mapBottomPadding, top: 50, right: 10, left: 10),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kLake,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              compassEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(
                    controller); // when map is created pass the instance of controller
                mapController = controller;
                setPositionLocator();
                setState(() {
                  mapBottomPadding = 340;
                });
              },
            ),

            // Menu button

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  height: 340,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 30.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              0.7,
                              0.7,
                            ))
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 0,
                        ),



Row(
children : <Widget>[
 Expanded(
    child: RaisedButton(
                                onPressed: () async {},
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(130),
                                ),
                                color: Colors.red,
                                textColor: Colors.black,
                                child: Container(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      'Search',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Brand-Bold'),
                                    ),
                                  ),
                                )),
         ),
Expanded(
    child: RaisedButton(
                                onPressed: () async {},
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(130),
                                ),
                                color: Colors.red,
                                textColor: Colors.black,
                                child: Container(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      'Alert !',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Brand-Bold'),
                                    ),
                                  ),
                                )),
         ),
]),


                        










                        SizedBox(
                          height: 10,
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
                              itemCount:
                                  null == _messages ? 0 : _messages.length,
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
                      ],
                    ),
                  )),
            )
          ])),
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