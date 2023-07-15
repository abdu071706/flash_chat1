import 'package:cloud_firestore/cloud_firestore.dart';

final chatsCollection = FirebaseFirestore.instance.collection('chats');
final userCollection = FirebaseFirestore.instance.collection('users');
