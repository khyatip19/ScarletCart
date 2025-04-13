import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scarletcart/frontend/homepage.dart'; // Assuming this path is correct

class NLPage extends StatefulWidget {
  const NLPage({super.key});

  @override
  State<NLPage> createState() => _NLPageState();
}

class _NLPageState extends State<NLPage> {
  bool _isSigningIn = false; // State to manage loading indicator visibility

  Future<User?> signInWithGoogle() async {
    setState(() {
      _isSigningIn = true; // Show loading indicator
    });

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        setState(() => _isSigningIn = false); // Hide indicator if cancelled
        return null; // User cancelled sign-in
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // No need to hide indicator here, navigation will remove the screen

      return userCredential.user;
    } catch (e) {
      setState(() => _isSigningIn = false); // Hide indicator on error

      // Show an error message only if the widget is still mounted
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Sign-in failed. Please try again.'),
              backgroundColor: Colors.redAccent),
        );
      }
      print("Error during Google Sign-In: $e");
      return null;
    }
    // No need for finally block to hide indicator if navigation happens on success
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final Orientation orientation = MediaQuery.of(context).orientation;

    // --- Responsive Calculations (adjust factors as needed) ---

    // Font sizes - base on width, clamp for sanity
    final double titleFontSize = (screenWidth * 0.09).clamp(28.0, 50.0); // Min 28, Max 50
    final double subtitleFontSize = (screenWidth * 0.04).clamp(14.0, 20.0); // Min 14, Max 20
    final double buttonFontSize = (screenWidth * 0.04).clamp(15.0, 20.0); // Min 15, Max 20

    // Spacing - base on height
    final double space1 = screenHeight * 0.015; // Space between title and subtitle
    final double space2 = screenHeight * 0.06; // Space between subtitle and button
    final double space3 = screenHeight * 0.08; // Space below button (adjust based on orientation if needed)

    // Padding - base on width for horizontal, height for vertical in button
    final double horizontalPadding = screenWidth * 0.06; // 6% of width
    final double buttonVerticalPadding = (screenHeight * 0.018).clamp(10.0, 18.0); // dynamic vertical padding

    // Button size & elements
    final double buttonHeight = (screenHeight * 0.07).clamp(48.0, 65.0); // Min 48, Max 65
    final double buttonIconSize = (buttonHeight * 0.5).clamp(20.0, 30.0); // Icon proportional to button height
    final double buttonBorderRadius = (buttonHeight * 0.25).clamp(8.0, 16.0); // Radius proportional


    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // 1. Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/rumad-home.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Dark Semi-Transparent Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.65), // Slightly darker for better contrast potentially
                  Colors.black.withOpacity(0.35),
                  Colors.black.withOpacity(0.65),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.4, 1.0], // Adjust stops for smoother gradient
              ),
            ),
          ),

          // 3. Content Area
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // App Title
                   Text(
                    'Scarlet Cart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleFontSize, // Responsive
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  SizedBox(height: space1), // Responsive

                  // Subtitle
                   Text(
                    'From Snacks to Supplies, Got You Covered.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: subtitleFontSize, // Responsive
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  SizedBox(height: space2), // Responsive

                  // Sign in Button - Using ElevatedButton.icon
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      backgroundColor: Colors.white.withOpacity(0.95), // Slightly more opaque
                      minimumSize: Size(double.infinity, buttonHeight), // Responsive height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonBorderRadius), // Responsive radius
                      ),
                      padding: EdgeInsets.symmetric(vertical: buttonVerticalPadding), // Responsive padding
                      elevation: 4, // Add subtle shadow
                    ),
                    onPressed: _isSigningIn ? null : () async { // Disable button while signing in
                      User? user = await signInWithGoogle();
                      if (user != null && mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      }
                      // No need to set _isSigningIn = false here if navigation occurs
                    },
                    icon: Image.asset(
                      'assets/google-logo.png', // Replace with your Google logo path
                      height: buttonIconSize, // Responsive
                      width: buttonIconSize,  // Responsive
                    ),
                    label: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: buttonFontSize, // Responsive
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Show loading indicator conditionally
                  if (_isSigningIn)
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0), // Space above indicator
                      child: CircularProgressIndicator(color: Colors.white),
                    ),


                  SizedBox(height: _isSigningIn ? space3 - 20 : space3), // Adjust bottom space when indicator shows
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}