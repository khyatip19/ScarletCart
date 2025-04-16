import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Ensure these imports point to the correct files in your project structure
import 'package:scarletcart/frontend/delivered_button.dart'; // Screen for next navigation step
import 'package:scarletcart/frontend/profile.dart'; // Screen for profile icon navigation

// --- Keep your color constants ---
const Color _themeBackgroundColor = Color(0xFFEBFDF2);
const Color _primaryTextColor = Colors.black87;
const Color _secondaryTextColor = Colors.black54;
const Color _dividerColor = Colors.black12;
const Color _appBarLineColor = Colors.black; // Keep if used elsewhere

const Color _initialButtonTextColor = Color(0xFF006400);
const Color _initialButtonBackgroundColor = Colors.white;
const Color _doneButtonBackgroundColor = Color(0xFF6CC48E);
const Color _doneButtonTextColor = Colors.white;

const Color _checkboxActiveColor = Color(0xFF6CC48E);
const Color _checkboxCheckColor = Colors.white;
const Color _checkboxBorderColor = Colors.black54;
// --- End color constants ---

// --- Placeholder for Cart Screen Navigation (If needed elsewhere) ---
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


// --- Wrapper Widget (No MaterialApp) ---
// This widget assumes it's being used within a larger app that already has a MaterialApp.
// It directly returns the screen.
class ShoppingLI extends StatelessWidget {
  const ShoppingLI({super.key});

  @override
  Widget build(BuildContext context) {
    // Just return the screen directly. It will inherit the theme
    // from the main MaterialApp and be part of the main navigation stack.
    return const ShoppingListScreen();
  }
}
// --- End Wrapper Widget ---


// --- Data Model for Shopping Items ---
class ShoppingItem {
  final String id;
  final String name;
  final String volume;
  final int quantity;
  final String price;
  bool isChecked; // Mutable state for the checkbox

  ShoppingItem({
    required this.id,
    required this.name,
    required this.volume,
    required this.quantity,
    required this.price,
    this.isChecked = false, // Default to unchecked
  });
}
// --- End Data Model ---


// --- Main Shopping List Screen Widget ---
class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

// --- State for Shopping List Screen ---
class _ShoppingListScreenState extends State<ShoppingListScreen> {
  // State variable to track if ALL items are checked
  bool _isShoppingComplete = false; // Initialize as false

  // Example cart item count (replace with actual logic if needed)
  int cartItemCount = 5;

  // The list of shopping items
  final List<ShoppingItem> _shoppingItems = List.generate(
    8, // Generate 8 sample items
    (index) => ShoppingItem(
      id: 'item_$index',
      name: 'Diet Coke #${index + 1}',
      volume: '335ml',
      quantity: 5,
      price: '10.99',
      isChecked: false, // All items start unchecked
    ),
  );

  // --- Called once when the widget is first created ---
  @override
  void initState() {
    super.initState();
    // Calculate the initial completion state (will be false)
    _checkIfShoppingIsComplete();
  }

  // --- Helper method to update the completion state ---
  void _checkIfShoppingIsComplete() {
    // Check if the list is not empty AND every item's isChecked property is true
    // Use setState to trigger a UI rebuild if the state changes
    setState(() {
      _isShoppingComplete = _shoppingItems.isNotEmpty && _shoppingItems.every((item) => item.isChecked);
    });
    // Note: .every() returns true for an empty list, hence the `isNotEmpty` check.
  }

