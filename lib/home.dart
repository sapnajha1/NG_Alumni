// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ng_alumni/user_form/register.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final registerForm = Provider.of<RegisterForm>(context, listen: false);
//     final currentStep = 1;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Form"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             LinearProgressIndicator(
//               value: currentStep / 3, // Set the progress value
//               backgroundColor: Colors.grey,
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//             ),
//             if (currentStep == 1)
//               registerForm.uiWidget(
//                 registerForm.fullNameController,
//                 "First Name",
//                 Icons.person,
//               ),
//             if (currentStep == 2)
//               registerForm.uiWidget(
//                 registerForm.emailController,
//                 "Email",
//                 Icons.email,
//               ),
//             if (currentStep == 3)
//               registerForm.uiWidget(
//                 registerForm.phoneNumberController,
//                 "Phone Number",
//                 Icons.phone,
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 // Move to the next step
//                 // registerForm.moveToNextStep();
//               },
//               child: Text('Next Step'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:ng_alumni/user_form/register.dart';
// // import 'package:provider/provider.dart';
// //
// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   // final TextEditingController firstNameController = TextEditingController();
// //   // final TextEditingController lastNameController = TextEditingController();
// //   // final TextEditingController emailController = TextEditingController();
// //   // final TextEditingController phoneNumberController = TextEditingController();
// //   // final TextEditingController firstNam = TextEditingController();
// //   // final TextEditingController firstName = TextEditingController();
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final mq = MediaQuery.of(context).size;
// //
// //     return Scaffold(
// //
// //       appBar: AppBar(title: Text("User Form"),),
// //       body: Padding(
// //         padding: const EdgeInsets.all(15.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment:MainAxisAlignment.start,
// //           children: [
// //
// //             Consumer<RegisterForm>(builder: (context, value, child){
// //               return Column(
// //                 children: [
// //                   LinearProgressIndicator(
// //                     color: Color(0xFF673AB7),
// //                     backgroundColor: Colors.grey,
// //
// //                   )
// //
// //
// //                   // value.uiWidget(value.firstNameController, "Name", Icons.person),
// //                   // value.uiWidget(value.lastNameController, "Last Name", Icons.person),
// //                   // value.uiWidget(value.emailController, "Email", Icons.email),
// //                   // value.uiWidget(value.phoneNumberController, "Phone Number", Icons.phone),
// //                   //
// //                   // value.uiButton(context,() {
// //                   //   print('First Name: ${value.firstNameController.text}');
// //                   //   print('last Name: ${value.lastNameController.text}');
// //                   //   print('email add.: ${value.emailController.text}');
// //                   //   print('contact: ${value.phoneNumberController.text}');
// //                   //
// //                   //
// //                   // },
// //                   // ),
// //                 ],
// //               );
// //             })
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
