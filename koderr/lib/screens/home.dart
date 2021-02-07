import 'package:koderr/screens/doubt_assistant.dart';
import 'package:koderr/screens/chill_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:koderr/screens/about_us.dart';
import 'package:share/share.dart';
import 'package:koderr/screens/profile.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home-page";

  final String currentUserId;
  HomePage({Key key, @required this.currentUserId}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(currentUserId: currentUserId);
}

class _HomePageState extends State<HomePage> {
  final String currentUserId;

  Future<bool> _onWillPop() {
    Alert(
      style: AlertStyle(
        backgroundColor: Colors.black,
        titleStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        descStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
      ),
      context: context,
      type: AlertType.error,
      title: "Exit",
      desc: "Do you want to exit the app ?",
      buttons: [
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(
                fontFamily: 'OpenSans', color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(false),
          gradient: LinearGradient(colors: [
            Color(0xFF20BF55),
            Color(0xFF01BAEF),
          ]),
        ),
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(
                fontFamily: 'OpenSans', color: Colors.white, fontSize: 20),
          ),
          onPressed: () => SystemNavigator.pop(),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  _launchgmail() async {
    const url =
        'mailto:srajanjaiswal604@gmail.com?subject=Feedback&body=Feedback for Our Support';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // ignore: unused_element
  _HomePageState({Key key, @required this.currentUserId});
  final List<Map<String, Object>> _pages = [
    {
      'page': DashboardPage(),
      'appBarTitle': 'Koderr Prep',
    },
    {
      'page': DiscussionsPage(),
      'appBarTitle': 'Doubt Assistant',
    },
    {
      'page': RelaxZonePage(),
      'appBarTitle': 'Chill Time',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            _pages[_selectedPageIndex]['appBarTitle'],
            style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () => _launchgmail(),
              icon: Icon(
                FlutterIcons.gmail_mco,
                color: Colors.white,
              ),
            )
          ],
        ),
        drawer: Container(
            width: 250,
            child: Drawer(
                child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                Container(
                    height: 160,
                    color: Colors.black,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/ui.png',
                              height: 60, width: 60),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              Text('Welcome',
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Brand-Bold')),
                              SizedBox(height: 5),
                              Text('Edit Profile',
                                  style: TextStyle(fontSize: 15)),
                            ],
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 30),
                ListTile(
                  leading: Icon(Icons.local_hospital, color: Colors.black),
                  title: Text(
                    'Download E-books',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () => launch(
                      'https://www.pdfdrive.com/cracking-the-coding-interview-books.html'),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.chat, color: Colors.black),
                  title: Text(
                    'Carrer Discussions',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  onTap: () => launch('https://discord.gg/a5MVnTNp'),
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
                  leading: Icon(Icons.person, color: Colors.black),
                  title: Text(
                    'Profile Page',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfilePage(),
                      ),
                    );
                  },
                ),
                Divider(
                  thickness: 2.0,
                  color: Colors.black12,
                ),
                ListTile(
                  leading: Icon(Icons.share, color: Colors.black),
                  title: Text(
                    'Share',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  onTap: () {
                    RenderBox box = context.findRenderObject();
                    Share.share(
                        'Share koderr by Srajan Jaiswal \n'
                        'https://play.google.com/',
                        sharePositionOrigin:
                            box.localToGlobal(Offset.zero) & box.size);
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ))),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: Container(
          height: 60,
          child: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
            onTap: _selectPage,
            type: BottomNavigationBarType.shifting,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  //color: Colors.grey,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.message,
                  color: Colors.grey,
                ),
                title: Text(
                  "Doubts",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.games,
                  color: Colors.grey,
                ),
                title: Text(
                  "Chill Time",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ],
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
