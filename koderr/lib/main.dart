import 'package:koderr/screens/about_us.dart';
import 'package:koderr/screens/dashboard_page.dart';
import 'package:koderr/screens/doubt_assistant.dart';
import 'package:koderr/screens/home.dart';
import 'package:koderr/screens/login.dart';
import 'package:koderr/screens/profile.dart';
import 'package:koderr/screens/chill_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith());
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.black,
      )),
      home: LoginPage(),
      title: 'koderr',
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        MyProfilePage.routeName: (context) => MyProfilePage(),
        AboutPage.routeName: (context) => AboutPage(),
        DiscussionsPage.routeName: (context) => DiscussionsPage(),
        RelaxZonePage.routeName: (context) => RelaxZonePage(),
        DashboardPage.routeName: (context) => DashboardPage(),
      },
    );
  }
}
