import 'package:flutter/material.dart';
// Removed unused services import
// Removed map imports

// Assuming these imports point to valid files in your project structure
import 'package:scarletcart/frontend/order_details_test.dart'; // Make sure this exists if used
import 'package:scarletcart/frontend/shopping_list.dart'; // Used in navigation
import 'package:scarletcart/frontend/profile.dart';

// --- Data Model (Unchanged) ---
class Request {
  final String id;
  final String storeName;
  final String deliveryLocation;
  final String distance;
  final String profit;
  final IconData icon;
  final Color iconColor;

  Request({
    required this.id,
    required this.storeName,
    required this.deliveryLocation,
    required this.distance,
    required this.profit,
    this.icon = Icons.shopping_bag_outlined, // Default icon
    this.iconColor = Colors.green, // Default color
  });
}

// --- Sample Data (Unchanged) ---
// You might want to add unique IDs if they matter later
final Request recommendedRequest = Request(
  id: 'rec_1',
  storeName: "Shop Rite (Recommended)", // Example differentiation
  deliveryLocation: "Deliver: Busch Student Center",
  distance: "Distance: 1.5 mi", // Example differentiation
  profit: "Profit: \$15",      // Example differentiation
  iconColor: Colors.orange.shade700, // Example differentiation
);

final List<Request> sampleRequests = List.generate(
  7,
  (index) => Request(
    id: 'nearby_$index',
    storeName: "Shop Rite #$index", // Make names slightly different
    deliveryLocation: "Deliver: Busch Student Center",
    distance: "Distance: ${2.1 + (index * 0.2).round()} mi", // Vary distance slightly
    profit: "Profit: \$${12 + index}", // Vary profit
  ),
  growable: false,
);
// --- End Sample Data ---

// --- Main App Widget ---
// It's generally better to have one MaterialApp at the root of your entire app (main.dart).
// If OrderConfirmationScreen is pushed onto an existing navigator, this MaterialApp isn't needed here.
// For standalone testing, it's okay.
class NearbyReqScreen extends StatelessWidget {
  const NearbyReqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Requests',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // Enable Material 3 features
        colorScheme: ColorScheme.fromSeed(
             seedColor: Colors.green, // Base color for the theme
             background: Colors.white, // Explicit background color
             surface: Colors.white,    // Default color for cards, sheets etc.
             // You can define more colors like primary, secondary, error etc.
        ),
        appBarTheme: const AppBarTheme(
           backgroundColor: Color(0xFFDCF5E6), // Light green AppBar background
           foregroundColor: Colors.black, // Color for icons and title text
           elevation: 0, // No shadow
           titleTextStyle: TextStyle( // Style for the AppBar title
             color: Colors.black,
             fontSize: 18,
             fontWeight: FontWeight.bold,
             fontFamily: 'YourAppFont', // Optional: Specify your app's font
           ),
           iconTheme: IconThemeData(
             color: Colors.black54 // Default color for AppBar icons (like back arrow)
           )
        ),
        // Define other theme properties like textTheme, cardTheme if needed
      ),
      home: const OrderConfirmationScreen(), // Start with this screen
    );
  }
}
// --- End Main App Widget ---


