import 'package:flutter/material.dart';
// Import the screen you navigate to from the cart icon
import 'package:scarletcart/frontend/cart_page.dart';

// --- Added Imports for Navigation Targets ---
// Ensure these paths are correct for your project structure
import 'package:scarletcart/frontend/profile.dart'; // Assuming ProfileScreen is here
import 'package:scarletcart/frontend/orders_screen.dart'; // Assuming OrdersScreen is here
// --- End Added Imports ---

// --- Placeholder Screens (if not imported above) ---
/*
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Profile")), body: const Center(child: Text("Profile")));
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Orders")), body: const Center(child: Text("Orders List")));
  }
}

// ShoppingCartScreen should be imported from cart_page.dart
*/
// --- End Placeholder Screens ---


class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // Note: cartItemCount defined in build method for this example.
  // For real apps, manage state higher up.

  @override
  Widget build(BuildContext context) {
    // --- Scaling Factor Calculation ---
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393; // Reference width
    const double refHeight = 852; // Reference height
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        widthScale < heightScale ? widthScale : heightScale;
    // --- End Scaling ---

    // --- Cart Item Count (Local for example) ---
    int cartItemCount = 3; // Example value
    // --- End Cart Item Count ---

    // --- Icon Color ---
    const Color iconColor = Color.fromARGB(255, 23, 74, 44);
    // --- End Icon Color ---

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 255, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 253, 242),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: iconColor, // Use defined color
            size: 24 * scaleFactor, // Use scaleFactor
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Product Details',
          style: TextStyle(
            fontSize: 20 * scaleFactor, // Use scaleFactor
            color: iconColor, // Use defined color
            fontWeight: FontWeight.w400,
            fontFamily: 'Outfit',
          ),
        ),
        // ========== Added Actions ==========
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: iconColor, // Use defined color
              size: 24 * scaleFactor, // Use scaleFactor
            ),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.list_alt,
              color: iconColor, // Use defined color
              size: 24 * scaleFactor, // Use scaleFactor
            ),
            tooltip: 'My Orders',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrdersScreen()),
              );
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  // Use outlined or solid based on preference
                  Icons.shopping_cart_outlined,
                  color: iconColor, // Use defined color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ShoppingCartScreen()), // Navigate to Cart
                  );
                },
                tooltip: 'Shopping cart',
              ),
              // Use the local cartItemCount variable
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
                      // Use the local cartItemCount variable
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
          SizedBox(width: 8.0 * scaleFactor), // Add scaled padding
        ],
        // ========== End Added Actions ==========
        // automaticallyImplyLeading: false, // Keep if you explicitly handle back button
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          // --- Main Body Content (Unchanged) ---
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0 * scaleFactor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 200 * scaleFactor,
                        height: 200 * scaleFactor,
                        decoration: BoxDecoration(
                          // Use a border or placeholder image for better look
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300, // Lighter grey
                           border: Border.all(color: Colors.grey.shade400)
                          // image: DecorationImage(image: AssetImage('your_image_path'), fit: BoxFit.cover) // Example
                        ),
                        // Removed the inner ColoredBox, use Icon instead
                        child: Icon(Icons.image_outlined, size: 80 * scaleFactor, color: Colors.grey.shade500),
                      ),
                    ),
                    SizedBox(height: 20 * scaleFactor),
                    Text(
                      'Fresh Lemon', // TODO: Make this dynamic from product data
                      style: TextStyle(
                        fontSize: 24 * scaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87, // Slightly softer black
                      ),
                    ),
                    SizedBox(height: 8 * scaleFactor),
                    Text(
                      '\$5.00/KG', // TODO: Make this dynamic
                      style: TextStyle(
                        fontSize: 18 * scaleFactor,
                        color: Colors.teal.shade700, // Theme color
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16 * scaleFactor),
                    Row(
                      children: [
                        // TODO: Make star rating dynamic
                        for (int i = 0; i < 5; i++)
                          Icon(
                            i < 4 ? Icons.star : Icons.star_border, // Example dynamic stars
                            color: Colors.amber,
                            size: 20 * scaleFactor,
                          ),
                        SizedBox(width: 8 * scaleFactor),
                        Text(
                          '110 Reviews', // TODO: Make this dynamic
                          style: TextStyle(fontSize: 16 * scaleFactor, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(height: 24 * scaleFactor),
                    // --- Buttons Row ---
                    Row(
                      // Consider spaceEvenly or other distribution if needed
                      children: [
                        Expanded( // Allow buttons to take space
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Implement Add to Cart logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: const Text('Item added to cart!'),
                                  duration: const Duration(seconds: 2), // Shorter duration
                                  // Removed UNDO for simplicity, add back if needed
                                  // action: SnackBarAction(
                                  //   label: 'UNDO',
                                  //   textColor: Colors.yellow,
                                  //   onPressed: () {
                                  //     // TODO: Perform undo action
                                  //   },
                                  // ),
                                ),
                              );
                               // Update cart count (example - needs real state management)
                               setState(() {
                                 // This won't work correctly as cartItemCount is local to build
                                 // Need actual state management solution here
                               });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEBFDF2), // Lighter theme color
                              foregroundColor: Color(0xFF6CC48E), // Darker theme text
                              padding: EdgeInsets.symmetric(
                                  //horizontal: 32 * scaleFactor, // Use symmetric padding
                                  vertical: 14 * scaleFactor), // Slightly taller
                              textStyle: TextStyle(fontSize: 16 * scaleFactor, fontWeight: FontWeight.w600),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8 * scaleFactor),
                                    side: BorderSide(color: Color(0xFF6CC48E)) // Add subtle border
                              ),
                              elevation: 1,
                            ),
                            child: const Text('Add to Cart'),
                          ),
                        ),
                        SizedBox(width: 16 * scaleFactor),
                        Expanded( // Allow buttons to take space
                          child: ElevatedButton(
                            onPressed: () {
                               // TODO: Implement Buy Now logic (e.g., navigate to checkout)
                               Navigator.push(context, MaterialPageRoute(builder: (context) => const ShoppingCartScreen())); // Example navigation
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6CC48E), // Main theme color
                              foregroundColor: Color(0xFFEBFDF2),
                              padding: EdgeInsets.symmetric(
                                  //horizontal: 32 * scaleFactor,
                                  vertical: 14 * scaleFactor),
                              textStyle: TextStyle(fontSize: 16 * scaleFactor, fontWeight: FontWeight.w600),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8 * scaleFactor),
                              ),
                               elevation: 2,
                            ),
                            child: const Text('Buy Now'),
                          ),
                        ),
                      ],
                    ),
                    // --- End Buttons Row ---
                    SizedBox(height: 32 * scaleFactor),
                    Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 20 * scaleFactor,
                        fontWeight: FontWeight.w600, // Bolder
                         color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8 * scaleFactor),
                    Text(
                      // TODO: Make this dynamic
                      'Lemons are known for their high vitamin C content. Grown organically without pesticides. Perfect for drinks, cooking, and baking.',
                      style: TextStyle(
                        fontSize: 16 * scaleFactor,
                        color: Colors.grey[700], // Slightly darker grey
                         height: 1.4, // Improve line spacing
                      ),
                    ),
                    SizedBox(height: 24 * scaleFactor),
                    // --- Expansion Tiles ---
                    Theme( // Use Theme to remove default dividers if desired
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: Column(
                        children: [
                           ExpansionTile(
                            tilePadding: EdgeInsets.zero, // Remove default padding
                            title: Text(
                              'Nutritional facts',
                              style: TextStyle(fontSize: 18 * scaleFactor, fontWeight: FontWeight.w500),
                            ),
                             childrenPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Add padding inside
                             initiallyExpanded: false, // Start closed
                            children: <Widget>[
                              // TODO: Add actual nutritional info
                              Text(
                                'Serving Size: 1 Lemon (approx. 58g)\nCalories: 17\nVitamin C: 30.7mg (51% DV)\n...',
                                style: TextStyle(fontSize: 15 * scaleFactor, color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                          const Divider(height: 1), // Add custom divider
                           ExpansionTile(
                             tilePadding: EdgeInsets.zero,
                            title: Text(
                              'Reviews (110)', // Show count in title
                              style: TextStyle(fontSize: 18 * scaleFactor, fontWeight: FontWeight.w500),
                            ),
                             childrenPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            children: const <Widget>[
                              ListTile(
                                leading: CircleAvatar(child: Text("A")),
                                title: Text("Great quality lemons!"),
                                subtitle: Text("Very fresh and juicy."),
                              ),
                               ListTile(
                                leading: CircleAvatar(child: Text("B")),
                                title: Text("Good value"),
                                subtitle: Text("Happy with the purchase."),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                     // --- End Expansion Tiles ---
                      SizedBox(height: 20 * scaleFactor), // Add padding at the bottom
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}