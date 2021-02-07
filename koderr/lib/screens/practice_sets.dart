import 'package:koderr/widgets/practice_sets_listTile.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class LabTest {
  final String imageUrl;
  final String labName;
  final String labDescription;
  final String webUrl;
  LabTest(this.labName, this.labDescription, this.webUrl, this.imageUrl);
}

class LabTestPage extends StatefulWidget {
  @override
  _LabTestPageState createState() => _LabTestPageState();
}

class _LabTestPageState extends State<LabTestPage> {
  static List<LabTest> name = [
    LabTest(
        'Must Do Interview Problems',
        '                                        GFG',
        'https://www.geeksforgeeks.org/must-do-coding-questions-for-companies-like-amazon-microsoft-adobe/',
        'assets/images/gfg.png'),
    LabTest(
        'Important Leetcode Problems',
        '                                      Leetcode',
        'https://github.com/Srajan-Jaiswal/Leetcode-Problems',
        'assets/images/leetcode.png'),
    LabTest(
        'Competetive Programming Sheet',
        '                                    Codeforces',
        'https://a2oj.com/ladders',
        'assets/images/cp.jpg'),
    LabTest(
        'Love Babbar DSA Sheet',
        '                                        YouTube',
        'https://drive.google.com/file/d/1FMdN_OCfOI0iAeDlqswCiC2DZzD4nPsb/view',
        'assets/images/DSA.jpg'),
    LabTest(
        'Striver SDE Sheet',
        '                                     YouTube',
        'https://docs.google.com/document/d/1SM92efk8oDl8nyVw8NHPnbGexTS9W-1gmTEYfEurLWQ/edit',
        'assets/images/striver.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text(
          'Practice Section',
          style: TextStyle(
              color: Colors.red,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final LabTest labTest = name[index];
            return IndLabTestTile(
              labTitle: labTest.labName,
              labDescription: labTest.labDescription,
              webUrl: labTest.webUrl,
              imageUrl: labTest.imageUrl,
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        tooltip: 'Search Practice Sets',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<LabTest>(
            items: name,
            searchLabel: 'Search Practice Sets',
            suggestion: Center(
              child: Text('Practice sets for coding practice'),
            ),
            failure: Center(
              child: Text('No set found :('),
            ),
            filter: (labtest) => [
              labtest.labName,
              labtest.labDescription,
              labtest.webUrl,
              labtest.imageUrl
            ],
            builder: (labtest) => IndLabTestTile(
              labTitle: labtest.labName,
              labDescription: labtest.labDescription,
              webUrl: labtest.webUrl,
              imageUrl: labtest.imageUrl,
            ),
          ),
        ),
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
