import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/order_details_test.dart';
import 'package:scarletcart/frontend/shopperview.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Color(0xFFEBFDF2),
      ),
      child: const Stack(
        children: [
          Positioned(left: 7.50, top: -220, child: TopBar()),
          Positioned(left: 7.50, top: 1030, child: BottomNavigationBarIndicator()),
          Positioned(left: 12, top: 132, child: DriverButton()),
          Positioned(left: 19, top: 464, child: ShopperButton()),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 44,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            top: 0,
            child: SizedBox(width: 375, height: 30),
          ),
          const Positioned(
            left: 292,
            top: 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterLogoContainer(width: 20, height: 14),
                SizedBox(width: 4),
                FlutterLogoContainer(width: 16, height: 14),
                SizedBox(width: 4),
                FlutterLogoContainer(width: 25, height: 14),
              ],
            ),
          ),
          const Positioned(
            left: 298,
            top: 8,
            child: SizedBox(width: 6, height: 6),
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
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(), // Removed the unnecessary Column
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarIndicator extends StatelessWidget {
  const BottomNavigationBarIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 134,
            height: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 134,
                  height: 5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DriverButton extends StatelessWidget {
  const DriverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DriverOrderDetailsScreen(orderId: 'orderID_123')),
          );
      },
      child: Container(
        width: 365.56,
        height: 276,
        padding: const EdgeInsets.only(left: 5, right: 4.56),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFF174A2C),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Driver',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.w400),
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

class ShopperButton extends StatelessWidget {
  const ShopperButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SplashScreen()),
          );
        // print('Shopper button tapped!');
      },
      child: SizedBox(
        width: 352,
        height: 276,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFFFBB8A1),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Shopper',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.w400),
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

class FlutterLogoContainer extends StatelessWidget {
  final double width;
  final double height;

  const FlutterLogoContainer({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const FlutterLogo(),
    );
  }
}