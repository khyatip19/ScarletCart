import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/cart_item.dart';
import 'package:scarletcart/frontend/card_info.dart';

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
*/
// --- End Placeholder Screens ---


class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  // cartItemCount is needed for the badge in the AppBar actions
  int cartItemCount = 3; // Initialize with a value or fetch dynamically

  List<CartItem> cartItems = []; // Initialize empty, will be populated in initState

  @override
  void initState() {
    super.initState();
    // Initial sample data (moved creation here to avoid recreating on every build)
    List<CartItem> initialItems = [
      CartItem(name: "Bananas", price: 7.90, onRemove: (item) {}),
      CartItem(name: "Package 01", price: 7.90, onRemove: (item) {}),
      CartItem(name: "Package 02", price: 7.90, onRemove: (item) {}),
      CartItem(name: "Bananas", price: 7.90, onRemove: (item) {}),
      CartItem(name: "Package 03", price: 7.90, onRemove: (item) {}),
    ];

    // Map items to include the actual remove logic within setState
    cartItems = initialItems
        .map((item) => CartItem(
            name: item.name,
            price: item.price,
            onRemove: (itemToRemove) {
              _removeItem(itemToRemove); // Call helper function
            }))
        .toList();

    // Update cartItemCount based on initial items
    cartItemCount = cartItems.length;
  }

  // Helper function to remove item and update count
  void _removeItem(CartItem itemToRemove) {
     setState(() {
        cartItems.remove(itemToRemove);
        cartItemCount = cartItems.length; // Update count
      });
  }


  @override
  Widget build(BuildContext context) {
    // --- Define Icon Color (Optional: Use Theme if preferred) ---
    const Color iconColor = Color.fromARGB(255, 23, 74, 44);
    // --- End Icon Color ---

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text( // Update title dynamically with item count
          'Shopping Cart', // Use actual list length
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // ========== Added Actions ==========
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: iconColor, // Use defined color
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
          IconButton(
            icon: const Icon(
              Icons.list_alt,
              color: iconColor, // Use defined color
              size: 24.0, // Fixed size (removed scaleFactor)
            ),
             tooltip: 'My Orders', // Added tooltip
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
                // Icon changed to outlined to match others, keep solid if preferred
                icon: const Icon(
                  Icons.shopping_cart,
                  color: iconColor, // Use defined color
                ),
                onPressed: () {
                  // Already on cart screen - could refresh or do nothing
                  // print("Cart icon tapped (already on cart screen)");
                  // Optionally disable or provide different feedback
                  // Navigator.push( // Redundant navigation
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           const ShoppingCartScreen()),
                  // );
                },
                tooltip: 'Shopping cart',
              ),
              // Use the state variable 'cartItemCount'
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
                      // Use the state variable 'cartItemCount'
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
          const SizedBox(width: 8.0), // Add padding to the right
        ],
        // ========== End Added Actions ==========
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                // Pass the actual remove function to each CartItem instance
                // Note: This assumes CartItem accepts onRemove in its constructor
                // If CartItem itself modifies the list, the logic might differ.
                 // The mapping in initState should handle passing the correct callback.
                return cartItems[index];
              },
            ),
          ),
          // Only build summary if items exist? Optional.
          if (cartItems.isNotEmpty) _buildSummarySection(),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    // --- Calculate Totals Dynamically ---
    double subtotal = cartItems.fold(0, (sum, item) => sum + item.price);
    double deliveryFee = 2.00; // Example fee
    double total = subtotal + deliveryFee;
    // --- End Calculation ---

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEBFDF2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF174A2C)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Use calculated values
          _buildSummaryRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
          _buildSummaryRow('Delivery', '\$${deliveryFee.toStringAsFixed(2)}'),
          _buildSummaryRow('Total', '\$${total.toStringAsFixed(2)}', isTotal: true),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddCardScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color(0xFF6CC48E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Proceed To checkout',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.w500 : FontWeight.w400,
              // Adjusted color for non-total label to be less faint
              color: isTotal ? Colors.black : Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500, // Make values slightly bolder
              color: Colors.black, // Keep values black
            ),
          ),
        ],
      ),
    );
  }
}