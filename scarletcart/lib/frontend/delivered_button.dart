import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scarletcart/frontend/driver_confirmation.dart';
import 'package:scarletcart/frontend/profile.dart';

// --- Keep your color constants ---
const Color _dpThemeBackgroundColor = Color(0xFFF0FFF4);
const Color _dpPrimaryTextColor = Color(0xFF004D40);
const Color _dpButtonColor = Color(0xFF6CC48E);
const Color _dpButtonTextColor = Colors.white;
const Color _dpAppBarLineColor = Color(0xFFB2DFDB); // Keep if needed elsewhere
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

class Deliveredbutton extends StatelessWidget {
  const Deliveredbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Demo', // Changed title for clarity

      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: _dpThemeBackgroundColor,
        // Keep your theme settings
        appBarTheme: const AppBarTheme(
          backgroundColor: _dpThemeBackgroundColor, // Default background
          foregroundColor: _dpPrimaryTextColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: _dpPrimaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: _dpButtonColor,
              foregroundColor: _dpButtonTextColor,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: const DeliverProgressScreen(),
    );
  }
}

class DeliverProgressScreen extends StatelessWidget {
  const DeliverProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // --- ADDED: Placeholder Cart Item Count ---
    // Needed for the AppBar badge logic.
    const int cartItemCount = 1; // Example value
    // --- END ADDED ---

    return Scaffold(
      // **** REPLACE the old AppBar ****
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 235, 253, 242), // Specific background from custom AppBar
        elevation: 0,
        // Decide if this screen needs a back button
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 23, 74, 44), // Color from custom AppBar
            // size: 24, // Fixed size
          ),
          onPressed: () {
            // Navigate back if possible
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          // Using style from custom AppBar
          'Homepage', // Or 'Delivery Progress'? Let's keep 'Homepage'
          style: TextStyle(
            // fontSize: 22, // Fixed size
            color: Color.fromARGB(255, 23, 74, 44), // Color from custom AppBar
            fontWeight: FontWeight.w600,
            fontFamily: 'Outfit', // Font from custom AppBar
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Color.fromARGB(255, 23, 74, 44), // Use defined color
              size: 24.0, // Fixed size (removed scaleFactor)
            ),
             tooltip: 'Profile', // Added tooltip
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const SizedBox(width: 16), // Fixed padding from custom AppBar
        ],
        // Removed the bottom PreferredSize from the old AppBar
      ),
      // **** END AppBar Replacement ****

      body: Center(
        // Keep the existing body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Delivery in Progress...',
              style: TextStyle(
                fontSize: 18,
                color: _dpPrimaryTextColor.withOpacity(0.9),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement action for when 'Delivered?' is tapped
                Navigator.push(
                  context, // The context from where you are navigating
                  MaterialPageRoute(
                    // Use the correct screen name here
                    builder: (context) => const Confirmation(),
                  ),
                );
                print('Delivered? button tapped');
              },
              child: const Text('Delivered?'),
            ),
          ],
        ),
      ),
    );
  }
}
