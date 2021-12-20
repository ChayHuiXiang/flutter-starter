import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {

  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _textEditingController = TextEditingController();

  String messageText;
  User signedInUser;

  void getCurrentUser() {
    try {
      User user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(signedInUserEmail: signedInUser.email,),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'sender':signedInUser.email,
                        'text':messageText,
                        'timestamp':DateTime.now(),
                      });
                      _textEditingController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  MessagesStream({
    Key key,
    @required this.signedInUserEmail,
  }) : super(key: key);

  final String signedInUserEmail;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot){
        if (snapshot.hasData){
          List<MessageBubble> messageWidgets = [];
          List<QueryDocumentSnapshot<Map>> documents = snapshot.data.docs;
          for (QueryDocumentSnapshot<Map> document in documents){
            String messageSender = document.data()['sender'];
            String messageText = document.data()['text'];
            messageWidgets.add(MessageBubble(messageText: messageText, messageSender: messageSender, isMe: messageSender == signedInUserEmail,));
          }
          return Expanded(
            child: ListView(
              reverse: true,
              children: messageWidgets,
            )
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
      },
      stream: _firestore.collection('messages').snapshots(),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.messageText,
    @required this.messageSender,
    @required this.isMe,
  }) : super(key: key);

  final String messageText;
  final String messageSender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(messageSender,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12.0,
          ),),
          Material(
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)) : BorderRadius.only(topRight: Radius.circular(30.0),bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Text(
                '$messageText',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
