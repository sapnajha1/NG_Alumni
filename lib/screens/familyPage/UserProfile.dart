import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class UserProfile {
  final String fullName;
  final File? avatarImage;

  UserProfile({required this.fullName, this.avatarImage});
}