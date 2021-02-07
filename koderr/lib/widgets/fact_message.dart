import 'package:flutter/material.dart';

class FactsMessage extends StatelessWidget {
  FactsMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> botMessage(context) {
    return <Widget>[
      Container(
        //color: Colors.black,
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(child: Text('Bot',style: TextStyle(color:Colors.black),),backgroundColor: Colors.red,),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name,
                style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text,style: TextStyle(fontFamily: 'OpenSans',color: Colors.white)),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(this.name, style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text,style: TextStyle(fontFamily: 'OpenSans',color: Colors.white),),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(child: new Text(this.name[0],style: TextStyle(color:Colors.black)),backgroundColor: Colors.red,),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}