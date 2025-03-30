import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Scaling factors based on a reference screen size (e.g., iPhone 14)
    final double refWidth = 390;
    final double refHeight = 844;

    final double widthScale = screenWidth / refWidth;
    final double heightScale = screenHeight / refHeight;
    final double scaleFactor = (widthScale < heightScale) ? widthScale : heightScale;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0, // Added to match the provided image's look
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: Color(0xFFEBFDF2),
          borderRadius: BorderRadius.all(Radius.circular(46)),
        ),
        child: Stack(
          alignment: Alignment.center, // center the items in the stack
          children: [
            Positioned(
              top: -220 * scaleFactor,
              left: 7.5 * scaleFactor,
              child: Container(
                width: 375 * scaleFactor,
                height: 44 * scaleFactor,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    // This inner stack's children were mostly empty.  They don't seem needed for the described layout.
                  ],
                ),
              ),
            ),
            Positioned(
              top: 202 * scaleFactor,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16 * scaleFactor), // Added horizontal padding
                child: Text(
                  'Welcome!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF174A2C),
                    fontSize: 52 * scaleFactor,
                    fontFamily: 'Aclonica',
                    fontWeight: FontWeight.w400,
                    height: 0.88,
                    letterSpacing: -1.04,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 584 * scaleFactor,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Container(
                  width: 280 * scaleFactor,
                  height: 60 * scaleFactor,
                  decoration: BoxDecoration(
                    color: const Color(0xFF174A2C),
                    borderRadius: BorderRadius.circular(30 * scaleFactor),
                  ),
                  child: Center( // Center the text within the button
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: const Color(0xFFEBFDF2),
                        fontSize: 32 * scaleFactor,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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