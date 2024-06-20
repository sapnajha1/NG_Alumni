import 'dart:developer';
import 'dart:io';
import 'dart:developer' as developer;
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:ng_alumni/user_form/register.dart';
import 'package:provider/provider.dart';
import '../welcomeAgain.dart';

class FivethPage extends StatefulWidget {


  const FivethPage({super.key});

  @override
  State<FivethPage> createState() => _FivethPageState();
}

class _FivethPageState extends State<FivethPage> {
  File? getImage;
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();






  //  addData(String fullname, String email) async {
  //   if (fullname.isEmpty || email.isEmpty) {
  //     developer.log("Enter required fields");
  //   } else {
  //     try {
  //       await FirebaseFirestore.instance.collection("user_details").doc(fullname).set({
  //         'Name': fullname,
  //         'Email': email,
  //       });
  //       developer.log("Data saved");
  //     } catch (e) {
  //       developer.log("Failed to save data: $e");
  //     }
  //   }
  // }

  // addData(String fullname, String email)async{
  //   if (fullname=="" && email==""){
  //     log("Enter required field");
  //   }else{
  //     FirebaseFirestore.instance.collection("user_details").doc(fullname).set({
  //       'Name': fullname,
  //       'Email':email,
  //     }).then((value) => log("Data saved"));
  //   }
  // }

