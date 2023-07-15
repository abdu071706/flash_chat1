import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/firestore_collections/chat_collection.dart';
import '../models/chat_model.dart';
import 'message_bubble.dart';

class FutureChats extends StatelessWidget {
  // final UserModel userModel; voobshe kerek emes!
  final String? currentUserId;
  const FutureChats({
    //  this.userModel,
    this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: chatsCollection.get(), // serverdegi polniy tizmeni beret
      // tizmeni alip alip snapshotDannyi menen ishteshebiz
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshotDannyi) {
        if (snapshotDannyi.hasData) {
          dynamic _chatTizmeData = snapshotDannyi.data!.docs;
          return Expanded(
            child: ListView.builder(
              shrinkWrap:
                  true, // Columndun ichinde ListViewnu koldongondo shrinkWrap true dep koiso problema jok
              itemCount: _chatTizmeData.length ?? 0 ,
              // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              // listview builder tizmeni tizip korsotkongo
              itemBuilder: (context, index) {
           ChatModel  chat =
                    ChatModel.fromJson(_chatTizmeData[index].data());
                log('_chat===>$chat');
                return MessageBubble(
                  // isMe: userModel.id == currentUserId,
                  isMe: chat.senderId == currentUserId,
                  email: chat.senderEmail,
                  text: chat.message,
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
