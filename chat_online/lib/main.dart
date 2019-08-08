import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // Firestore.instance.collection("mensagens").document().setData({"from":"Daniel","texto":"Ola"});
  runApp(MyApp());
}

final ThemeData themeIOS = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

final ThemeData themeDefault = ThemeData(
    primarySwatch: Colors.purple, accentColor: Colors.orangeAccent[400]);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat app",
      theme: Theme.of(context).platform == TargetPlatform.iOS
          ? themeIOS
          : themeDefault,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    //Safe area permite ignorar aquele not do iphone, e ignorar a barrinha que pode subir no iphoneX
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("chat App"),
          centerTitle: true,
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: TextComposer(),
            )
          ],
        ),
      ),
    );
  }
}

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool _isComposing = false;
  @override
  Widget build(BuildContext context) {
    return IconTheme(
        data: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[200])))
              : null,
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                    icon: Icon(Icons.photo_camera), onPressed: () {}),
              ),
             
              Expanded(child: 
              TextField(decoration: InputDecoration.collapsed(hintText: "Enviar uma mensagem..."),
                onChanged: (text){

                    setState(() {
                    _isComposing = text.length>0;
                    });


                },
              )
              ,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),

                )
            ],
          ),
        ));
  }
}
