import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat1/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/chat_model.dart';
import '../models/user_model.dart';
import '../widgets/stream_chats.dart';

class ChatScreen extends StatefulWidget {
  // ChatScreen({this.userData});
  const ChatScreen({required this.userModel});
  // final Map<String,dynamic> userData;

  final UserModel userModel;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final _chatsCollection = FirebaseFirestore.instance.collection('chats');
  final _auth =
      FirebaseAuth.instance; //kirgen user kaisy ekenin bilip alsak bolot
  final TextEditingController _textEditingController = TextEditingController();
  String currentUserId = '';
  bool isChatsEmpty = false;
  final _chats = <ChatModel>[];
  final _chat = ChatModel(
    id: '1234',
    message: 'Salam',
    senderEmail: 'test@test,com',
    senderId: '44534252345',
  );
  @override
  void initState() {
    _addChats();
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      setState(() {
        currentUserId = user!.uid;
      });
      log('currentUserId ==>> $currentUserId');
    } catch (e) {
      // log(e);
    }
  }

  _addChats() {
    setState(() {
      isChatsEmpty = true;
    });
    _chats.add(_chat);
    _chats.add(_chat);
    _chats.add(_chat);
    setState(() {
      isChatsEmpty = false;
    });
  }

  String _message = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                FocusScope.of(context).unfocus();
                _auth.signOut();
                Navigator.pushNamed(context, WelcomeScreen.route);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // _isChatsEmpty ? SizedBox() : _showChats(_chats),
            // _isChatsEmpty ? SizedBox() : _buildFutureChats(),
            //  FutureChats(
            //     userModel: widget.userModel, - voobshe kerek emes
            //     currentUserId: currentUserId,
            //   ),

            StreamChats(
              currentUserId: currentUserId,
            ),
            SizedBox(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        setState(() {
                          _message = value;
                        });
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      _textEditingController.clear();
                      FocusScope.of(context).unfocus();
                      await addChat();
                    },
                    child: const Text(
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

  Future<void> addChat() async {
    // final _chatsCollection = FirebaseFirestore.instance.collection('chats');
    final chatsCollection = FirebaseFirestore.instance.collection('chats');
    ChatModel _chat = ChatModel(
      id: widget.userModel.id,
      message: _message,
      senderEmail: widget.userModel.email,
      senderId: widget.userModel.id,
    );
    // await _chatsCollection.doc(_chat.id).set(_chat.toJson(), SetOptions(merge: true));
    await chatsCollection.add(_chat.toJson());
  }

  Widget _showChats(List<ChatModel> chats) {
    return Expanded(
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            ChatModel chat = chats[index];
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                color: Colors.amberAccent,
                child: Column(
                  children: [
                    Text(
                      chat.senderEmail!,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      chat.message!,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
    // await _chatsCollection
    //     .doc(_chat.id)
    //     .set(_chat.toJson(), SetOptions(merge: false));
  }

// Asynchronous programming
// Future (1 jolu uzaktan danniy alip kelet )
// Stream (live - jivaya postoyanna dannyi kele beret )
// Synchronous programmming
}
