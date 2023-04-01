import 'package:flutter/foundation.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final String title;
  final String first;
  final String last;
  final String largeImge;
  // final String medium;
  // final String thumbnail;

  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.title,
      required this.first,
      required this.last,
      required this.largeImge});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        gender: json['gender'],
        email: json['email'],
        phone: json['phone'],
        cell: json['cell'],
        nat: json['nat'],
        title: json['name']['title'],
        first: json['name']['first'],
        last: json['name']['last'],
        largeImge: json['picture']['large']
        );
  }

  String get fullName {
    return '$title $first $last';
  }
}
