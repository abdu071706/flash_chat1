import 'package:flutter/material.dart';

class UserModel {
  final String? id;
  final String? email;
  final String? password;
  final String? name;

  UserModel({this.id, this.email, this.password, @required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'name': name,
      };
}
