import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ng_alumni/user_form/register.dart';
import 'package:provider/provider.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context);
    print(fullnameController);

    return Scaffold(
        body:  GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus(); // Hide the keyboard when tapped outside the TextField
            },

            child:Stack(
                children:[
                  Align(
                      alignment: const AlignmentDirectional(3, -0.3),
                      child: Container(
                        // height: 300,
                        // width: 300,
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
                      // height: 300 ,
                      // width: 300,
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
                      // height: 300,
                      // width: 600,
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
                            // padding: const EdgeInsets.all(40.0),
                            padding: EdgeInsets.all(mq.size.width * 0.1),

                            child: Container(
                                // height: 800,
                                padding: EdgeInsets.all(mq.size.width * 0.03),

                                // padding: const EdgeInsets.all(10.0),
                                child:
                                Consumer<RegisterForm>(builder: (context ,value, child){
                                  return

                                    Column(mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Your TextField wrapped in a method or directly placed here

                                        Center(child: Lottie.asset('assets1/purpleBird2.json',
                                            // height: 130, width: 130
                                          height: mq.size.height * 0.15,
                                          width: mq.size.height * 0.15,
                                        )),
                                        // SizedBox(height: 50,),

                                        SizedBox(height: mq.size.height * 0.06),

                                        Text("what is your full name",style: GoogleFonts.pacifico( fontSize: mq.size.width * 0.05,color: Color(0xFF673AB7)),),

                                        // SizedBox(height: 15,),

                                        SizedBox(height: mq.size.height * 0.01),

                                        value.uiWidget(value.fullNameController),


                                        // SizedBox(height: 20,),
                                        SizedBox(height: mq.size.height * 0.05),

                                        Center(

                                          child:Container(
                                            // width:210,
                                            width: mq.size.width * 0.5,
                                            // color: Color(0xFFF016A70),
                                            child: ElevatedButton(onPressed: (){},
                                                style:ElevatedButton.styleFrom(backgroundColor:Color(0xFFD6B4FC) ) ,
                                                child:
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children:[
                                                      Image.asset("assets1/google.png",
                                                          // height:15,width:21
                                                        height: mq.size.height * 0.03,
                                                        width: mq.size.height * 0.04,
                                                      ),

                                                      SizedBox(width:0),
                                                      Text("Login with Google",style: GoogleFonts.poppins( fontSize: mq.size.width * 0.030,color: Colors.white60),)
                                                    ])
                                            ),
                                          ),
                                        ),

                                      ],);

                                })),
                          ),
                          // Your indicator widget goes here

                        )]
                  ),
                ]
            )));
  }
}