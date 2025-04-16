import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Ensure these imports point to the correct files in your project
import 'package:scarletcart/frontend/cart_page.dart';
import 'package:scarletcart/frontend/orders_screen.dart';

// --- Keep your color constants ---
const Color _pfThemeBackgroundColor = Color(0xFFF0FFF4); // Example: Very light green
const Color _pfPrimaryTextColor = Color(0xFF004D40); // Example: Dark Teal/Green
const Color _pfLabelTextColor = Color(0xFF00796B); // Example: Teal
const Color _pfInputUnderlineColor = Color(0xFF00796B); // Example: Teal
const Color _pfAppBarLineColor = Color(0xFFB2DFDB); // Example: Light Teal

const Color _pfInactiveButtonColor = Color(0xFFA5D6A7); // Example: Light Green
const Color _pfActiveButtonColor = Color(0xFF66BB6A); // Example: Green
const Color _pfButtonTextColor = Colors.white;

// AppBar icon color from previous examples
const Color _appBarIconColor = Color.fromARGB(255, 23, 74, 44);
const Color _appBarBackgroundColor = Color.fromARGB(255, 235, 253, 242);
// --- End color constants ---


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDriverSelected = true;

  // --- State variables for profile data ---
  String _username = '';
  String _email = '';
  String _phone = '';
  // --- End state variables ---

  int cartItemCount = 3; // Example cart count for AppBar badge

  @override
  void initState() {
    super.initState();
    // --- Assign placeholder data ---
    _username = 'Alice Wonderland'; // Example Name
    _email = 'alice.w@example.com'; // Example Email
    _phone = '(555) 123-4567'; // Example Phone
    // TODO: Fetch actual user data here (e.g., from Firebase Auth, API)
    // TODO: Fetch actual cart count if needed for profile screen badge
  }


  // --- REMOVED _buildProfileDetail HELPER FUNCTION ---


  @override
  Widget build(BuildContext context) {
    // --- Scaling Calculation (needed for AppBar actions size) ---
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393; // Reference width
    const double refHeight = 852; // Reference height
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        widthScale < heightScale ? widthScale : heightScale;

    String name = "John";
    String email = "John@gmail.com";
    String number = "1234561234";
    // --- End Scaling ---

    return Scaffold(
      backgroundColor: _pfThemeBackgroundColor, // Use theme background
      appBar: AppBar(
         backgroundColor: _appBarBackgroundColor, // Specific background
         elevation: 0,
         leading: IconButton(
           icon: const Icon(
             Icons.arrow_back,
             color: _appBarIconColor,
           ),
           tooltip: 'Back', // Added tooltip
           onPressed: () {
             if (Navigator.canPop(context)) {
               Navigator.pop(context);
             }
           },
         ),
         title: const Text(
           'Profile', // Changed title to reflect the screen
           style: TextStyle(
             color: _appBarIconColor,
             fontWeight: FontWeight.w600,
             fontFamily: 'Outfit', // Font from custom AppBar
             fontSize: 20, // Fixed size might be better for consistency
           ),
         ),
         actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person, // Use solid icon since we are on Profile
                color: _appBarIconColor,
                size: 24 * scaleFactor,
              ),
              tooltip: 'Profile',
              onPressed: () {
                 print('Profile icon tapped (already here)');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.list_alt,
                color: _appBarIconColor,
                size: 24 * scaleFactor,
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
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: _appBarIconColor,
                  ),
                  tooltip: 'Shopping cart', // Added tooltip
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ShoppingCartScreen()), // Navigate to Cart
                    );
                  },
                ),
                if (cartItemCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: _pfActiveButtonColor, // Use theme green
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
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
             SizedBox(width: 8 * scaleFactor), // Add padding
          ],
       ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Keeps buttons wide
              children: [

                // --- Profile Details Directly in Column ---

                // Username
                const Text(
                  'USERNAME',
                  style: TextStyle(
                    color: _pfLabelTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  name,
                  style: const TextStyle(
                    color: _pfPrimaryTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                Container( // Underline
                  height: 1.0,
                  color: _pfInputUnderlineColor.withOpacity(0.6),
                ),
                const SizedBox(height: 25.0), // Spacing after field

                // Email
                const Text(
                  'EMAIL ID',
                   style: TextStyle(
                    color: _pfLabelTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                   email,
                  style: const TextStyle(
                    color: _pfPrimaryTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                 Container( // Underline
                  height: 1.0,
                  color: _pfInputUnderlineColor.withOpacity(0.6),
                ),
                 const SizedBox(height: 25.0), // Spacing after field

                // Phone Number
                const Text(
                  'PHONE NUMBER',
                   style: TextStyle(
                    color: _pfLabelTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  number,
                   style: const TextStyle(
                    color: _pfPrimaryTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                 Container( // Underline
                  height: 1.0,
                  color: _pfInputUnderlineColor.withOpacity(0.6),
                ),
                const SizedBox(height: 25.0), // Spacing after field

                // --- End profile details ---


                const SizedBox(height: 15.0), // Adjusted spacing before buttons

                // --- Toggle Buttons ---
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     backgroundColor: !_isDriverSelected
                         ? _pfActiveButtonColor
                         : _pfInactiveButtonColor,
                  ).merge(Theme.of(context).elevatedButtonTheme.style), // Merge with theme
                  onPressed: () {
                    if (_isDriverSelected) {
                      setState(() {
                        _isDriverSelected = false;
                      });
                       print('Shopper selected');
                    }
                  },
                  child: const Text('Shopper'),
                ),
                const SizedBox(height: 20.0),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     backgroundColor: _isDriverSelected
                         ? _pfActiveButtonColor
                         : _pfInactiveButtonColor,
                  ).merge(Theme.of(context).elevatedButtonTheme.style), // Merge with theme
                  onPressed: () {
                     if (!_isDriverSelected) {
                      setState(() {
                        _isDriverSelected = true;
                      });
                       print('Driver selected');
                    }
                  },
                  child: const Text('Driver'),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}