  void ShowAlertBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pick Image from"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  pickimage(ImageSource.camera);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
              ),
              ListTile(
                onTap: () {
                  pickimage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.image),
                title: Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickimage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      final tempimage = File(photo.path);
      setState(() {
        getImage = tempimage;
      });
    } catch (ex) {
      developer.log(ex.toString());
    }
  }

  Future<void> uploadImage(BuildContext context) async {


    String fullname = fullnameController.text.toString();
    String email = emailController.text.toString();
    String gender = genderController.text.toString();
    String status = statusController.text.toString();
    String phone = phoneController.text.toString();



    // Debugging statements to check the values
    print("Fullname: $fullname");
    print("Email: $email");
    print("Gender: $gender");
    print("Status: $status");
    print("Phone: $phone");

    if (fullname.isEmpty || email.isEmpty || gender.isEmpty || status.isEmpty ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (getImage != null) {
      try {
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_photos')
            .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
        await ref.putFile(getImage!);
        final imageUrl = await ref.getDownloadURL();

        // Save the image URL to Firestore (optional)
        await FirebaseFirestore.instance.collection('users').add({
          'photo_url': imageUrl,
          'Name': fullname,
          'Email': email,
          // 'Gender' : gender,
          'Status': status,
          'Phone' : phone,

          'timestamp': FieldValue.serverTimestamp(),

        });

        // Clear the text fields
        fullnameController.clear();
        emailController.clear();
        genderController.clear();
        statusController.clear();
        phoneController.clear();

        // Clear the selected image
        setState(() {
          getImage = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Your details are submitted successfully!')),
        );

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload image: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image')),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(3, -0.3),
            child: Container(
              height: mq.size.width * 0.8,
              width: mq.size.width * 0.8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-3, -0.3),
            child: Container(
              height: mq.size.width * 0.8,
              width: mq.size.width * 0.8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF673AB7),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: mq.size.width * 0.8,
              width: mq.size.width,
              decoration: const BoxDecoration(
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

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets1/purpleBird2.json',
                      height: mq.size.height * 0.15,
                      width: mq.size.height * 0.15,
                    ),
                  ),
                  SizedBox(height: mq.size.height * 0.03),

                  Consumer<RegisterForm>(builder: (context, value, child) {
                    return Center(
                      child: InkWell(
                        onTap: () {
                          ShowAlertBox();
                        },
                        child: getImage != null
                            ? CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(getImage!),
                        )
                            : CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person_add_alt_1,
                            size: 40,
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: mq.size.height * 0.02),



                  Consumer<RegisterForm>(builder: (context, value, child){
                    return Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      value.uiWidget(fullnameController, hintText: 'Enter your full Name ', height: mq.size.height * 0.060),
                      
                      SizedBox(height: mq.size.height * 0.02, ),

                      value.uiWidget(emailController, hintText: 'Enter your Email address ', height: mq.size.height * 0.060),
                      SizedBox(height: mq.size.height * 0.02),



                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          GestureDetector(
                            onTap: (){
                              genderController.text = 'Female';
                              print(genderController.text);
                            },
                            child: Stack(
                              children: [
                                Center(
                                  child: Lottie.asset('assets1/man.json',width: mq.size.width * 0.20,
                                    height: mq.size.width * 0.20,),
                                )
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              genderController.text = 'Male';
                              print(genderController.text);
                            },
                            child: Stack(
                              children: [
                                Center(
                                  child: Lottie.asset('assets1/women.json',width: mq.size.width * 0.23,
                                    height: mq.size.width * 0.23,),
                                ),

                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              genderController.text = 'Other';
                              print(genderController.text);
                            },
                            child: Container(
                              height: mq.size.width * 0.13,
                              width: mq.size.width * 0.13,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),color: Colors.white24,
                                // Set the border radius
                                border: Border.all(
                                  color: Colors.transparent, // Set the border color
                                  width: 2, // Set the border thickness
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Lottie.asset('assets1/others.json',width: mq.size.width * 0.25,
                                      height: mq.size.width * 0.25,),
                                  )
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                      SizedBox(height: mq.size.height * 0.02),
                      value.uiWidget(phoneController, hintText: 'phone number ', height: mq.size.height * 0.060),

                      SizedBox(height: mq.size.height * 0.02),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [

                          GestureDetector(
                            onTap: (){
                              statusController.text = 'Student';
                              value.updateSelectedOption('Student');
                              print(statusController.text);

                            },
                            child: Container(
                                height: mq.size.width * 0.12,
                                width: mq.size.width * 0.28,
                                decoration: BoxDecoration(color: Colors.white60,
                                  borderRadius: BorderRadius.circular(60), // Set the border radius
                                  border: Border.all(
                                    color: Colors.transparent, // Set the border color
                                    width: 2, // Set the border thickness
                                  ),
                                ),
                                child:
                                Center(child: Text("Student",style: GoogleFonts.bungeeSpice(fontSize: mq.size.width * 0.04,),))

                            ),
                          ),

                          // SizedBox(width: mq.size.width * 0.1),

                          GestureDetector(
                            onTap: (){
                              statusController.text = 'Alumni';
                              value.updateSelectedOption('Alumni');
                              print(statusController.text);

                            },
                            child: Container(
                                height: mq.size.width * 0.12,
                                width: mq.size.width * 0.28,
                                decoration: BoxDecoration(color: Colors.white60,
                                  borderRadius: BorderRadius.circular(60), // Set the border radius
                                  border: Border.all(
                                    color: Colors.transparent, // Set the border color
                                    width: 2, // Set the border thickness
                                  ),
                                ),
                                child:
                                Center(child: Text("Alumni",style: GoogleFonts.bungeeSpice(fontSize: mq.size.width * 0.04,),))

                            ),
                          ),

                          // SizedBox(width: mq.size.width * 0.1),

                          GestureDetector(
                            onTap: (){
                              statusController.text = 'Outsider';
                              value.updateSelectedOption('Outsider');
                              print(statusController.text);

                            },
                            child: Container(
                                height: mq.size.width * 0.12,
                                width: mq.size.width * 0.28,
                                decoration: BoxDecoration(color: Colors.white60,
                                  borderRadius: BorderRadius.circular(60), // Set the border radius
                                  border: Border.all(
                                    color: Colors.transparent, // Set the border color
                                    width: 2, // Set the border thickness
                                  ),
                                ),
                                child:
                                Center(child: Text("Outsider",style: GoogleFonts.bungeeSpice(fontSize: mq.size.width * 0.04,),))

                            ),
                          ),

                        ],
                      ),




                    ],);
                  }),

                  SizedBox(height: mq.size.height * 0.05),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<RegisterForm>(builder: (context, value, child) {
                        return Center(
                          child: value.uiButton(
                            context,
                                () async {
                              await uploadImage(context);
                              // await fullnameController;
                              // await statusController;
                              // await phoneController;
                              // await emailController;
                              // await genderController;

                              // await addData(fullnameController.text, emailController.text);
                            },
                            buttonWidth: mq.size.width * 0.1,
                            buttonHeight: mq.size.height * 0.2,
                            buttonText: 'Submit Details',
                            buttonColor: Color(0xFF673AB7),
                            textStyle: GoogleFonts.pacifico(
                              fontSize: mq.size.width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),



                  // SizedBox(height: mq.size.height * 0.02),
                  Consumer<RegisterForm>(builder: (context, value, child) {
                    return Center(
                      child: value.uiButton(
                        context,(){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeAgain(),
                          ),
                        );
                  },
                        buttonWidth: mq.size.width * 0.1,
                        buttonHeight: mq.size.height * 0.2,
                        buttonText: 'Finish',
                        buttonColor: Color(0xFF673AB7),
                        textStyle: GoogleFonts.pacifico(
                          fontSize: mq.size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }) ],
                ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
