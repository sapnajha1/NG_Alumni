import 'dart:io';
import 'dart:math';
import 'dart:developer' as developer;
import 'dart:ui';

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

  ShowAlertBox(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pick Image from"),
        content: Column(mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                pickimage(ImageSource.camera);
                Navigator.pop(context);
              },
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
            ),

            ListTile(
              onTap: (){
                pickimage(ImageSource.gallery);
                Navigator.pop(context);
              },
              leading: Icon(Icons.image),
              title: Text("Gallery"),
            )
          ],
        ),
      );
    });
  }

  File? getImage;


  pickimage(ImageSource imageSource) async {
    try{
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      final tempimage = File(photo.path);
      setState(() {
        getImage = tempimage;
      });
    }catch(ex){
      developer.log(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context);
    return Scaffold(

      body:

      Stack(
        children: [

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Lottie.asset('assets1/purpleBird2.json',  height: mq.size.height * 0.15,
                width: mq.size.height * 0.15,)),
              SizedBox(height: mq.size.height * 0.05),

              // SizedBox(height: 20,),


              Center(child: Text("choose your profile photo",style: GoogleFonts.pacifico(fontSize: mq.size.width * 0.05,color: Color(0xFF673AB7)),)),
              SizedBox(height: mq.size.height * 0.05),

              Center(
                      child: InkWell(
                          onTap: (){ShowAlertBox();
                            print(getImage);},
                                  child: getImage!=null? CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(getImage!),
                                  ): CircleAvatar(radius: 60,
                                  child: Icon(Icons.person,size: 80,),)
                      ),
                    ),


              SizedBox(height: mq.size.height * 0.08),

              Consumer<RegisterForm>(builder: (context, value, child){
                return
                  Center(
                    child: value.uiButton(context, () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:(context) => WelcomeAgain()));
                    },
                      buttonWidth: mq.size.width * 0.1,
                      buttonHeight: mq.size.height * 0.2,
                      buttonText: 'Finish',
                      buttonColor: Color(0xFF673AB7),
                      textStyle: GoogleFonts.pacifico(fontSize: mq.size.width * 0.05, fontWeight: FontWeight.bold, color: Colors.white),


                    ),
                  );
              })
            ],
          ),


])
    );
  }
}
