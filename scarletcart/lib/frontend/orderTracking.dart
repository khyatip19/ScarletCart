import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/cartPage.dart'; // Import the ShoppingCartScreen

class OrderTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double refWidth = 393; // width of iphone 16
    final double refHeight = 852; // height of iphone 16
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        (widthScale < heightScale ? widthScale : heightScale);

    return Scaffold(
      backgroundColor: const Color(0xFFF2FFF7),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 253, 242),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Track Your Order',
          style: TextStyle(
            color: const Color(0xFF1E222B),
            fontSize: 24 * scaleFactor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0 * scaleFactor),
          child: Container(
            color: const Color.fromARGB(255, 23, 74, 44),
            height: 1.0 * scaleFactor,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
              );
            },
            child: Stack(
              alignment: Alignment.center, // Added to center Stack children
              children: [
                const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2.0 * scaleFactor),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.0 * scaleFactor),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.0 * scaleFactor,
                      minHeight: 16.0 * scaleFactor,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0 * scaleFactor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16 * scaleFactor),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder( // Use LayoutBuilder to get available height
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight, // Fill available height
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16 * scaleFactor), // Horizontal padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align items to start
                    children: [
                      SizedBox(height: 30.5 * scaleFactor),
                      Center( // Center the image
                        child: Container(
                          width: 125 * scaleFactor,
                          height: 125 * scaleFactor,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                      ),
                      SizedBox(height: 30 * scaleFactor),

                      // Order Status Indicators
                      _buildStatusIndicator(context, 'Ordered September 23', scaleFactor),
                      SizedBox(height: 20 * scaleFactor),
                      _buildStatusIndicator(context, 'Obtained', scaleFactor),
                      SizedBox(height: 20 * scaleFactor),
                      _buildStatusIndicator(context, 'Delivered', scaleFactor),
                      SizedBox(height: 70 * scaleFactor),

                      // "Order Details" Section
                      Text(
                        'Order Details',
                        style: TextStyle(
                          color: const Color(0xFF1E222B),
                          fontSize: 24 * scaleFactor,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          height: 1.58,
                        ),
                      ),
                      SizedBox(height: 15 * scaleFactor),

                      // Address
                      Text(
                        'Address',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16 * scaleFactor, // Increased font size
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8 * scaleFactor),
                      Text(
                        'John Student\n4321 BPO Way\nPiscataway NJ 08854',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14 * scaleFactor, //Increased font size
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 40 * scaleFactor),

                      // "Received" Button
                      Center(
                        child: Container(
                          width: 174 * scaleFactor,
                          height: 41 * scaleFactor,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF6CC48E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Received',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16 * scaleFactor, //Increased font size
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20 * scaleFactor), // Add some bottom padding
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(BuildContext context, String text, double scaleFactor) {
    return Row(
      children: [
        Container(
          width: 30 * scaleFactor,
          height: 30 * scaleFactor,
          decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
        ),
        SizedBox(width: 10 * scaleFactor), //Spacing between circle and text
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16 * scaleFactor, //Increased the font size
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}