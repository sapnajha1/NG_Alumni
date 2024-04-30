import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../user_form/register.dart';

class AlumniPage extends StatefulWidget {
  AlumniPage({super.key, required this.fullnameController, required this.UserAboutController,required this.profileImage});

  final String fullnameController;
  final String UserAboutController;
  final File? profileImage;
  // final List<UserProfile> userProfiles;





  @override
  State<AlumniPage> createState() => _AlumniPageState();
}

class _AlumniPageState extends State<AlumniPage> {



  // class UserProfile{
  //
  // final String fullName;
  // final File? avatarImage;
  // UserProfile({required this.fullName, this.avatarImage});
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(child: Text('Alumni',style: GoogleFonts.pacifico(color: Color(0xFF673AB7),fontSize: 30),)),
      ),

       body:

       Padding(
         padding: const EdgeInsets.fromLTRB(10, 0 * kToolbarHeight, 10, 20),
         child: Stack(
           children: [
             Align(
                 alignment: const AlignmentDirectional(3, -0.3),
                 child: Container(
                   height: 300,
                   width: 300,
                   decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.deepPurple
                   ),
                 )
             ),

          Align(
            alignment: const AlignmentDirectional(-3, -0.3),
            child: Container(
              height: 300 ,
              width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF673AB7)
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: 300,
              width: 600,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFAB40)
                // color: Color(0xFF7C1f4C)
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              decoration:  BoxDecoration(color: Colors.transparent),
            ),
          ),
         Consumer<RegisterForm>(builder: (context, registerForm, _){
           return registerForm.alumniPage(registerForm.fullNameController,registerForm.SelectedOption,registerForm.userProfilesList );
             }),



           ],
         ),
       ),




      bottomNavigationBar: Consumer<RegisterForm>(
        builder: (context, registerForm, _) {
          return registerForm.bottomNavigationBar(context, Colors.white);
        },
      ),
    );
  }
}
