import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scarletcart/frontend/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class NLPage extends StatefulWidget {
  const NLPage({super.key});

  @override
  State<NLPage> createState() => _NLPageState();
}

class _NLPageState extends State<NLPage> {
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: 
          Text(
            "Welcome to ScarletCart, your one stop grocery pal.",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 23, 74, 44),
              fontSize: 0.05 * screenWidth,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          ),
          ),
          const SizedBox(),
          Padding(
            padding: EdgeInsets.only(bottom: screenWidth*0.2),
            child: Container(
            padding: const EdgeInsets.all(10.0),
            height: screenHeight * 0.07,
            child: SignInButtonBuilder(
              backgroundColor: const Color.fromARGB(255, 51, 216, 114),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(screenWidth*.1))),
              onPressed: () async {
                User? user = await signInWithGoogle();
                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
              text: "Sign in with Google",
              image: Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: const Image(
                    image: AssetImage(
                      'assets/google-logo.png',
                      // package: 'flutter_signin_button',
                    ),
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              textColor: Colors.black,
              // height: screenHeight*0.05,
              // width: screenWidth*0.2,
            ),
          ),
          ),
        ],
      ),
    );
  }
}
