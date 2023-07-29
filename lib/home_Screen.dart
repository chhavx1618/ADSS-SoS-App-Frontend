import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sos_adss/sign_up_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0a1119),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image(image: AssetImage('images/home_img.png')),
            SizedBox(height: 70),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                  color: Color(0xFF121a25),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 60.0),
                  // child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SoS",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 27,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        " at your fingertips",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  Text(
                    'Your Shield in the Storm: the SoS service app that insures security & relief at your fingertips',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  DotsIndicator(
                      dotsCount: 3,
                      position: 0,
                      reversed: false,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          activeSize: Size(38.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          activeColor: Color(0xFF14b79a),
                          color: Colors.grey)),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const SignUpScreen()));
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF14b79a),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
