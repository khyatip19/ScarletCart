import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/frequent_purchased_card.dart';
import 'shopper_home_dropdown.dart'; // dropdown for pickup locations
import 'package:scarletcart/frontend/order_tracking.dart'; // Import HomePage
import 'package:scarletcart/frontend/navbar.dart';
import 'package:scarletcart/frontend/cart_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _selectedIndex = 0;
  int cartItemCount = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393; //width of iphone 16
    const double refHeight = 852; //height of iphone 16
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        (widthScale < heightScale ? widthScale : heightScale);
    String name = "User";
    int cartItemCount = 3;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 255, 247),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50 * scaleFactor),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 235, 253, 242),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 23, 74, 44),
              size: 24 * scaleFactor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Homepage',
            style: TextStyle(
              fontSize: 22 * (scaleFactor),
              color: const Color.fromARGB(255, 23, 74, 44),
              fontWeight: FontWeight.w600,
              fontFamily: 'Outfit',
            ),
          ),
          actions: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 23, 74, 44),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ShoppingCartScreen()), // Navigate to Page
                    );
                  },
                  tooltip: 'Shopping cart',
                ),
                if (cartItemCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        cartItemCount > 9 ? '9+' : '$cartItemCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ],
          automaticallyImplyLeading: false,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height * (200.5 / refHeight),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 235, 253, 242),
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 23, 74, 44),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 28 * scaleFactor,
                        top: 45 * scaleFactor,
                      ),
                      child: Text(
                        "Hey, $name!",
                        style: TextStyle(
                          fontSize: 22 * (scaleFactor),
                          color: const Color.fromARGB(255, 23, 74, 44),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 95 * scaleFactor, // Adjusted top padding
                        ),
                        child: Container(
                          width: 318 * scaleFactor, // Responsive width
                          height: 40 * scaleFactor, // Responsive height
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 108, 196, 142),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color.fromARGB(255, 23, 74, 44),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 14 * scaleFactor,
                                  bottom: 3 * scaleFactor,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search a Product or Store',
                                    hintStyle: TextStyle(
                                        fontSize: 16 *
                                            scaleFactor), //Responsive hint text
                                  ),
                                  style: TextStyle(
                                      fontSize:
                                          16 * scaleFactor), //Responsive text
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 8 * scaleFactor),
                                  child: Icon(
                                    Icons.search,
                                    color:
                                        const Color.fromARGB(255, 23, 74, 44),
                                    size: 24 * scaleFactor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8 * scaleFactor,
                      left: 8 * scaleFactor,
                      child: Padding(
                        padding: EdgeInsets.all(8 * scaleFactor),
                        child: Text(
                          'Delivery To',
                          style: TextStyle(
                            color: const Color(0xFF174A2C),
                            fontSize: 14 * scaleFactor,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1 * scaleFactor,
                      right: 1 * scaleFactor,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 8 * scaleFactor,
                        ),
                        child: const DropdownButtonExample(),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 17 * scaleFactor,
                      top: 10 * scaleFactor,
                    ),
                    child: Text(
                      'Frequently Purchased',
                      style: TextStyle(
                        color: const Color(0xFF174A2C),
                        fontSize: 24 * scaleFactor,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10 * scaleFactor),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Distribute cards evenly
                          children: [
                            const Expanded(
                              // Allow cards to take available space
                              child: FrequentPurchasedCard(),
                            ),
                            SizedBox(
                                width: 10 *
                                    scaleFactor), // Add some spacing between cards
                            const Expanded(
                              child: FrequentPurchasedCard(),
                            ),
                          ],
                        ),
                        SizedBox(height: 10 * scaleFactor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Expanded(
                              child: FrequentPurchasedCard(),
                            ),
                            SizedBox(width: 10 * scaleFactor),
                            const Expanded(
                              child: FrequentPurchasedCard(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 110 * scaleFactor,
                ),
              ],
            ),
          ),
          // 2. Button area: This part
          Positioned(
            bottom: 15 * scaleFactor, // Distance from the bottom
            left: 0,
            right: 0, // This makes the container stretch across
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to the HomePage when the "Go to Cart" button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomerOrderDetailsScreen(
                            orderId: 'orderID_123')),
                  );
                },
                child: Container(
                  width: 327 * scaleFactor,
                  height: 43.16 * scaleFactor,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF6CC48E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Go to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22 * scaleFactor,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
