import 'package:flutter/material.dart';


class UserProfile {
  String fullname;
  String gender;
  String email;
  String phoneNumber;
  String status;
  String? imageUrl;

  UserProfile({
    required this.fullname,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.status,
    required this.imageUrl,
  });
}