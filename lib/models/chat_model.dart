import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String? id; // message ID
  final String? message;
  final String? senderId;
  final String? senderEmail;
  final Timestamp? createdAt;

  ChatModel({
    this.id,
    this.message,
    this.senderId,
    this.senderEmail,
    this.createdAt,
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      message: json['message'],
      senderId: json['senderId'],
      senderEmail: json['senderEmail'],
      createdAt: json['createdAt'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'senderId': senderId,
        'senderEmail': senderEmail,
        'createdAt': FieldValue.serverTimestamp(),
      };
}
