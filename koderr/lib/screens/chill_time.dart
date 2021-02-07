import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music_player/music_player.dart';

class RelaxZonePage extends StatefulWidget {
  static const String routeName = '/relax-page';

  @override
  _RelaxZonePageState createState() => _RelaxZonePageState();
}

class _RelaxZonePageState extends State<RelaxZonePage> {
  MusicPlayer musicPlayer;
  String _duration = "";
  final _durationInputController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
  }

  Future<bool> _onDurationButtonPressed(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Center(
              child: Text(
                "Set Duration for song",
                style: TextStyle(color: Colors.black),
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 96,
                child: Column(
                  children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.edit_attributes,
                            color: Colors.greenAccent,
                          ),
                          hintText: 'Set the duration',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        onTap: () => setState(() {
                              _duration =
                                  _durationInputController.text.toString();
                            })),
                    FlatButton(
                      color: Colors.black,
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        'SET',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Material(
                color: Colors.black,
                elevation: 14,
                borderRadius: BorderRadius.circular(30.0),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Online Video-Games",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          leading: Icon(
                            SimpleLineIcons.game_controller,
                            color: Colors.redAccent,
                          ),
                          title: Text(
                            'Bubble-Shooter Game',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: InkWell(
                            onTap: () => launch(
                                'https://www.agame.com/game/bubble-shooter'),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/arrow.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            SimpleLineIcons.game_controller,
                            color: Colors.redAccent,
                          ),
                          title: Text(
                            'Sudoku Game',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: InkWell(
                            onTap: () => launch(
                                'https://www.agame.com/game/sudoku-classic-'),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/arrow.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            SimpleLineIcons.game_controller,
                            color: Colors.redAccent,
                          ),
                          title: Text(
                            'Hill-Racing Game',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: InkWell(
                            onTap: () => launch(
                                'https://www.agame.com/game/hill-racing-challenge'),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/arrow.jpeg',
                                  fit: BoxFit.fill,
                                  // height: _height / 17,
                                  // width: _width / 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            SimpleLineIcons.game_controller,
                            color: Colors.redAccent,
                          ),
                          title: Text(
                            'Impostor Game',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: InkWell(
                            onTap: () =>
                                launch('https://www.agame.com/game/impostor'),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/arrow.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Material(
                color: Colors.black,
                elevation: 14,
                borderRadius: BorderRadius.circular(30.0),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "E-News",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          leading: Icon(
                            SimpleLineIcons.book_open,
                            color: Colors.redAccent,
                          ),
                          title: Text(
                            'Political News',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: InkWell(
                            onTap: () =>
                                launch('https://www.indiatvnews.com/politics'),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/arrow.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.party_mode,
                            color: Colors.redAccent,
                          ),
                          title: Text(
                            'Entertainment',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: InkWell(
                            onTap: () =>
                                launch('https://www.aajtak.in/entertainment'),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/arrow.jpeg',
                                  fit: BoxFit.fill,
                                  // height: _height / 17,
                                  // width: _width / 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.business,
                            color: Colors.redAccent,
                          ),
                          title: Text(
                            'Business News',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: InkWell(
                            onTap: () =>
                                launch('https://www.businesstoday.in/'),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/arrow.jpeg',
                                  fit: BoxFit.fill,
                                  // height: _height / 17,
                                  // width: _width / 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.sports_cricket,
                            color: Colors.redAccent,
                          ),
                          title: Text(
                            'Sports News',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: InkWell(
                            onTap: () => launch(
                                'https://indianexpress.com/section/sports/'),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/arrow.jpeg',
                                  fit: BoxFit.fill,
                                  // height: _height / 17,
                                  // width: _width / 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
