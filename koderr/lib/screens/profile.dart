import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:koderr/screens/login.dart';
import 'login.dart';

class MyProfilePage extends StatefulWidget {
  static const String routeName = "/myproflie-page";

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  TextEditingController controllerNickname;
  TextEditingController controllerAboutMe;

  SharedPreferences prefs;

  String id = '';
  String email = "";
  String userName = '';
  String aboutMe = '';
  String photoUrl = '';

  bool isLoading = false;

  final FocusNode focusNodeNickname = new FocusNode();
  final FocusNode focusNodeAboutMe = new FocusNode();

  @override
  void initState() {
    super.initState();
    readLocal();
    _getInfo();
  }

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';
    userName = prefs.getString('userName') ?? '';
    aboutMe = prefs.getString('aboutMe') ?? '';
    email = prefs.getString('email') ?? '';
    photoUrl = prefs.getString('photoUrl') ?? '';
    controllerNickname = new TextEditingController(text: userName);
    controllerAboutMe = new TextEditingController(text: aboutMe);

    // Force refresh input
    setState(() {});
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  SharedPreferences preferences;

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    this.setState(() {
      isLoading = false;
    });
  }

  Widget _buildProfileCard(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMyProfileLogo(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 70.0,
          child: Image(
            image: NetworkImage(imagePath.toString()),
          ),
        ),
      ),
    );
  }

  Future<void> _getInfo() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      userName = preferences.getString("userName");
      email = preferences.getString("email");
      photoUrl = preferences.getString("photoUrl");
      print(photoUrl);
      print(userName);
      print(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Profile Page",
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildMyProfileLogo(photoUrl),
              SizedBox(
                height: 50.0,
              ),
              //_buildProfileCard(userName),
              _buildProfileCard(email),
              SizedBox(
                height: 65.0,
              ),

              RaisedButton(
                elevation: 5.0,
                onPressed: () {
                  handleSignOut().then((val) {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  });
                },
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.red,
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
