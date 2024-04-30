import 'package:flutter/material.dart';
import 'package:ng_alumni/screens/userDetails/fivethPage.dart';
import 'package:ng_alumni/screens/userDetails/fourthPage.dart';
import 'package:ng_alumni/screens/userDetails/secondPage.dart';
import 'package:ng_alumni/screens/userDetails/thirdPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'firstPage.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: SizedBox(
              height: 800,
              child: PageView(
                controller: _controller,
                children: const[
                  FirstPage(),
                  SecondPage(),
                  ThirdPage(),
                  FourthPage(),
                  FivethPage()
                ],
              ),
            ),
          ),

          SmoothPageIndicator(
            controller: _controller, count: 5,
            effect: JumpingDotEffect(
                activeDotColor: Color(0xFF673AB7),
                dotColor: Colors.grey,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 10
            ),
          )
        ],
      ),
    );
  }
}
