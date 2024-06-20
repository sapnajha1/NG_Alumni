import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ng_alumni/screens/familyPage/familyHomePage.dart';
import 'package:provider/provider.dart';

import '../user_form/register.dart';

class WelcomeAgain extends StatefulWidget {
  const WelcomeAgain({super.key});

  @override
  State<WelcomeAgain> createState() => _WelcomeAgainState();
}

class _WelcomeAgainState extends State<WelcomeAgain> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      body:
      Stack(
          children:[
            Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: mq.size.width*0.8,
                  width: mq.size.width*0.8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple
                  ),
                )
            ),
            Align(
              alignment: const AlignmentDirectional(-3, -0.3),
              child: Container(
                height: mq.size.width*0.8,
                width: mq.size.width*0.8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF673AB7)
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -1.2),
              child: Container(
                height: mq.size.width*0.8,
                width: mq.size.width,
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

            Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.all(40.0),
                      child: Container(height: 800,
                          padding:  EdgeInsets.all(10.0),
                          child:

                              Column(mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Your TextField wrapped in a method or directly placed here

                                  Center(child: Lottie.asset('assets1/hurray.json', height: mq.size.height * 0.3,
                                    width: mq.size.width * 0.5,)),

                                  Center(child: Lottie.asset('assets1/purpleBird1.json',   height: mq.size.height * 0.2,
                                    width: mq.size.width * 6.0,)),
                                  // SizedBox(height: 0,),

                                  Center(child: Text("Hurray!",style: GoogleFonts.pacifico(fontSize: mq.size.width * 0.1,color: Color(0xFF673AB7)),)),

                                  SizedBox(height: mq.size.height * 0.10),


                                  Center(child: Text("click on button to visit NGfamily",style:  GoogleFonts.poppins(fontSize: mq.size.width * 0.05,color: Color(0xFFFFAB40)))),

                                  Consumer<RegisterForm>(builder: (context, value, child){
                                    return
                                      Center(
                                        child: value.uiButton(context, () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder:(context) => FamilyHomePage()));
                                        },
                                          buttonWidth: mq.size.width * 0.1,
                                          buttonHeight: mq.size.height * 0.2,
                                          buttonText: 'Home',
                                          buttonColor: Color(0xFF673AB7),
                                          textStyle: GoogleFonts.pacifico(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),


                                        ),
                                      );
                                  })









   ] ))))])
    ]));}
}
