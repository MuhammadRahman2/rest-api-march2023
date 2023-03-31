import 'package:flutter/foundation.dart';

class Users {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;


  Users({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        gender: json['gender'],
        email: json['email'],
        phone: json['phone'],
        cell: json['cell'],
        nat: json['nat'],
        );
  }
}


