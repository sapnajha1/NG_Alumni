// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:ng_alumni/screens/welcomeAgain.dart';
// import 'package:provider/provider.dart';
//
// import '../../user_form/register.dart';
//
// class FourthPage extends StatefulWidget {
//   const FourthPage({super.key});
//
//   @override
//   State<FourthPage> createState() => _FourthPageState();
// }
//
// class _FourthPageState extends State<FourthPage> {
//   // TextEditingController studentController = TextEditingController();
//   TextEditingController statusController = TextEditingController();
//   // TextEditingController outsiderpController = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final mq = MediaQuery.of(context);
//     return Scaffold(
//         body:  Stack(
//             children:[
//               Align(
//                   alignment: const AlignmentDirectional(3, -0.3),
//                   child: Container(
//                     height: mq.size.width*0.8,
//                     width: mq.size.width*0.8,
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.deepPurple
//                     ),
//                   )
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(-3, -0.3),
//                 child: Container(
//                   height: mq.size.width*0.8,
//                   width: mq.size.width*0.8,
//                   decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color(0xFF673AB7)
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(0, -1.2),
//                 child: Container(
//                   height: mq.size.width*0.8,
//                   width: mq.size.width
//
//                   ,
//                   decoration: const BoxDecoration(
//                       color: Color(0xFFFFAB40)
//                     // color: Color(0xFF7C1f4C)
//                   ),
//                 ),
//               ),
//               BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
//                 child: Container(
//                   decoration:  BoxDecoration(color: Colors.transparent),
//                 ),
//               ),
//
//               Column(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.all(mq.size.width * 0.1),
//                       child: Container(
//                           // height: 500,
//                           padding: EdgeInsets.all(mq.size.width * 0.025),
//                           child:
//                           Consumer<RegisterForm>(builder: (context, vale, child){
//                             return
//
//                               Column(mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // Your TextField wrapped in a method or directly placed here
//
//
//                                   Text("your current status",style: GoogleFonts.pacifico(                  fontSize: mq.size.width * 0.06,
//                                       color: Color(0xFF673AB7)),),
//                                   SizedBox(height: mq.size.height * 0.1),
//
//                                   Row(
//                                     children: [
//                                       GestureDetector(
//                                         onTap: (){
//                                           statusController.text = 'Student';
//                                           vale.updateSelectedOption('Student');
//                                           print(statusController.text);
//
//                                         },
//                                         child: Container(
//                                             height: mq.size.width * 0.25,
//                                             width: mq.size.width * 0.25,
//                                           decoration: BoxDecoration(color: Colors.white60,
//                                             borderRadius: BorderRadius.circular(100), // Set the border radius
//                                             border: Border.all(
//                                               color: Colors.transparent, // Set the border color
//                                               width: 2, // Set the border thickness
//                                             ),
//                                           ),
//                                           child:
//                                           Center(child: Text("Student",style: GoogleFonts.bungeeSpice(fontSize: mq.size.width * 0.04,),))
//
//                                         ),
//                                       ),
//
//                                       SizedBox(width: mq.size.width * 0.2),
//                                       GestureDetector(
//                                         onTap: (){
//                                           statusController.text = 'Alumni';
//                                           vale.updateSelectedOption('Alumni');
//                                           print("alumni");
//                                         },
//                                         child: Container(
//                                             height: mq.size.width * 0.25,
//                                             width: mq.size.width * 0.25,
//                                           decoration: BoxDecoration(color: Colors.white60,
//                                             borderRadius: BorderRadius.circular(100), // Set the border radius
//                                             border: Border.all(
//                                               color: Colors.transparent, // Set the border color
//                                               width: 2, // Set the border thickness
//                                             ),
//                                           ),
//                                           child:
//                                           Center(child: Text("Alumni",style: GoogleFonts.bungeeSpice(fontSize: mq.size.width * 0.04,),))
//
//                                         ),
//                                       )
//
//                                     ],
//                                   ),
//
//                                   SizedBox(height: mq.size.height * 0.1),
//
//                                   Center(
//                                     child: GestureDetector(
//                                       onTap: (){
//                                         statusController.text = 'Outsider';
//                                         vale.updateSelectedOption('Outsider');
//                                         print(statusController.text);
//                                       },
//                                       child: Container(
//                                           height: mq.size.width * 0.26,
//                                           width: mq.size.width * 0.26,
//                                         decoration: BoxDecoration(color: Colors.white60
//                                           ,
//                                           borderRadius: BorderRadius.circular(100), // Set the border radius
//                                           border: Border.all(
//                                             color: Colors.transparent, // Set the border color
//                                             width: 2, // Set the border thickness
//                                           ),
//                                         ),
//                                         child:
//
//                                           Center(child: Text("Outsider",style: GoogleFonts.bungeeSpice(fontSize: mq.size.width * 0.04,),))
//
//                                       ),
//                                     ),
//                                   ),
//
//
//                                 ],
//                               );})
//                       ),
//                     ),
//                     // Your indicator widget goes here
//
//                   )],
//               ),
//             ]
//         ));
//
//
//   }
// }
