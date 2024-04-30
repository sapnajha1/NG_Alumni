import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../user_form/register.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController womenController = TextEditingController();
  TextEditingController manController = TextEditingController();
  TextEditingController othersController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(

        body:  Stack(
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
                      padding: EdgeInsets.all(mq.size.width * 0.1),
                      child: Container(
                          // height: 500,
                      // height: mq.size.height * 0.7,
                          padding: EdgeInsets.all(mq.size.width * 0.03),
                        child:
                        Consumer<RegisterForm>(builder: (context, vale, child){
                          return

                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Your TextField wrapped in a method or directly placed here


                            Text("what define you",style: GoogleFonts.pacifico(fontSize: mq.size.width * 0.06,color: Color(0xFF673AB7)),),
                            SizedBox(height: mq.size.height * 0.1),

                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    womenController.text = 'Female';
                                  },
                                  child: Container(
                                    height: mq.size.width * 0.25,
                                    width: mq.size.width * 0.25,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),color: Color(0xFF26204D),
                                      // Set the border radius
                                      border: Border.all(
                                        color: Colors.transparent, // Set the border color
                                        width: 2, // Set the border thickness
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Lottie.asset('assets1/man.json',width: mq.size.width * 0.20,
                                            height: mq.size.width * 0.20,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(width: mq.size.width * 0.20),
                                GestureDetector(
                                  onTap: (){
                                    manController.text = 'Male';
                                    print("Male");
                                  },
                                  child: Container(
                                    height: mq.size.width * 0.25,
                                    width: mq.size.width * 0.25,
                                    decoration: BoxDecoration(color: Color(0xFF898681),
                                      borderRadius: BorderRadius.circular(100), // Set the border radius
                                      border: Border.all(
                                        color: Colors.transparent, // Set the border color
                                        width: 2, // Set the border thickness
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Lottie.asset('assets1/women.json',width: mq.size.width * 0.25,
                                            height: mq.size.width * 0.25,),
                                        )
                                      ],
                                    ),
                                  ),
                                )

                              ],
                            ),

                            SizedBox(height: mq.size.height * 0.05),

                            Center(
                              child: GestureDetector(
                                onTap: (){
                                  othersController.text = 'Others';
                                },
                                child: Container(
                                  height: mq.size.width * 0.25,
                                  width: mq.size.width * 0.25,
                                  decoration: BoxDecoration(
                                    color : Color(0xFFF69FD5),
                                    borderRadius: BorderRadius.circular(100), // Set the border radius
                                    border: Border.all(
                                      color: Colors.transparent, // Set the border color
                                      width: 2, // Set the border thickness
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Lottie.asset('assets1/others.json', width: mq.size.width * 0.25,
                                          height: mq.size.width * 0.25,),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )

                            // Other widgets if needed
                          ],
                        );})
                    ),
                  ),
                  // Your indicator widget goes here

                  )],
              ),
            ]
        ));
  }
}
