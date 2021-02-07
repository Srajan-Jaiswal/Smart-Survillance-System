import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:koderr/widgets/fact_message.dart';
import 'chat_message.dart';

class Chat extends StatefulWidget {
  @override
  State createState() => new ChatState();
}

class ChatState extends State<Chat> {
  final TextEditingController _textController = new TextEditingController();
  final List<FactsMessage> _messages = <FactsMessage>[];
  //final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
     FactsMessage message = new FactsMessage(
      text: text,
      name: "Srajan",
      type: true,
    );
    /*ChatMessage message = new ChatMessage(
      text: text,
    );*/
    setState(() {
      _messages.insert(0, message);
    });
     _dialogFlowResponse(text);
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.pink),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration:
                    new InputDecoration.collapsed(hintText: "Post Your Doubts",hintStyle: TextStyle(color: Colors.black54)),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(
                  Icons.send,
                  color: Colors.pink,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }



void _dialogFlowResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
    await AuthGoogle(fileJson: "assets/quizbuilder-1703e-209685dc0dd9.json").build();
    Dialogflow dialogFlow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    FactsMessage message = FactsMessage(
      text: response.getMessage() ??
           CardDialogflow(response.getListMessage()[0]).title,
      name: "Koderr Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }









  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: _textComposerWidget(),
        ),
      ],
    );
  }
}
