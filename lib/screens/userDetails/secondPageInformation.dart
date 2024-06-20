import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:ng_alumni/screens/userDetails/firstPage.dart';
import 'package:ng_alumni/screens/userDetails/fivethPage.dart';
import 'package:ng_alumni/screens/userDetails/registerPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../user_form/register.dart';
// import '../home.dart';
// import '../user_form/register.dart';
import 'package:lottie/lottie.dart';

class secondInformation extends StatefulWidget {
  const secondInformation({super.key});

  @override
  State<secondInformation> createState() => _secondInformationState();
}

class _secondInformationState extends State<secondInformation> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          mq.size.width * 0.1,
          1.2 * kToolbarHeight,
          mq.size.width * 0.1,
          20,
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.9, -0.3),
              child: Container(
                height: mq.size.width * 0.6,
                width: mq.size.width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.9, -0.3),
              child: Container(
                height: mq.size.width * 0.6,
                width: mq.size.width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF673AB7),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1.2),
              child: Container(
                height: mq.size.width * 0.6,
                width: mq.size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFFFAB40),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
              ),
            ),
            Consumer<RegisterForm>(
              builder: (context, value, child) {
                return Center(
                  child: Column(
                    children: [

                      Center(child: Lottie.asset('assets1/purpleBird2.json',
                        // height: 130, width: 130
                        height: mq.size.height * 0.30,
                        width: mq.size.height * 0.30,
                      )),
                      // SizedBox(height: 50,),

                      // SizedBox(height: mq.size.height * 0.06),

                      Container(
                        width: mq.size.width * 0.5,
                        height: mq.size.width * 0.09,
                        child: Image.asset(
                          'images/ng_logo.png',
                          height: mq.size.width * 0.09,
                          width: mq.size.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),


                      Text(
                        "Family wants to know ",
                        style: GoogleFonts.poppins(
                          fontSize: mq.size.width * 0.08,
                        ),
                      ),
                      Text(
                        "about you!",
                        style: GoogleFonts.poppins(
                          fontSize: mq.size.width * 0.08,
                        ),
                      ),
                      SizedBox(height: mq.size.height * 0.2),
                      Text(
                        "Are You Ready to Get Together",
                        style: GoogleFonts.oswald(
                          fontSize: mq.size.width * 0.06,
                          color: Color(0xFFFFAB40),
                        ),
                      ),
                      SizedBox(height: 5),
                      value.uiButton(
                        context,
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FivethPage(),
                            ),
                          );
                        },
                        buttonText: 'Click Here',
                        buttonHeight: mq.size.height * 0.2,
                        buttonWidth: mq.size.width * 0.1,
                        buttonColor: Color(0xFF673AB7),
                        textStyle: GoogleFonts.pacifico(
                          fontSize: mq.size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
