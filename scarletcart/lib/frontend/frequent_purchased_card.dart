import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/product_info.dart';

class FrequentPurchasedCard extends StatelessWidget {
  const FrequentPurchasedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393; //width of iphone 16
    const double refHeight = 852; //height of iphone 16
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        (widthScale < heightScale ? widthScale : heightScale);

    String frequentItem = 'Fresh Lemons';
    return Padding(
      // Removed Center, use Padding directly
      padding: EdgeInsets.all(16 * scaleFactor),
      child: GestureDetector( //Wrap the Container in a GestureDetector
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductDetailsPage()), // Navigate to Page
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 165 * scaleFactor,
          width: 154 * scaleFactor,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 235, 253, 242),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 23, 74, 44),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10 * scaleFactor),
            child: Column(
              children: [
                Container(
                  height: 69 * scaleFactor,
                  width: 127 * scaleFactor,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA2A2A2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 23, 74, 44),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    frequentItem,
                    style: TextStyle(
                      fontSize: 14 * scaleFactor,
                      fontFamily: 'Outfit',
                      color: const Color.fromARGB(255, 23, 74, 44),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 121 * scaleFactor,
                          height: 23 * scaleFactor,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 23 * scaleFactor,
                          width: 23 * scaleFactor,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 108, 196, 142),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.5 * scaleFactor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
      ),
    );
  }
}
