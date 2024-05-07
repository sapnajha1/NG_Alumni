import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class UserProfile {
  final String fullName;
  final File? getImage;

  UserProfile({required this.fullName, this.getImage});
}