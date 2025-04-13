import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Removed - not used


// Provides MaterialApp structure and basic theme
class TextDriver extends StatelessWidget {
  const TextDriver({super.key});
//BottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Confirmation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define a basic theme if you like
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 255, 247),
        textTheme: const TextTheme( // Define default text styles
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
          titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      // Use a more descriptive name for the screen
      home: const DeliveryConfirmationScreen(),
    );
  }
}


// Renamed from SplashScreen for clarity
class DeliveryConfirmationScreen extends StatefulWidget {
  const DeliveryConfirmationScreen({super.key});

  @override
  State<DeliveryConfirmationScreen> createState() => _DeliveryConfirmationScreenState();
}

class _DeliveryConfirmationScreenState extends State<DeliveryConfirmationScreen> {
  // Removed unused variables: _selectedIndex, _onItemTapped, name

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // Using reference dimensions for scaling can be complex.
    const double refWidth = 393; // Reference width
    const double refHeight = 852; // Reference height
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor = (widthScale < heightScale ? widthScale : heightScale);

    // --- Data ---
    String orderNumber = "4884847";
    String customer = "John Doe";
    String address = "1234 Main St, Anytown, USA 12345";
    double deliveryFee = 5.00;
    String date = "12/12/2024";
    String time = "12:00 PM";
    double tip = 3.00;
    double total = deliveryFee + tip; // Calculate total beforehand

    // Get text styles from theme for consistency
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;
    final boldBodyStyle = bodyStyle?.copyWith(fontWeight: FontWeight.bold); // Make a bold version

    return Scaffold(
      // backgroundColor is handled by MaterialApp's theme
      body: Center( // Center the content vertically and horizontally
        child: Padding( // Add some padding around the content
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically within Column
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally within Column
            children: [
              Text(
                'Delivery Confirmed!',
                style: titleStyle, // Use title style from theme
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Displaying info using individual Text widgets
              Text('Order Number: $orderNumber', style: bodyStyle, textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text('Customer: $customer', style: bodyStyle, textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text(address, style: bodyStyle, textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text('Delivery: $date , $time', style: bodyStyle, textAlign: TextAlign.center),

              SizedBox(height: 30 * scaleFactor), // Spacing before totals

              // Display fees and total more clearly
              Text('Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}', style: bodyStyle, textAlign: TextAlign.center), // Format currency
              const SizedBox(height: 5),
              Text('Tip Received: \$${tip.toStringAsFixed(2)}', style: bodyStyle, textAlign: TextAlign.center), // Format currency
              const Divider(height: 20, thickness: 1, indent: 40, endIndent: 40), // Separator with some indent
              Text('Total Paid: \$${total.toStringAsFixed(2)}', style: boldBodyStyle, textAlign: TextAlign.center), // Format currency and make bold

              const SizedBox(height: 30), // Spacing before button
              ElevatedButton(
                 onPressed: () {
                   // Add action, e.g., navigate back to home or order history
                   // Navigator.pop(context); // Example: Go back
                   print("Done button pressed"); // Placeholder action
                 },
                 style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30 * scaleFactor, vertical: 15 * scaleFactor),
                 ),
                 // Scale button text size too if desired
                 child: Text('Done', style: TextStyle(fontSize: 18 * scaleFactor)),
               )

            ], // <-- Closing bracket for children list
          ), // <-- Closing parenthesis for Column
        ), // <-- Closing parenthesis for Padding
      ), // <-- Closing parenthesis for Center
    ); // <-- Closing parenthesis for Scaffold
  } // <-- Closing brace for build method
} // <-- Closing brace for _DeliveryConfirmationScreenState class