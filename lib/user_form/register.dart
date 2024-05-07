// import 'dart:js';
import 'dart:io';


import 'package:google_fonts/google_fonts.dart';
import 'package:ng_alumni/screens/Alumni.dart';
import 'package:ng_alumni/screens/familyPage/familyHomePage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../screens/familyPage/UserProfile.dart';

class RegisterForm with ChangeNotifier{

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController SelectedStatusController = TextEditingController();

  List<UserProfile> userProfiles = [];
  List<UserProfile> get userProfilesList => userProfiles;



  int _selectedIndex = 0;
  int get selectedIndex  => _selectedIndex;
  File? getImage;

  String SelectedOption = '';

  void setIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  void updateSelectedOption(String option){
    SelectedOption = option;
    notifyListeners();
  }

  // void addInList(String fullNameController,String getImage ){
  //   userProfiles.add(fullNameController as UserProfile);
  //       userProfiles.add(getImage as UserProfile);
  //       notifyListeners();
  //
  // }





  BottomNavigationBar bottomNavigationBar(BuildContext context, Color backgroundColor){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundColor,
      currentIndex: selectedIndex,
      onTap: (index) {
        setIndex(index);
        switch (index){
          case 0: Navigator.push(context, MaterialPageRoute(builder: (context)=> FamilyHomePage()));
          break;
          case 1: Navigator.push(context, MaterialPageRoute(builder: (context)=> FamilyHomePage()));
          break;
          case 2: Navigator.push(context, MaterialPageRoute(builder: (context)=> FamilyHomePage()));
          break;
          case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=> FamilyHomePage()));
          break;
          case 4: Navigator.push(context, MaterialPageRoute(builder: (context)=> AlumniPage(fullnameController: '', UserAboutController: '', getImage: getImage,)));
          break;
          default:

        }
      },
      selectedIconTheme: IconThemeData(color: Colors.deepPurple), // Icon theme when selected
      unselectedIconTheme: IconThemeData(color: Colors.black), // Icon theme when unselected
      selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold), // Selected label style with Poppins font
      unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.normal), // Unselected label style with Poppins font
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            activeIcon: Icon(Icons.home), // Icon when selected
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined,),
            activeIcon: Icon(Icons.search), // Icon when selected
            label: 'Search'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined,),
            activeIcon: Icon(Icons.add_box), // Icon when selected
            label: 'Feed'
        ),
        BottomNavigationBarItem(
            icon: Image.asset('assets1/studentsNot.png', width: 25, height: 25),
            activeIcon: Image.asset('assets1/studentsColor.png', width: 25, height: 25), // Custom image icon when selected
            label: 'Students'
        ),
        BottomNavigationBarItem(
            icon: Image.asset('assets1/student.png', width: 24, height: 24), // Custom image icon
            activeIcon: Image.asset('assets1/graduation.png', width: 24, height: 24), // Custom image icon when selected
            label: 'Alumni'
        ),
      ],
    );
  }

  Widget alumniPage(fullnameController,SelectedStatusController, List<UserProfile> userProfiles ) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,

      ),
      // itemCount: userProfiles.length,
      itemCount: 10,
      itemBuilder: (context, index) {

        // UserProfile userProfile =userProfiles[index];
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    flex: 5,
                    child: Center(
                      child: CircleAvatar(
                        radius: 50,
                        // backgroundImage: userProfile.getImage != null
                        //     ? FileImage(userProfile.getImage!)as ImageProvider<Object>
                        //     : AssetImage('assets1/studentsColor.png'),
                        backgroundImage: getImage != null ? FileImage(getImage!) as ImageProvider<Object>: AssetImage('assets1/studentsColor.png'),
                        // backgroundImage: AssetImage('assets1/studentsColor.png'), // Use appropriate image asset

                      ),
                    ),
                  ),

                  // User name and about taking 20% of container height
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              // userProfile.fullName,
                              fullnameController.text,
                              style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // SizedBox(height: 0),
                          Center(
                            child: Text(
                              // 'UserAboutController.text',
                              SelectedOption,
                              style: GoogleFonts.poppins(fontSize: 10.0,color: Colors.deepPurple),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Icons row taking 10% of container height
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Add your onTap logic here
                              },
                              child: Material(
                                color: Color(0xFFFFAB40),
                                child: InkWell(
                                  onTap: () {
                                    // Add your onTap logic here
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.message),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Add your onTap logic here
                              },
                              child: Material(
                                color: Color(0xFFFFAB40),
                                child: InkWell(
                                  onTap: () {
                                    // Add your onTap logic here
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.call),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget statusWidget() {
    return Container(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
                (index) => Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                // Add your status content here, such as an image or text
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardWidget(){
    return Card(
      margin: EdgeInsets.all(0),
      child: Stack(
        children: [
          Image.asset(
            'assets1/post2.jpg',
            height: 500,
            width: 500,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 300,
            right: 6,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border,color: Colors.white,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(AssetImage('assets1/commentNot.png')),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send,color: Colors.white,),
                ),
              ],
            ),
          ),

          Positioned(
              top: 380,
              left: 5,
              child:Column(children: [

                Row(children: [
                  CircleAvatar(
                    radius: 20,
                  backgroundImage: AssetImage('assets1/studentsColor.png'),),

                  SizedBox(width: 20,),
                  GestureDetector(onTap: (){},
                  child: Text("Sapna Jha",style: GoogleFonts.pacifico(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),),
                ],),

                SizedBox(height: 15,),
                Text("Everyday is best Day..Keep it UP",style: GoogleFonts.pacifico(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15))
              ],))
        ],
      ),
    );
  }



  Widget uiContainer(double height, double weight, String lottieanimation){
    return Container(
      height: height,
      width: weight,
    );
  }

  Widget uiContainer2(double height, double weight,{IconData icon2 = Icons.account_circle}){
    return Container(
      height: height,
      width: weight,
    );
  }


  TextField uiWidget(TextEditingController controller1, {String text1='sapna jha', IconData icondata1 = Icons.person}) {
    notifyListeners();
    return TextField(
      controller: controller1,
      style: TextStyle(color: Colors.black26),
      decoration: InputDecoration(
        // hintText: "Email Id",
        hintStyle: TextStyle(fontSize: 20, color: Colors.black26),
        // prefixIcon: Icon(Icons.person, color: Colors.black26),
    border: OutlineInputBorder( // Default border (when not focused)
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.blueGrey,
              width: 3.0, // Specify default thickness here
            ),
          ),
          focusedBorder: OutlineInputBorder( // Border when focused
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xFF673AB7), // Change color if desired
              width: 3.0, // Specify focused thickness here
            ),
          ),
      ),
    );

  }

  ElevatedButton uiButton( BuildContext context, VoidCallback onPressCallback, {String buttonText= 'submit',
    double buttonHeight=50, double buttonWidth =150,TextStyle? textStyle,
    Color? buttonColor,}){
    notifyListeners();
    return ElevatedButton(
        onPressed: onPressCallback,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(buttonHeight, buttonWidth),
            backgroundColor: buttonColor
        ),

        // print('Submit button pressed');
        child: Text(buttonText,style: textStyle,)
    );

  }

  void clearControllers() {
    fullNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    notifyListeners();
  }
}