  // --- Build the UI for the screen ---
  @override
  Widget build(BuildContext context) {
    // This screen assumes it's part of a larger app with a MaterialApp
    // providing the overall theme (ThemeData).
    return Scaffold(
      // Use the theme's background color or the constant
      backgroundColor: _themeBackgroundColor,
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 235, 253, 242), // Specific light green
         elevation: 0, // No shadow
         // Back button - only works if this screen was pushed onto a navigator
         leading: IconButton(
           icon: const Icon(
             Icons.arrow_back,
             color: Color.fromARGB(255, 23, 74, 44), // Dark green icon
           ),
           tooltip: MaterialLocalizations.of(context).backButtonTooltip,
           onPressed: () {
             // Attempt to pop the current route off the navigator stack
             if (Navigator.canPop(context)) {
               Navigator.pop(context);
             }
           },
         ),
         // Title in the AppBar
         title: const Text(
           'Shopping List', // Changed title for clarity
           style: TextStyle(
             color: Color.fromARGB(255, 23, 74, 44), // Dark green text
             fontWeight: FontWeight.w600,
             fontFamily: 'Outfit', // Example custom font
             fontSize: 22,
           ),
         ),
         centerTitle: true, // Center the title
         // Actions on the right side of the AppBar
         actions: <Widget>[
           IconButton(
             icon: const Icon(
               Icons.person_outline, // Profile Icon
               size: 28,
               color: Color.fromARGB(255, 23, 74, 44), // Match other icons
             ),
             tooltip: 'Profile',
             onPressed: () {
               print('Profile icon tapped!');
               // Navigate to the Profile Screen
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const ProfileScreen()),
               );
             },
           ),
           const SizedBox(width: 8), // Padding before edge
         ],
       ),
      // Body using CustomScrollView for mixing slivers (list, button area)
      body: CustomScrollView(
        slivers: [
          // Padding above the list
          const SliverPadding(padding: EdgeInsets.only(top: 8.0)),
          // The main list of shopping items
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // Calculate the index for the _shoppingItems list
                final itemIndex = index ~/ 2;

                // Even indices are for item tiles
                if (index.isEven) {
                  // Check bounds before accessing the list item
                  if (itemIndex < _shoppingItems.length) {
                    final item = _shoppingItems[itemIndex];
                    return _buildShoppingItemTile(context, item, itemIndex);
                  } else {
                    return const SizedBox.shrink(); // Avoid potential errors
                  }
                }
                // Odd indices are for dividers (except after the last item)
                else {
                  if (itemIndex < _shoppingItems.length - 1) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        height: 1, // Minimal space
                        thickness: 1, // Thin line
                        color: _dividerColor, // Use theme or constant color
                      ),
                    );
                  } else {
                    return const SizedBox.shrink(); // No divider after the last item
                  }
                }
              },
              // Calculate the total number of children: items + dividers between them
              childCount: _shoppingItems.isEmpty ? 0 : (_shoppingItems.length * 2 - 1),
            ),
          ),
          // Area at the bottom that stays visible, containing the button
          SliverFillRemaining(
            hasScrollBody: false, // Doesn't need to scroll itself
            child: Align(
              alignment: Alignment.bottomCenter, // Align content to the bottom
              child: _buildBottomButtonArea(context), // Build the button area
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Method to Build a Single Item Tile ---
  Widget _buildShoppingItemTile(BuildContext context, ShoppingItem item, int index) {
    // Define labels for clarity
    const String volumeLabel = 'Volume: ';
    const String quantityLabel = 'Quantity: ';
    const String priceLabelPrefix = 'Approx: \$';

    return Padding(
      // Padding around the row
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Vertically center items
        children: [
          // Expanded section for text details (takes up available space)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: _primaryTextColor, // Use constant or theme color
                  ),
                ),
                const SizedBox(height: 4.0), // Spacing
                Text(
                  '$volumeLabel${item.volume}',
                  style: const TextStyle(fontSize: 13, color: _secondaryTextColor),
                ),
                const SizedBox(height: 2.0),
                Text(
                  '$quantityLabel${item.quantity}',
                  style: const TextStyle(fontSize: 13, color: _secondaryTextColor),
                ),
              ],
            ),
          ),
          // Price text
          Text(
            '$priceLabelPrefix${item.price}',
            style: const TextStyle(
              fontSize: 14,
              color: _primaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16.0), // Spacing before checkbox
          // Checkbox
          Checkbox(
            value: item.isChecked, // Reflects the item's current state
            // Use the theme's CheckboxThemeData for styling
            // fillColor, checkColor, side properties are handled by the theme

            // *** Important: Update state on change ***
            onChanged: (bool? newValue) {
              // Use setState to rebuild the UI after state changes
              setState(() {
                // 1. Update the specific item's checked state
                _shoppingItems[index].isChecked = newValue ?? false;
                // 2. Recalculate if ALL items are now checked
                _checkIfShoppingIsComplete(); // This will call setState internally
              });
            },
            // Optional: Fine-tune visual properties if needed
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }

  // --- Helper Method to Build the Bottom Button Area ---
  Widget _buildBottomButtonArea(BuildContext context) {
    // Access the theme for default button styling if needed
    final theme = Theme.of(context);
    // Use theme's ElevatedButton style as a base
    final buttonStyle = theme.elevatedButtonTheme.style;

     return Container(
        // Padding around the button container
        padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0),
        child: SafeArea( // Ensures button isn't obscured by system UI (like home bar)
          top: false, // Only apply safe area padding to the bottom
          child: Padding(
             padding: const EdgeInsets.only(bottom: 12.0), // Extra space below button
             child: SizedBox(
               width: double.infinity, // Make button stretch full width
               child: ElevatedButton(
                 // --- Dynamic Button Styling ---
                 style: ElevatedButton.styleFrom(
                   // Background color depends on completion state
                   backgroundColor: _isShoppingComplete
                       ? _doneButtonBackgroundColor // Green when done
                       : _initialButtonBackgroundColor, // White when in progress
                   // Text/Icon color depends on completion state
                   foregroundColor: _isShoppingComplete
                       ? _doneButtonTextColor // White text when done
                       : _initialButtonTextColor, // Dark green text when in progress
                   // Adjust elevation or other properties based on state (optional)
                   elevation: _isShoppingComplete ? 2 : 1, // Slightly more shadow when active
                   // Define padding and shape (can also be part of main theme)
                   padding: const EdgeInsets.symmetric(vertical: 14.0),
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0), // Rounded corners
                   ),
                 ).merge(buttonStyle), // Merge with the base theme style

                 // --- Conditional Navigation Logic ---
                 onPressed: () {
                   // ACTION: Only proceed if shopping is complete
                   if (_isShoppingComplete) {
                     print('Proceed button tapped - Navigating');
                     // Navigate to the next screen (Delivery Progress)
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => const DeliverProgressScreen(),
                       ),
                     );
                   } else {
                     // ACTION: Show feedback if tapped prematurely
                     print('Proceed button tapped - Shopping not complete');
                     ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(
                         content: Text('Please check off all items first.'),
                         duration: Duration(seconds: 2),
                         behavior: SnackBarBehavior.floating, // Optional: Make it float
                       ),
                     );
                   }
                 },
                 // --- Dynamic Button Text ---
                 child: Text(
                   _isShoppingComplete ? 'Proceed to Delivery' : 'Shopping in Progress',
                   style: const TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w600,
                     // Font family will be inherited from theme or default
                   ),
                 ),
               ),
             ),
          ),
        ),
     );
  }
} // End of _ShoppingListScreenState class