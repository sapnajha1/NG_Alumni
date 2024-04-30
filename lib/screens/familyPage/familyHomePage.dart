import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ng_alumni/user_form/register.dart';
import 'package:provider/provider.dart';

class FamilyHomePage extends StatefulWidget {
  const FamilyHomePage({Key? key}) : super(key: key);

  @override
  State<FamilyHomePage> createState() => _FamilyHomePageState();
}

class _FamilyHomePageState extends State<FamilyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyan,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignme/t.spaceEvenly,
          children: [
            Text("NGfamily",style: GoogleFonts.pacifico(color: Color(0xFF673AB7),fontWeight: FontWeight.bold),),

            SizedBox(width: 160,),

            GestureDetector(
              onTap: () {
                // Handle profile icon click
                // Show profile settings, documents, etc.
              },
              child: Icon(Icons.account_circle_outlined,),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                // Handle message icon click
                // Navigate to messages screen
              },
              child: Icon(Icons.message_outlined),

            ),


          ],
        ),

      ),


      body:
      // Center(child: Text("Screen Coming Soon",style: GoogleFonts.pacifico(fontSize: 40),)),



      Column(
        children: [

          Consumer<RegisterForm>(
            builder: (context, value, child) {
              return value.statusWidget();
            },
          ),
          SizedBox(height: 5,),
          
          
          Expanded(
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                return
                    Consumer<RegisterForm>(builder: (context, value, child){
                      return value.cardWidget(
            
                      );
                    });
                //
                }),
          ),
        ],
      ),


      bottomNavigationBar: Consumer<RegisterForm>(
        builder: (context, registerForm, _) {
          return registerForm.bottomNavigationBar(context, Colors.white); // Set the background color here
        },
      ));
  }

}
