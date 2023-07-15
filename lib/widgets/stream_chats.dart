import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/firestore_collections/chat_collection.dart';
import '../models/chat_model.dart';
import 'message_bubble.dart';

class StreamChats extends StatelessWidget {
  final String? currentUserId;
  const StreamChats({
this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: chatsCollection
          .orderBy('createdAt', descending: false)
          .snapshots(), // serverdegi polniy tizmeni beret
      // tizmeni alip alip snapshotDannyi menen ishteshebiz
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshotDannyi) {
        if (snapshotDannyi.hasData) {
          List<MessageBubble> _chatWidgets = <MessageBubble>[];
          final _chatTizmeData  = snapshotDannyi.data?.docs.reversed;
          for (dynamic _chatData in _chatTizmeData!) {
            ChatModel _chat = ChatModel.fromJson(_chatData.data());
            MessageBubble _chatWidget = MessageBubble(
              isMe: _chat.senderId == currentUserId,
              email: _chat.senderEmail,
              text: _chat.message,
            );
            _chatWidgets.add(_chatWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              // shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: _chatWidgets,
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
