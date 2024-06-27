import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import '../../authentication/editProfile.dart';

class UserProfileDetails extends StatefulWidget {
  final passuserProfile;

  const UserProfileDetails({super.key, required this.passuserProfile});

  @override
  State<UserProfileDetails> createState() => _UserProfileDetailsState();
}

class _UserProfileDetailsState extends State<UserProfileDetails> {
  // double screenWidth = MediaQuery.of(context).size.width;

  int _selectedIndex = 0;
  bool _showBottomNavBar = false;


  void _openEditProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const EditProfile()),
    );
  }


  // Future<void> loginUserWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password,);
  //     User? user = userCredential.user;
  //     print(user!.uid);
  //     print("Login successful");
  //     // Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  //   } catch (error) {
  //     print("An error occurred $error");
  //   }
  // }

  void _confirmDeleteProfile() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                  final DatabaseReference userProfileRef = FirebaseDatabase.instance.ref().child('users');
                      try{
                        await userProfileRef.child(widget.passuserProfile.userId).remove();
                        Navigator.of(context).pop();
                      }catch(e){
                        print('Error deleting profile: $e');

                      }

              print('Deleting account...');
              Navigator.of(context).pop();
            },
                child: const Text('Delete'),
            )
          ],
        ));
  }


  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showBottomNavBar = true;
    });
  }


  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context);

    return
      Scaffold(
        body:
        Padding(
          padding: EdgeInsets.fromLTRB(
            mq.size.width * 0.0,
            1.2 * kToolbarHeight,
            mq.size.width * 0.0,
            20,
          ),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.9, -0.1),
                child: Container(
                  height: mq.size.width * 0.6,
                  width: mq.size.width * 0.6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.9, -0.1),
                child: Container(
                  height: mq.size.width * 0.6,
                  width: mq.size.width * 0.6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF673AB7),
                    // color: Colors.red
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: mq.size.width * 0.4,
                  width: mq.size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFAB40),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),

              //
              Padding(
                padding: const EdgeInsets.only( left:10.0,right:10.0,top: 50.0, ),
                child: Container(height: mq.size.height,
                  decoration: const BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(20),
                          topRight:Radius.circular(20))),


                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: (){
                              showMenu(
                                  context: context,
                                  position: const RelativeRect.fromLTRB(10, 40, 0, 0),
                                  items: [
                                    PopupMenuItem(
                                        child: ListTile(
                                          leading: const Icon(Icons.edit),
                                          title: const Text('Edit Profile'),
                                          onTap: _openEditProfile,
                                        )),

                                    PopupMenuItem(
                                        child: ListTile(
                                          leading: const Icon(Icons.delete),
                                          title: const Text('Delete Profile'),
                                          onTap: _confirmDeleteProfile,
                                        ))
                                  ]);
                            }, icon: const Icon(Icons.settings)
                        ),
                      ),


                      Row(
                        children: [



                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(widget.passuserProfile!.imageUrl),
                            ),
                          ),

                          const SizedBox(width: 25,),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.passuserProfile.fullname,style: GoogleFonts.pacifico(
                                      color: Colors.deepPurple,fontSize: 25,fontWeight: FontWeight.bold),),

                              const SizedBox(height: 5,),

                          Text(widget.passuserProfile.status,style: GoogleFonts.pacifico(
                          fontSize: 15,fontWeight: FontWeight.bold))
                            ],
                          ),

                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: IconButton(
                          //       onPressed: (){
                          //         showMenu(
                          //             context: context,
                          //             position: RelativeRect.fromLTRB(0, 0, 0, 0),
                          //             items: [
                          //               PopupMenuItem(
                          //                   child: ListTile(
                          //                     leading: Icon(Icons.edit),
                          //                     title: Text('Edit Profile'),
                          //                     // onTap: _openEditProfile,
                          //                   )),
                          //
                          //               PopupMenuItem(
                          //                   child: ListTile(
                          //                     leading: Icon(Icons.delete),
                          //                     title: Text('Delete Profile'),
                          //                     // onTap: _confirmDeleteProfile,
                          //                   ))
                          //             ]);
                          //       }, icon: Icon(Icons.settings)
                          //   ),
                          // )

                        ],
                      ),

                      const Divider(thickness: 2,),

                      const SizedBox(height: 10,),
                      Text("Self-introduction",style: GoogleFonts.pacifico(
                          color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold)),

                      const SizedBox(height: 5,),
                      Text("Hello welcome in my profile i am karishma and working as a software developer at accenture",style: GoogleFonts.poppins()),

                      const SizedBox(height: 20,),

                      Text("Technology",style: GoogleFonts.pacifico(
                          color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold)),

                      const SizedBox(height: 5,),
                      Text("Python, Java",style: GoogleFonts.poppins(),),

                      const SizedBox(height: 20,),

                      Text("Experienced",style: GoogleFonts.pacifico(
                          color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold)),

                      const SizedBox(height: 5,),
                      Text("Accenture",style: GoogleFonts.poppins(),),

                      const SizedBox(height: 20,),

                      Text("Contact",style: GoogleFonts.pacifico(
                          color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold)),

                      const SizedBox(height: 5,),
                      Text(widget.passuserProfile.email,style: GoogleFonts.poppins()),
                      Text(widget.passuserProfile.phoneNumber,style: GoogleFonts.poppins()) ,

                      const SizedBox(height: 20,),

                      Text("NG joined Year",style: GoogleFonts.pacifico(
                          color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold)),

                      const SizedBox(height: 5,),
                      Text('2020',style: GoogleFonts.poppins()),
                      

                    ],
                  ),


                ),
                ),





              )

            ],
          ),),



        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets1/commentNot.png')),

            label: 'Message',),


            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets1/telephone.png')),
            label: 'Call',)
          ],

          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurple, // Hover color for selected item
          unselectedItemColor: Colors.black, // Original color for unselected items
          onTap: _onTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        ),

      );


  }
}
