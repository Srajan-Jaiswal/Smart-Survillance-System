import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
class AboutPage extends StatefulWidget {
  static const String routeName = '/about-page';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String launchUrl = "";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            ClipOval(
              child: Image(
                image: AssetImage('images/runtime.png'),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("YOUR SECURITY IS OUR PRIORITY",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Be Alert !",
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.red,
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
                  "The idea is to develop a system that will take a live video feed from the CCTV and the trained models will continuously analyse the live feed for any irregularities, once any of those anomalies are discovered, the system will generate 2 kinds of alert messages which will be sent to the registered users via the Android/iOS app. One will be focused on the concerned authorities like police and hospitals. Another one will go to the people around the area of the detected irregularity with the instructions whether to evacuate or supply help along with the severity of the anomaly detected. \n" 
                  "The other aspect of this project will utilise the above process for Making the public surveillance system more accessible to the public by allowing them to interact with the system using their Android app that will fetch the data from the surveillance system in an encapsulated way to find the detailed analysis of any public area under monitoring to know the predictions on Crimes/ incidents and predict the percentage of occurring of new events or anomaly in real time. \n"
      
                  "\n"
                  "\n"
                  "                                                        -Team T186 ",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.purple,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
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
