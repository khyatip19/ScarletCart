import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scarletcart/frontend/shopping_list.dart';


// --- Keep your color constants ---
const Color _odThemeBackgroundColor = Color(0xFFEBFDF2);
const Color _odPrimaryTextColor = Color(0xFF004D40);
const Color _odSecondaryTextColor = Colors.black87;
const Color _odHeadingTextColor = Color(0xFF00695C);
const Color _odAppBarLineColor = Color(0xFFB2DFDB); // Keep this if needed elsewhere


const Color _odProceedButtonColor = Color(0xFF6CC48E);
const Color _odProceedButtonTextColor = Colors.white;
const Color _odBackButtonBorderColor = Color(0xFF6CC48E);
const Color _odBackButtonTextColor = Color(0xFF00695C);
const Color _odBackButtonBackgroundColor = Colors.white;
// --- End color constants ---


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




class Orderconfirm extends StatelessWidget {
  const Orderconfirm({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Demo', // Changed title for clarity


      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: _odThemeBackgroundColor,
        // Keep your theme settings
        appBarTheme: const AppBarTheme(
          backgroundColor: _odThemeBackgroundColor, // Default background
          foregroundColor: _odPrimaryTextColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: _odPrimaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),


        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _odProceedButtonColor,
            foregroundColor: _odProceedButtonTextColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 1,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
           style: OutlinedButton.styleFrom(
             foregroundColor: _odBackButtonTextColor,
             backgroundColor: _odBackButtonBackgroundColor,
             side: const BorderSide(color: _odBackButtonBorderColor, width: 1.5),
             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
             textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
           ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),


      home: const OrderDetailsScreen(),
    );
  }
}




class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});


  // Keep your _buildDetailText helper method
  Widget _buildDetailText(String text, {bool isHeading = false, double bottomSpacing = 8.0}) {
     return Padding(
       padding: EdgeInsets.only(bottom: bottomSpacing),
       child: Text(
          text,
          style: TextStyle(
            fontSize: isHeading ? 15 : 14,
            fontWeight: isHeading ? FontWeight.w600 : FontWeight.normal,
            color: isHeading ? _odHeadingTextColor : _odSecondaryTextColor,
          ),
       ),
     );
  }


  @override
  Widget build(BuildContext context) {


    // Keep your data variables
    String ordernumber = "4884847";
    String customer = "Ben Thomas";
    String address = "604 Bartholomew Rd, Piscataway, NJ 08854";
    String deliveryDate = "October 22, 2025";
    String deliveryTime = "6:15 PM";
    String profit = "\$10.00";


    // --- ADDED: Placeholder Cart Item Count (needed for AppBar logic) ---
    // In a StatelessWidget, this would typically be passed via constructor
    // or fetched from a state management solution. Using a fixed value for now.
    const int cartItemCount = 2; // Example value
    // --- END ADDED ---




    return Scaffold(
      // **** REPLACE the old AppBar ****
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 235, 253, 242), // Specific background from custom AppBar
         elevation: 0,
         // Keep the back button (or adjust as needed)
         leading: IconButton(
           icon: const Icon(
             Icons.arrow_back,
             color: Color.fromARGB(255, 23, 74, 44), // Color from custom AppBar
             // size: 24, // Fixed size
           ),
           onPressed: () {
             if (Navigator.canPop(context)) {
               Navigator.pop(context);
             }
           },
         ),
         title: const Text( // Using style from custom AppBar
           'Homepage', // Or 'Order Details'? Let's keep 'Homepage' as requested
           style: TextStyle(
             // fontSize: 22, // Fixed size
             color: Color.fromARGB(255, 23, 74, 44), // Color from custom AppBar
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
                     child: const Text(
                       // Use the cartItemCount variable
                       cartItemCount > 9 ? '9+' : '$cartItemCount',
                       style: TextStyle(
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
           const SizedBox(width: 16), // Fixed padding from custom AppBar
         ],
         // No need for the bottom PreferredSize from the old AppBar
       ),
      // **** END AppBar Replacement ****


      body: SingleChildScrollView( // Keep the rest of the body as it was
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Center(
                 child: Text(
                   'Order #$ordernumber', // Use variable for order number
                   style: const TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w600,
                     color: _odHeadingTextColor,
                   ),
                 ),
               ),
               const SizedBox(height: 30.0),

               _buildDetailText('Order:', isHeading: true, bottomSpacing: 12),
               _buildDetailText("Order Number: $ordernumber"),
               _buildDetailText('Customer: $customer'),
               _buildDetailText(address),
               _buildDetailText('Delivery: $deliveryDate $deliveryTime'),
               const SizedBox(height: 25.0),

               _buildDetailText('Fee:', isHeading: true, bottomSpacing: 12),
               _buildDetailText('Profit: $profit'),
               const SizedBox(height: 40.0),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   OutlinedButton(
                     onPressed: () {
                        // Navigate back if possible
                        if (Navigator.canPop(context)) {
                           Navigator.pop(context);
                         }
                        print('Back button tapped');
                     },
                     child: const Text('Back'),
                   ),
                  ElevatedButton(
  onPressed: () {
    // Add navigation or action for Proceed
    print('Proceed button tapped');

    // --- CORRECTED NAVIGATION CALL ---
    Navigator.push( // You were missing this call
      context, // Pass the context from the build method
      MaterialPageRoute(
        // Navigate to the ShoppingLI screen (ensure this class is defined/imported)
        builder: (context) => const ShoppingLI(),
      ),
    ); // Make sure the parenthesis for Navigator.push is closed
    // ---------------------------------

  }, // Closing brace for onPressed
  child: const Text('Proceed'),
), // Closing parenthesis for ElevatedButton
                 ],
               ),
                const SizedBox(height: 20.0),
             ],
           ),
         ),
      ),
    );
  }
}