// --- Screen Widget ---
class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});

  @override
  State<OrderConfirmationScreen> createState() => _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {

  @override
  Widget build(BuildContext context) {
    // Get theme colors
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color sheetBackgroundColor = colorScheme.surface; // White in this theme
    final Color dragHandleColor = Colors.grey[300] ?? Colors.grey;

    return Scaffold(
      appBar: AppBar(
         // Use theme's foregroundColor for the back button by default
         leading: Navigator.canPop(context) ? IconButton(
           icon: const Icon(Icons.arrow_back),
           tooltip: MaterialLocalizations.of(context).backButtonTooltip, // Standard tooltip
           onPressed: () => Navigator.pop(context),
         ) : null, // Only show back button if possible to pop
         title: const Text("Requests"), // Uses AppBarTheme titleTextStyle
         centerTitle: false, // Align title to the left (standard)
         titleSpacing: Navigator.canPop(context) ? 0 : NavigationToolbar.kMiddleSpacing, // Adjust spacing based on leading widget presence

         // **** ADDED PROFILE ICON ACTION ****
         actions: <Widget>[
           IconButton(
             icon: const Icon(
               Icons.person_outline, // Or Icons.person_outline
               // color: Colors.black87, // Can override AppBarTheme foregroundColor if needed
               size: 28, // Optional: Adjust size
             ),
             tooltip: 'Profile', // Accessibility tooltip
             onPressed: () {
               // Action to perform when profile icon is tapped
               print('Profile icon tapped!');
               // Example: Navigate to a Profile Screen
               // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
               
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );             
             },
           ),
           const SizedBox(width: 8), // Add slight padding after the icon
         ],
         // **** END PROFILE ICON ACTION ****
      ),
      body: Stack( // Use Stack to layer the map and the sheet
        children: [
          // --- Placeholder Map Background ---
          Positioned.fill( // Fill the entire stack space
            child: Image.asset(
              'assets/google_map.webp', // Ensure this path is correct and asset is listed in pubspec.yaml
              fit: BoxFit.cover, // Cover the area, might crop
              // Provide an error widget in case the image fails to load
              errorBuilder: (context, error, stackTrace) {
                print("Error loading map image: $error"); // Log error
                return Container(
                  color: Colors.grey[200], // Placeholder color
                  child: const Center(
                      child: Icon(Icons.map_outlined, color: Colors.grey, size: 50)),
                );
              },
            ),
          ),
          // --- End Placeholder Map Background ---

          // --- Draggable Sheet ---
          DraggableScrollableSheet(
            initialChildSize: 0.28, // Start height (percentage of available space)
            minChildSize: 0.28,   // Minimum height it can be dragged down to
            maxChildSize: 0.85,   // Maximum height it can be dragged up to
            builder: (BuildContext context, ScrollController scrollController) {
              // This builder returns the scrollable content of the sheet
              return Container(
                decoration: BoxDecoration(
                  color: sheetBackgroundColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), // Rounded top corners
                  boxShadow: [ // Soft shadow for visual separation
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, -2), // Shadow above the sheet
                    ),
                  ],
                ),
                // Use a ListView for the sheet content for easy scrolling of mixed items
                child: ListView( // Changed from Column + Expanded(ListView) for simplicity here
                  controller: scrollController, // *** Attach the controller to the scrollable view ***
                  padding: EdgeInsets.only(
                     left: 15.0,
                     right: 15.0,
                     top: 5.0, // Padding above the drag handle
                     // Add bottom padding to avoid system navigation bars
                     bottom: MediaQuery.of(context).padding.bottom + 20,
                  ),
                  children: [
                    // Drag Handle indicator
                    Align( // Center the handle
                      alignment: Alignment.center,
                      child: Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.symmetric(vertical: 8.0), // Space around handle
                        decoration: BoxDecoration(
                          color: dragHandleColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    // --- Recommended Request Section (Optional) ---
                    // Uncomment if you want a separate recommended section
                    // const Text(
                    //   "Recommended Request",
                    //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    // ),
                    // const SizedBox(height: 8),
                    // _RequestRowWidget(request: recommendedRequest),
                    // const Divider(height: 20, thickness: 1),
                    // --- End Recommended Request Section ---


                    // Nearby Requests Title
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0, top: 10.0), // Adjust spacing
                      child: Text(
                        "Nearby Requests",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // --- Nearby Requests List ---
                    // Generate list items using map and spread operator (...)
                    ...sampleRequests.map((request) => GestureDetector(
                          onTap: () {
                            print("Tapped on Nearby Request: ${request.id}");
                            // Navigate to the Shopping List screen when a request is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // Using ShoppingLI wrapper which contains ShoppingListScreen
                                builder: (context) => const ShoppingLI(),
                                // Consider passing request details if ShoppingLI/ShoppingListScreen needs them:
                                // builder: (context) => ShoppingLI(requestDetails: request),
                              ),
                            );
                          },
                          // Use the reusable widget for each row
                          child: _RequestRowWidget(request: request),
                        ) // End GestureDetector
                    ).toList(), // Convert the Iterable from map to a List<Widget>
                    // --- End Nearby Requests List ---

                    // Bottom padding is handled by ListView's padding property above
                  ], // End children of ListView
                ), // End Container for sheet content
              ); // End return Container
            }, // End builder
          ), // End DraggableScrollableSheet
          // --- End Draggable Sheet ---
        ], // End children of Stack
      ), // End Stack
    ); // End Scaffold
  }
} // End of _OrderConfirmationScreenState


// --- Reusable Widget for Displaying a Single Request Row (Unchanged) ---
class _RequestRowWidget extends StatelessWidget {
  final Request request;

  const _RequestRowWidget({required this.request});

  @override
  Widget build(BuildContext context) {
    // Get text styles and colors from the theme for consistency
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      // Padding around each row
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
        children: [
          // Icon for the request type
          Icon(
            request.icon,
            color: request.iconColor, // Use color from request data
            size: 32, // Icon size
          ),
          const SizedBox(width: 15), // Space between icon and text
          // Text content, expands to fill available space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
              children: [
                // Store Name (Bold title)
                Text(
                  request.storeName,
                  style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold), // Use theme style
                  maxLines: 1, // Prevent wrapping
                  overflow: TextOverflow.ellipsis, // Indicate overflow with ...
                ),
                const SizedBox(height: 4), // Space below store name
                // Delivery Location (Smaller text)
                Text(
                  request.deliveryLocation,
                  style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant), // Use theme style (often slightly muted)
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3), // Space
                // Distance
                Text(
                  request.distance,
                   style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant), // Even smaller text
                ),
                const SizedBox(height: 3), // Space
                // Profit (Slightly bolder small text)
                Text(
                  request.profit,
                  style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600), // Make profit stand out a bit
                ),
              ],
            ),
          ),
          const SizedBox(width: 10), // Space before chevron
          // Chevron icon indicating tappability
          Padding(
            padding: const EdgeInsets.only(top: 2.0), // Align chevron nicely
            child: Icon(
              Icons.chevron_right,
              color: Colors.grey[400], // Muted color for chevron
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
// --- End Reusable Widget ---

// --- Main Function (for standalone testing if needed) ---
/*
void main() {
  // Ensures Flutter binding is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NearbyReqScreen()); // Run the app starting with NearbyReqScreen
}
*/