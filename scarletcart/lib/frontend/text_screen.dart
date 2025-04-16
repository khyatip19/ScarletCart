import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Keep if needed by theme, otherwise optional


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




class TextScreen extends StatelessWidget {
  const TextScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Confirmation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 255, 247),
        // Keep your theme settings
        appBarTheme: const AppBarTheme( // Default AppBar theme (can be overridden)
          backgroundColor: Color.fromARGB(255, 242, 255, 247), // Default background
          foregroundColor: Colors.black87, // Default foreground
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
          titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
         elevatedButtonTheme: ElevatedButtonThemeData( // Add default button theme if needed
           style: ElevatedButton.styleFrom(
             backgroundColor: Colors.green, // Example color
             foregroundColor: Colors.white,
           ),
         ),
      ),
      home: const DeliveryConfirmationScreen(),
    );
  }
}




class DeliveryConfirmationScreen extends StatefulWidget {
  const DeliveryConfirmationScreen({Key? key}) : super(key: key);


  @override
  State<DeliveryConfirmationScreen> createState() => _DeliveryConfirmationScreenState();
}


class _DeliveryConfirmationScreenState extends State<DeliveryConfirmationScreen> {


  // --- ADDED: Placeholder cart item count ---
  int cartItemCount = 3; // Example value, replace with real logic
  // --- END ADDED ---


  // initState could be used to fetch initial data if needed
  @override
  void initState() {
    super.initState();
    // Fetch cart count or other data if necessary
  }


  @override
  Widget build(BuildContext context) {
    // Keep scale factor calculation
    final screenSize = MediaQuery.of(context).size;
    final double refWidth = 393;
    final double refHeight = 852;
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor = (widthScale < heightScale ? widthScale : heightScale);


    // Keep data variables
    String orderNumber = "4884847";
    String customer = "John Doe";
    String address = "1234 Main St, Anytown, USA 12345";
    double deliveryFee = 5.00;
    String date = "12/12/2024";
    String time = "12:00 PM";
    double tip = 3.00;
    double total = deliveryFee + tip;


    // Keep text styles
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;
    final boldBodyStyle = bodyStyle?.copyWith(fontWeight: FontWeight.bold);


    return Scaffold(
      // **** ADD the AppBar here ****
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
           'Homepage', // Or 'Delivery Confirmed'? Let's keep 'Homepage'
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
               // Use the cartItemCount state variable
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
                       // Use the cartItemCount state variable
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
       ),
      // **** END AppBar Addition ****


      body: Center( // Keep the existing body
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Delivery Confirmed!',
                style: titleStyle?.copyWith(fontSize: titleStyle.fontSize! * scaleFactor), // Apply scaleFactor
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),




              Text('Order Number: $orderNumber', style: bodyStyle, textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text('Customer: $customer', style: bodyStyle, textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text(address, style: bodyStyle, textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text('Delivery: $date , $time', style: bodyStyle, textAlign: TextAlign.center),


              SizedBox(height: 30 * scaleFactor),




              Text('Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}', style: bodyStyle, textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text('Tip Received: \$${tip.toStringAsFixed(2)}', style: bodyStyle, textAlign: TextAlign.center),
              const Divider(height: 20, thickness: 1, indent: 40, endIndent: 40),
              Text('Total Paid: \$${total.toStringAsFixed(2)}', style: boldBodyStyle, textAlign: TextAlign.center),


              const SizedBox(height: 30),
              ElevatedButton(
                 onPressed: () {
                   // TODO: Add navigation logic for Done button (e.g., pop or navigate home)
                   print("Done button pressed");
                   if (Navigator.canPop(context)) {
                      Navigator.pop(context); // Example action
                   }
                 },
                 style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30 * scaleFactor, vertical: 15 * scaleFactor),
                 ),
                 child: Text('Done', style: TextStyle(fontSize: 18 * scaleFactor)),
               )
            ],
          ),
        ),
      ),
    );
  }
}

