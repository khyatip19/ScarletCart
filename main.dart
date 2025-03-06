import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(235, 253, 242, 1.0)),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                    Positioned(
                      left: 292,
                      top: 16,
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            
                          ],
                        ),
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
                child: Row(
                  mainAxisSize: MainAxisSize.max, // Use max to fill available width
                  mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                  crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                  children: [
                    const Text(
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
                    MaterialPageRoute(builder: (context) => const SecondPage()),
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
            Positioned(
              left: 7.50,
              top: 1030,
              child: Container(
                width: 375,
                height: 34,
                padding: const EdgeInsets.only(
                  top: 21,
                  left: 120,
                  right: 121,
                  bottom: 8,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 134,
                      height: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 134,
                            height: 5,
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 170,
              top: 551,
              child: Text.rich(
                TextSpan(),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 196,
              top: 557,
              child: Text.rich(
                TextSpan(),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 0,
              top: -6,
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
                    Positioned(
                      left: 292,
                      top: 16,
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        
                          ],
                        ),
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
              left: 2,
              top: 816,
              child: Container(
                width: 375,
                height: 34,
                padding: const EdgeInsets.only(
                  top: 21,
                  left: 120,
                  right: 121,
                  bottom: 8,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 134,
                      height: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 134,
                            height: 5,
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 1048,
              top: 524,
              child: Container(
                width: 515,
                height: 938, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 253, 242),
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
    body: Center(
      child: Container(
        width: 352,
        height: 116,
        decoration: ShapeDecoration(
          color: Color(0xFFFBB8A1),
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
                  image: DecorationImage(
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
