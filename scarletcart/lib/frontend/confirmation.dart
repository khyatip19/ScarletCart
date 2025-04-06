import 'package:flutter/material.dart'; // Not currently used
//  import 'textsdriver.dart';

// --- Main App Setup (Unchanged) ---

class TextDriver extends StatelessWidget {
  const TextDriver({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Tracking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Manrope',
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color(0xFFF2FFF7),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 235, 253, 242),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                color: Color(0xFF1E222B),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ))),
      home: const OrderTracking(), // Start with the tracking screen
    );
  }
}

// --- Order Tracking Screen (Focus on Button Modification) ---
class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393;
    const double refHeight = 852;
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        (widthScale < heightScale ? widthScale : heightScale);

    // --- Data to pass to the confirmation screen ---
    // (In a real app, this data would come from state or be fetched)
    String orderNumber = "4884847";
    String customer = "John Student"; // Use example name from code
    String address = "4321 BPO Way\nPiscataway NJ 08854"; // Use example address
    double deliveryfee = 5.00; // Example fee
    double tip = 3.00; // Example tip
    String date = DateTime.now().toLocal().toString().split(' ')[0]; // Get current date
    String time = TimeOfDay.now().format(context); // Get current time
    // --- End of data section ---

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'Track Your Delivery',
          style: TextStyle(
            fontSize: 24 * scaleFactor, // Using scaleFactor from context
            height: 1,
          ),
        ),
        centerTitle: false, // As per your original code
        actions: [
           // --- Your Shopping Cart Action Button ---
           // This part remains exactly as you provided it
           GestureDetector(
             onTap: () {
               Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const TextDriver()), // Make sure ShoppingCartScreen exists
               );
               print("Shopping cart tapped!"); // Placeholder if screen doesn't exist yet
             },
             child: Stack(
               alignment: Alignment.center,
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
                       '3', // Example cart count
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
           SizedBox(width: 16 * scaleFactor), // As per your original code
         ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0 * scaleFactor),
          child: Container(
            color: const Color.fromARGB(255, 23, 74, 44),
            height: 1.0 * scaleFactor,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16 * scaleFactor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.5 * scaleFactor),
                      Center( // Center the placeholder circle
                        child: Container(
                          width: 125 * scaleFactor,
                          height: 125 * scaleFactor,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD9D9D9),
                          ),
                          // You can add an icon or image here if needed
                           child: Icon(Icons.local_shipping, size: 60 * scaleFactor, color: Colors.grey[700]),
                        ),
                      ),
                      SizedBox(height: 30 * scaleFactor),

                      // Order Status Indicators (Using example state)
                      _buildStatusIndicator(context, 'Ordered September 23', scaleFactor, true),
                      SizedBox(height: 20 * scaleFactor),
                      _buildStatusIndicator(context, 'Obtained', scaleFactor, true), // Assuming obtained if delivering
                      SizedBox(height: 20 * scaleFactor),
                      _buildStatusIndicator(context, 'Delivered', scaleFactor, false), // This will be marked by the button action conceptually
                      SizedBox(height: 70 * scaleFactor),

                      Text(
                        'Order Details',
                        style: TextStyle(
                          color: const Color(0xFF1E222B),
                          fontSize: 24 * scaleFactor,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 15 * scaleFactor),

                      Text(
                        'Address',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16 * scaleFactor,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8 * scaleFactor),
                      Text(
                        address, // Display the address variable
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14 * scaleFactor,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 40 * scaleFactor),

                      // --- Delivered Button ---
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              // *** THIS IS THE MODIFIED onTap ***
                              onTap: () {
                                print("Delivered button tapped!");

                                // Navigate to the Delivery Confirmation Screen, passing data
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DeliveryConfirmationScreen(
                                      // Pass the actual data here
                                      orderNumber: orderNumber,
                                      customer: customer,
                                      address: address,
                                      deliveryFee: deliveryfee,
                                      tip: tip,
                                      date: date,
                                      time: time,
                                    ),
                                  ),
                                );
                              },
                              // *** End of modification ***
                              borderRadius: BorderRadius.circular(8),
                              child: Center(
                                child: Text(
                                  'Delivered',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16 * scaleFactor,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40 * scaleFactor),
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

  // Updated status indicator to take 'isChecked' as a parameter
  // Adjusted to match the text in your example ('Ordered...', 'Obtained')
  Widget _buildStatusIndicator(BuildContext context, String text, double scaleFactor, bool isChecked) {
    return Row(
      children: [
        Container(
          width: 30 * scaleFactor,
          height: 30 * scaleFactor,
          decoration: BoxDecoration(
              color: isChecked ? const Color(0xFF6CC48E) : const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(4)),
          child: isChecked
              ? Icon(Icons.check, color: Colors.white, size: 20 * scaleFactor)
              : null,
        ),
        SizedBox(width: 10 * scaleFactor),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16 * scaleFactor,
            fontFamily: 'Inter', // Matching font from your example
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}


// --- Delivery Confirmation Screen (Basic Version - as requested) ---
// This screen now simply displays the passed data without extra gestures/styling
class DeliveryConfirmationScreen extends StatelessWidget {
  final String orderNumber;
  final String customer;
  final String address;
  final double deliveryFee;
  final double tip;
  final String date;
  final String time;

  const DeliveryConfirmationScreen({
    super.key,
    required this.orderNumber,
    required this.customer,
    required this.address,
    required this.deliveryFee,
    required this.tip,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    double total = deliveryFee + tip; // Calculate total

    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Confirmed"),
         // Provides a back button automatically
      ),
      backgroundColor: const Color.fromARGB(255, 242, 255, 247), // Original background
      body: SafeArea(
        child: Center( // Center the content vertically and horizontally
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Basic padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
              children: [
                const Text( // Original Title
                  'Delivery Confirmed',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text('Order Number: $orderNumber'),
                const SizedBox(height: 8),
                Text('Customer: $customer'),
                const SizedBox(height: 8),
                Text(address, textAlign: TextAlign.center),
                const SizedBox(height: 8),
                Text('Delivered: $date, $time'), // Use passed date/time
                const SizedBox( height: 30),
                const Divider(), // Separator
                 const SizedBox( height: 10),
                Text('Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}'), // Use passed fee
                const SizedBox(height: 8),
                Text('Tip Received: \$${tip.toStringAsFixed(2)}'), // Use passed tip
                const SizedBox( height: 10),
                 const Divider(), // Separator
                 const SizedBox( height: 10),
                Text(
                  'Total Earned: \$${total.toStringAsFixed(2)}', // Display calculated total
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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

// --- Placeholder for ShoppingCartScreen (if needed for the action button) ---
// class ShoppingCartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Shopping Cart")),
//       body: Center(child: Text("Your Cart Items Here")),
//     );
//   }
// }