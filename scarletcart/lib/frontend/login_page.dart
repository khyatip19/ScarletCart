import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: 
      AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: const Text(
        //   'Flutter Demo Home Page'
        // ),
      ),
      body: 
      // Container(
      //   padding: EdgeInsets.all(10))
      Container(
        width: 390,
        height: 844,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFEBFDF2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(46),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 7.50,
              top: -220,
              child: Container(
                width: 375,
                height: 44,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(width: 375, height: 30),
                    ),
                    const Positioned(
                      left: 292,
                      top: 16,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          ],
                        ),
                      ),
                    Positioned(
                      left: 298,
                      top: 8,
                      child: Container(width: 6, height: 6),
                    ),
                    Positioned(
                      left: 21,
                      top: 12,
                      child: Container(
                        width: 54,
                        height: 21,
                        padding: const EdgeInsets.only(top: 3, left: 11, right: 10, bottom: 3),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 33,
                              height: 15,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [],
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
            Positioned(
              left: 64,
              top: 202,
              child: Container(
                width: 390 - 128, // Adjust width to account for left and right padding
                padding: const EdgeInsets.only(top: 7, bottom: 6),
                child: const Row(
                  mainAxisSize: MainAxisSize.max, // Use max to fill available width
                  mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                  crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                  children: [
                     Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Color(0xFF174A2C),
                        fontSize: 52,
                        fontFamily: 'Aclonica',
                        fontWeight: FontWeight.w400,
                        height: 0.88,
                        letterSpacing: -1.04,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 55,
              top: 584,
              child: GestureDetector(
                onTap: () {
                // Navigate to the SecondPage when the "Log In" button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Container(
                  width: 280,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 10),
                  decoration: ShapeDecoration(
                  color: const Color(0xFF174A2C),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: Color(0xFFEBFDF2),
                      fontSize: 32,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}


