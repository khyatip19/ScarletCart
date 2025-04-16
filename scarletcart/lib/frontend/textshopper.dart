import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Keep if needed by theme

// --- Placeholder for Cart Screen Navigation ---
class ShoppingCartScreen extends StatelessWidget {
 const ShoppingCartScreen({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text("Shopping Cart")),
     body: const Center(child: Text("Your Shopping Cart Items Here")),
   );
 }
}
// --- End Placeholder ---


class TextShopper extends StatelessWidget {
  const TextShopper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Confirmation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Manrope',
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color(0xFFF0FFF4),
          // Keep your theme settings
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFE6F8EB), // Default background
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black), // Default icon color
              titleTextStyle: TextStyle(
                color: Color(0xFF1E222B), // Default title color
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
                fontSize: 20
              ))),
      home: const OrderConfirmation(),
    );
  }
}


class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  // Keep your helper method
   Widget _buildDetailItem(String label, String value, TextStyle labelStyle, TextStyle valueStyle, double scaleFactor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        SizedBox(height: 2 * scaleFactor),
        if (value.isNotEmpty) // Only show value Text if it's not empty
          Text(
            value,
            style: valueStyle,
          ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {

    // Keep scale factor calculation
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393;
    const double refHeight = 852;
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        (widthScale < heightScale ? widthScale : heightScale);

    // --- ADDED: Placeholder Cart Item Count ---
    // In a StatelessWidget, this would ideally be passed via constructor
    // or fetched from a state management solution. Using a fixed value for now.
    const int cartItemCount = 4; // Example value
    // --- END ADDED ---


    // Keep text style definitions
    final headlineStyle = TextStyle(
      color: const Color(0xFF1E222B),
      fontSize: 24 * scaleFactor,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.bold,
    );
    // (Keep other text style definitions: bodyTextStyle, detailLabelStyle, etc.)
    final detailLabelStyle = TextStyle(
      color: Colors.grey.shade700,
      fontSize: 14 * scaleFactor,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    );
    final detailValueStyle = TextStyle(
      color: const Color(0xFF1E222B),
      fontSize: 15 * scaleFactor,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    );
    // **** Corrected this definition ****
    final paymentTextStyle = TextStyle(
      color: const Color(0xFF1E222B),
      fontSize: 16 * scaleFactor,
      fontFamily: 'Manrope', // Corrected comma position
      fontWeight: FontWeight.w400,
    );
    // **** End Correction ****
    final totalTextStyle = TextStyle(
      color: const Color(0xFF1E222B),
      fontSize: 18 * scaleFactor,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.bold,
    );


    return Scaffold(
      // **** AppBar Replacement ****
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 235, 253, 242), // Specific background
         elevation: 0,
         // Decide if this screen needs a back button
         leading: IconButton(
           icon: Icon(
             Icons.arrow_back,
             color: const Color.fromARGB(255, 23, 74, 44), // Color from custom AppBar
             size: 24 * scaleFactor, // Use scaleFactor
           ),
           onPressed: () {
             if (Navigator.canPop(context)) {
               Navigator.pop(context);
             }
           },
         ),
         title: Text( // Using style from custom AppBar and scaleFactor
           'Homepage', // Or 'Confirmation'? Let's keep 'Homepage'
           style: TextStyle(
             fontSize: 22 * scaleFactor, // Use scaleFactor
             color: const Color.fromARGB(255, 23, 74, 44), // Color from custom AppBar
             fontWeight: FontWeight.w600,
             fontFamily: 'Outfit', // Font from custom AppBar
           ),
         ),
         actions: <Widget>[
           Stack(
             alignment: Alignment.center,
             children: <Widget>[
               IconButton(
                 icon: const Icon(
                   Icons.shopping_cart,
                   color: Color.fromARGB(255, 23, 74, 44), // Color from custom AppBar
                 ),
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) =>
                             const ShoppingCartScreen()), // Navigate to actual/placeholder cart
                   );
                 },
                 tooltip: 'Shopping cart',
               ),
               // Use the cartItemCount variable defined above
               if (cartItemCount > 0)
                 Positioned(
                   right: 8,
                   top: 8,
                   child: Container(
                     padding: EdgeInsets.all(2 * scaleFactor), // Use scaleFactor
                     decoration: BoxDecoration(
                       color: Colors.green,
                       shape: BoxShape.circle,
                       border: Border.all(color: Colors.white, width: 1),
                     ),
                     constraints: BoxConstraints(
                       minWidth: 16 * scaleFactor, // Use scaleFactor
                       minHeight: 16 * scaleFactor, // Use scaleFactor
                     ),
                     child: Text(
                       // Use the cartItemCount variable
                       cartItemCount > 9 ? '9+' : '$cartItemCount',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 10 * scaleFactor, // Use scaleFactor
                         fontWeight: FontWeight.bold,
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ),
                 ),
             ],
           ),
           SizedBox(width: 16 * scaleFactor), // Use scaleFactor
         ],
         // Removed the bottom PreferredSize from the old AppBar
       ),
      // **** END AppBar Replacement ****

      body: SafeArea( // Keep the rest of the body as it was
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20 * scaleFactor, vertical: 30 * scaleFactor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Delivery Confirmed!',
                  style: headlineStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40 * scaleFactor),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       _buildDetailItem('Order Number:', '#4884847', detailLabelStyle, detailValueStyle, scaleFactor),
                       SizedBox(height: 12 * scaleFactor),
                       _buildDetailItem('Driver:', 'John Smith', detailLabelStyle, detailValueStyle, scaleFactor), // Pass value here
                       SizedBox(height: 12 * scaleFactor),
                       _buildDetailItem('Address:', '604 Bartholomew Rd, Piscataway, NJ 08854', detailLabelStyle, detailValueStyle, scaleFactor),
                       SizedBox(height: 12 * scaleFactor),
                       _buildDetailItem('Delivery:', 'October 22, 2025 6:15 PM', detailLabelStyle, detailValueStyle, scaleFactor),
                    ],
                  ),
                ),
                SizedBox(height: 60 * scaleFactor),
                Text(
                  '\$10.00 Deliver Fee Sent',
                  style: paymentTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8 * scaleFactor),
                Text(
                  '+',
                  style: paymentTextStyle.copyWith(fontSize: 20 * scaleFactor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8 * scaleFactor),
                Text(
                  '\$3.00 Tip Sent',
                  style: paymentTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30 * scaleFactor),
                Text(
                  'Total: \$13.00',
                  style: totalTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40 * scaleFactor),
                // Optional: Add a 'Done' button here if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}