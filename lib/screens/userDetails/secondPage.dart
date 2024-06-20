// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
//
// import '../../user_form/register.dart';
//
// class SecondPage extends StatefulWidget {
//   const SecondPage({super.key});
//
//   @override
//   State<SecondPage> createState() => _SecondPageState();
// }
//
// class _SecondPageState extends State<SecondPage> {
//   final TextEditingController emailController = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final mq = MediaQuery.of(context);
//     return Scaffold(
//         body:  GestureDetector(
//             onTap: () {
//               FocusScope.of(context).unfocus(); // Hide the keyboard when tapped outside the TextField
//             },
//
//             child:Stack(
//                 children:[
//                   Align(
//                       alignment: const AlignmentDirectional(3, -0.3),
//                       child: Container(
//                         height: mq.size.width*0.8,
//                         width: mq.size.width*0.8,
//                         decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.deepPurple
//                         ),
//                       )
//                   ),
//                   Align(
//                     alignment: const AlignmentDirectional(-3, -0.3),
//                     child: Container(
//                       height: mq.size.width*0.8,
//                       width: mq.size.width*0.8,
//                       decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(0xFF673AB7)
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: const AlignmentDirectional(0, -1.2),
//                     child: Container(
//                       height: mq.size.width*0.8,
//                       width: mq.size.width,
//                       decoration: const BoxDecoration(
//                           color: Color(0xFFFFAB40)
//                         // color: Color(0xFF7C1f4C)
//                       ),
//                     ),
//                   ),
//                   BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
//                     child: Container(
//                       decoration:  BoxDecoration(color: Colors.transparent),
//                     ),
//                   ),
//
//                   Column(
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.all(mq.size.width * 0.1),
//                           child: Container(
//                               // height: 500,
//                               padding: EdgeInsets.all(mq.size.width * 0.03),
//                             child:
//                               Consumer<RegisterForm>(builder: (context ,value, child){
//                                 return
//
//                                 Column(mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     // Your TextField wrapped in a method or directly placed here
//
//                                     Center(child: Lottie.asset('assets1/purpleBird2.json', height: mq.size.height * 0.15,
//                                       width: mq.size.height * 0.15,)),
//                                     SizedBox(height: mq.size.height * 0.06),
//
//                                     Text("email address",style: GoogleFonts.pacifico( fontSize: mq.size.width * 0.05,color: Color(0xFF673AB7)),),
//
//                                     SizedBox(height: mq.size.height * 0.01),
//                                     value.uiWidget(value.emailController, hintText: 'Enter your Full Name '),
//
//                                   ],
//                                 );
//                               })
//                         ),
//                       ),
//                       // Your indicator widget goes here
//
//                       )  ],
//                   ),
//                 ]
//             )));
//
//   }
// }
