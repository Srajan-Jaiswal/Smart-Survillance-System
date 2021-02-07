import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = '/about-page';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String launchUrl = "";

  Future<dynamic> _launchUrl(String url) async {
    setState(() {
      launchUrl = url;
    });
    if (await canLaunch(launchUrl)) {
      await launch(launchUrl);
    } else {
      throw 'Could not launch $launchUrl';
    }
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

  Future<void> sharer() async {
    await FlutterShare.share(
        title: 'Koderr',
        text: 'Download koderr by Srajan Jaiswal',
        linkUrl: 'https://play.google.com/',
        chooserTitle: 'Koderr Chooser Title');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> _onSettingsButtonsPressed(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              'Follow Me On',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'OpenSans',
              ),
            ),
            content: Container(
              height: 220,
              child: Column(children: [
                ListTile(
                  title: Text(
                    "Facebook",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: Icon(
                        Feather.facebook,
                        color: Colors.black,
                      ),
                      onPressed: () => _launchUrl(
                          'https://www.facebook.com/profile.php?id=100008051958836'),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.red,
                  thickness: 2.0,
                ),
                ListTile(
                  title: Text(
                    "LinkedIn",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: Icon(
                        Feather.linkedin,
                        color: Colors.black,
                      ),
                      onPressed: () => _launchUrl(
                          'https://www.linkedin.com/in/srajan-jaiswal-28a66b190/'),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.red,
                  thickness: 2.0,
                ),
                ListTile(
                  title: Text(
                    "Github",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: Icon(
                        Feather.instagram,
                        color: Colors.black,
                      ),
                      onPressed: () =>
                          _launchUrl('https://github.com/Srajan-Jaiswal'),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.red,
                  thickness: 2.0,
                )
              ]),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                        onPressed: sharer,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        icon: Icon(
                          Icons.feedback,
                          color: Colors.black,
                        ),
                        onPressed: () => _launchgmail(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "About Us",
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.red),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Feather.send, color: Colors.white),
            onPressed: () => _onSettingsButtonsPressed(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            ClipOval(
              child: Image(
                image: AssetImage('assets/images/koder.png'),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("Koderr",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Ace The Interviews",
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "Software developer interviews are rapidly evolving. Years ago, mastering data structures and common algorithms was enough to ace an interview and get a job. Today though, employers want candidates with real-world experience and skills. \n"
                  "Job seekers would be wise to practice code challenges and take mock interviews to make sure they’re prepared. There are countless books and resources, such as Cracking The Coding Interview, and popular online code challenge websites. \n"
                  "\n"
                  "In addition to those resources, here we provide best coding interview prep platforms for developer candidates."
                  "\n"
                  "\n"
                  "                                                          -Koderr ",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.black,
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.justify,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
