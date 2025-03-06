import "package:flutter/material.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 253, 242),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    body: Center(
      child: Container(
        width: 352,
        height: 116,
        decoration: ShapeDecoration(
          color: const Color(0xFFFBB8A1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 209,
              top: 25,
              child: Container(
                width: 115.56,
                height: 65,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: NetworkImage("https://weston.guide/wp-content/uploads/2020/04/Bravo-Supermarkets.jpg"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 12,
              top: 25,
              child: SizedBox(
                width: 206,
                height: 24,
                child: Text(
                  'Bravo Supermarket',
                  style: TextStyle(
                    color: Color(0xFF174A2C),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 50,
              top: 58,
              child: SizedBox(
                width: 109,
                height: 35,
                child: Text(
                  'Mon, Feb 10',
                  style: TextStyle(
                    color: Color(0xFF174A2C),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}