import 'package:koderr/screens/doubts.dart';
import 'package:koderr/screens/practice_sets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:koderr/screens/video_learning.dart';
import 'package:link/link.dart';
import 'package:url_launcher/url_launcher.dart';

enum VisibilityFlag {
  visible,
  invisible,
}

class DashboardPage extends StatefulWidget {
  static const String routeName = "/dashboard-page";

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double _width;
  double _height;

  VisibilityFlag visibility = VisibilityFlag.invisible;

  double offset = 0.0;

  ScrollController scrollController = ScrollController();


  @override
  void initState() {

    scrollController.addListener(() {
      setState(() {
        offset = scrollController.offset;
        if (_chnageAppbar) {
          visibility = VisibilityFlag.visible;
        } else {
          visibility = VisibilityFlag.invisible;
        }
      });
    });
    super.initState();
  }

  bool get _chnageAppbar {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }

  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            controller: scrollController,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          '             Interview Study Material',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                        height: _height / 2.0,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/Language.jpg',
                                      fit: BoxFit.cover,
                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This website will help you understand programming language.',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 0.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'A programming language is a formal language comprising a set of instructions that produce various kinds of output.',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/gfg.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'C/C++/Java/Python',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  'Geeks for Geeks',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10.0),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: InkWell(
                                  onTap: () => launch(
                                      'https://www.geeksforgeeks.org/c-programming-language/'),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/google_logo.png',
                                        fit: BoxFit.fill,
                                        height: _height / 17,
                                        width: _width / 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                        height: _height / 2,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/DSA.jpg',
                                      fit: BoxFit.cover,
                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This Website covers all basic Data Structures and Algorithms.',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'A data structure is a named location that can be used to store and organize data. And, an algorithm is a collection of steps to solve a particular problem. Learning data structures and algorithms allow us to write efficient and optimized computer programs.',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/gfg.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Data Structures/Algorithms',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  'Geeks for Geeks',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10.0),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: InkWell(
                                  onTap: () => launch(
                                      ('https://www.geeksforgeeks.org/data-structures/?ref=shm')),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/google_logo.png',
                                        fit: BoxFit.fill,
                                        height: _height / 17,
                                        width: _width / 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                        height: _height / 2.0,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/CP.png',
                                      fit: BoxFit.cover,
                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This website covers all advanced algorithms that are used in  competitive programming ',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This website provides descriptions of many algorithms and data structures especially popular in field of competitive programming.',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/gfg.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Competitive Programming',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  'CP Algorithms',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10.0),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: InkWell(
                                  onTap: () =>
                                      launch('https://cp-algorithms.com/'),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/google_logo.png',
                                        fit: BoxFit.fill,
                                        height: _height / 17,
                                        width: _width / 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                        height: _height / 2,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/webdev.jpeg',
                                      fit: BoxFit.cover,
                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'Every Web Developer must have a basic understanding of HTML, CSS, and JavaScript',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'Those who can build and maintain websites, apps, and software have a crucial role to play in today’s technology-driven world—and this is reflected in the web development job market.',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/gfg.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Full Stack Web Development',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  'w3schools',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10.0),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: InkWell(
                                  onTap: () => launch(
                                      ('https://www.w3schools.com/whatis/')),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/google_logo.png',
                                        fit: BoxFit.fill,
                                        height: _height / 17,
                                        width: _width / 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                        height: _height / 2.0,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/ML1.png',
                                      fit: BoxFit.cover,
                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'It gives the computer that makes it more similar to humans: The ability to learn',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'Machine learning is a method of data analysis that automates analytical model building. It is a branch of artificial intelligence based on the idea that systems can learn from data, identify patterns and make decisions with minimal human intervention',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/gfg.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Machine Learning',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  'Geeks for Geeks',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10.0),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: InkWell(
                                  onTap: () => launch(
                                      'https://www.youtube.com/watch?v=GwIo3gDZCVQ'),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/google_logo.png',
                                        fit: BoxFit.fill,
                                        height: _height / 17,
                                        width: _width / 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: _width,
                        height: _height / 17.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 1.0, color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        ),
                        child: Center(
                          child: Link(
                            url:
                                'https://www.linkedin.com/jobs/software-engineer-jobs/?originalSubdomain=in',
                            onError: _showErrorSnackBar,
                            child: Text("Job Openings   ->",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: visibility == VisibilityFlag.visible &&
                visibility != VisibilityFlag.invisible,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                  topRight: Radius.circular(90),
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(90)),
              child: Container(
                height: _height / 6.50,
                width: _width,
                color: Colors.blueGrey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, left: 20.0, right: 20.0, bottom: 5.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Doubts())),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Icon(
                                  Icons.face,
                                  color: Colors.black,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'Doubt Assistant',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExtrasPage())),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Icon(
                                  Icons.video_collection_rounded,
                                  color: Colors.black,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'Video Learning',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LabTestPage())),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Icon(
                                  Icons.text_snippet,
                                  color: Colors.black,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'Practice Problems',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
