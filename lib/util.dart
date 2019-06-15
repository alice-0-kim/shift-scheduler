import 'package:flutter/material.dart';

final TextStyle titleBold = TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2);
final TextStyle titleNormal = TextStyle(letterSpacing: 2);
final List<User> users = [
  User(
    'Jane Doe',
    'Part-time employee',
    '123.456.7890',
    'jane.doe@mail.com',
  ),
  User(
    'Dana Smith',
    'Store manager',
    '123.456.7890',
    'd.smith@mail.com',
  ),
  User(
    'Ella Johnson',
    'Owner',
    '123.456.7890',
    'ella0912@mail.com',
  ),
];

class User {
  String name, profession, phone, email;

  User(this.name, this.profession, this.phone, this.email);
}