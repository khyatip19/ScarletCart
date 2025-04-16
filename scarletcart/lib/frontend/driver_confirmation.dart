import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/profile.dart';
import 'package:scarletcart/frontend/nearby_requests.dart';
// import 'package:flutter/services.dart'; // Can remove if not used directly here
// import 'textscreen.dart';

// --- Keep your placeholder ShoppingCartScreen ---
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

// --- Keep your placeholder MyAppp (or use ShoppingCartScreen) ---
class MyAppp extends StatelessWidget {
  const MyAppp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Cart Placeholder")),
      body: const Center(child: Text("Actual Shopping Cart Screen Needed")),
    );
  }
}
// --- End Placeholder ---

// **** MODIFIED Confirmation Widget ****
class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

  @override
  Widget build(BuildContext context) {
    // REMOVE the MaterialApp wrapper.
    // Just return the screen you want to display.
    // The theme should be handled by the TOP-LEVEL MaterialApp of your app.
    return const OrderTracking();
  }
}
// **** END MODIFIED Confirmation Widget ****

class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  // ... (keep all your existing state variables and build method logic) ...
  bool _isOrdered = false;
  bool _isObtained = false;
  bool _isDelivered = false;

  final String orderNumber = "4884847";
  final String customer = "John Student";
  final String address = "4321 BPO Way\nPiscataway NJ 08854";
  final double delivery_fee = 5.00;
  final double tip = 3.00;
  int cartItemCount = 3;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393;
    const double refHeight = 852;
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        (widthScale < heightScale ? widthScale : heightScale);
    String orderDate = "September 23"; // Example, ideally get from data
    String date = DateTime.now().toLocal().toString().split(' ')[0];
    String time = TimeOfDay.now().format(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 253, 242),
        elevation: 0,
        // Now this leading IconButton should work correctly!
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 23, 74, 44),
            size: 24 * scaleFactor,
          ),
          onPressed: () {
            // Navigator.canPop(context) should now be true
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              // Optional: Handle case where it *still* can't pop
              // (e.g., if this was the very first screen of the app)
              print("Cannot pop further back!");
            }
          },
        ),
        title: Text(
          'Homepage', // Consider changing title to 'Order Tracking'?
          style: TextStyle(
            fontSize: 22 * scaleFactor,
            color: const Color.fromARGB(255, 23, 74, 44),
            fontWeight: FontWeight.w600,
            fontFamily: 'Outfit',
          ),
        ),
        actions: <Widget>[
          // Keep your actions
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: const Color.fromARGB(255, 23, 74, 44),
              size: 24 * scaleFactor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          SizedBox(width: 16 * scaleFactor),
        ],
        // You can potentially REMOVE automaticallyImplyLeading: false
        // and the custom `leading` IconButton above. Flutter should
        // automatically add a working back button now if the theme supports it.
        // But keeping your explicit button is also fine.
        // automaticallyImplyLeading: false, // Remove or set to true/default
      ),
      body: SafeArea(
        // ... Keep the rest of your body content ...
        child: LayoutBuilder(
          // ... rest of body ...
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16 * scaleFactor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.5 * scaleFactor),
                      Center(
                        child: Container(
                          width: 125 * scaleFactor,
                          height: 125 * scaleFactor,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD9D9D9),
                          ),
                          child: Icon(Icons.local_shipping,
                              size: 60 * scaleFactor, color: Colors.grey[700]),
                        ),
                      ),
                      SizedBox(height: 30 * scaleFactor),

                      // GestureDetector for Ordered
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isOrdered = !_isOrdered;
                          });
                        },
                        child: _buildStatusIndicator(
                            context,
                            "Ordered: $orderDate",
                            scaleFactor,
                            _isOrdered), // Updated text
                      ),
                      SizedBox(height: 20 * scaleFactor),

                      // GestureDetector for Obtained
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObtained = !_isObtained;
                          });
                        },
                        child: _buildStatusIndicator(
                            context, 'Obtained', scaleFactor, _isObtained),
                      ),
                      SizedBox(height: 20 * scaleFactor),

                      // GestureDetector for Delivered
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isDelivered = !_isDelivered;
                          });
                        },
                        child: _buildStatusIndicator(
                            context, 'Delivered', scaleFactor, _isDelivered),
                      ),

                      SizedBox(height: 70 * scaleFactor),

                      Text(
                        'Order Details',
                        style: TextStyle(
                          color: const Color(0xFF1E222B),
                          fontSize: 24 * scaleFactor,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 15 * scaleFactor),

                      Text(
                        'Address',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16 * scaleFactor,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8 * scaleFactor),
                      Text(
                        address,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14 * scaleFactor,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 40 * scaleFactor),

                      Center(
                        // Delivered Button
                        child: Container(
                          width: 174 * scaleFactor,
                          height: 41 * scaleFactor,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF6CC48E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                print("Delivered button tapped!");
                                setState(() {
                                  _isDelivered = true;
                                }); // Mark as delivered locally

                                Navigator.push(
                                  // Navigate to confirmation
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DeliveryConfirmationScreen(
                                      orderNumber: orderNumber,
                                      customer: customer,
                                      address: address,
                                      deliveryFee: delivery_fee,
                                      tip: tip,
                                      date: date,
                                      time: time,
                                    ),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Center(
                                child: Text(
                                  'Delivered',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16 * scaleFactor,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40 * scaleFactor), // Bottom padding
                    ],
                  ),
                ),
              ),
            );
          },
        ), // end LayoutBuilder
      ), // end SafeArea
    ); // end Scaffold
  }

  // ... Keep your _buildStatusIndicator method ...
  Widget _buildStatusIndicator(
      BuildContext context, String text, double scaleFactor, bool isChecked) {
    // ... same implementation ...
    Color checkboxBorderColor = Colors.grey.shade400;
    Color checkboxFillColor = const Color(0xFF6CC48E);
    Color checkmarkColor = Colors.white;
    double checkboxSize = 30 * scaleFactor;
    double borderRadius = 4.0;
    double checkmarkSize = 20 * scaleFactor;
    double borderWidth = 1.5;

    // Use AbsorbPointer to make the indicator visual only, not interactive
    // Remove this if you want the Row itself to be tappable (use InkWell instead of GestureDetector above)
    return AbsorbPointer(
      child: Row(
        children: [
          Container(
            width: checkboxSize,
            height: checkboxSize,
            decoration: BoxDecoration(
              color: isChecked ? checkboxFillColor : Colors.transparent,
              border: isChecked
                  ? null
                  : Border.all(color: checkboxBorderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: isChecked
                ? Icon(Icons.check, color: checkmarkColor, size: checkmarkSize)
                : null,
          ),
          SizedBox(width: 10 * scaleFactor),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16 * scaleFactor,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Keep DeliveryConfirmationScreen as it is ---
// It should work correctly as it has a Scaffold and AppBar
class DeliveryConfirmationScreen extends StatelessWidget {
  // ... (existing code) ...
  final String orderNumber;
  final String customer;
  final String address;
  final double deliveryFee;
  final double tip;
  final String date;
  final String time;

  const DeliveryConfirmationScreen({
    Key? key,
    required this.orderNumber,
    required this.customer,
    required this.address,
    required this.deliveryFee,
    required this.tip,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = deliveryFee + tip;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Confirmed"),
        // Automatically gets a back button to return to OrderTracking
      ),
      backgroundColor: const Color.fromARGB(255, 242, 255, 247),
      body: SafeArea(
        /* ... existing body ... */
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Delivery Confirmed',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text('Order Number: $orderNumber'),
                const SizedBox(height: 8),
                Text('Customer: $customer'),
                const SizedBox(height: 8),
                Text(address, textAlign: TextAlign.center),
                const SizedBox(height: 8),
                Text('Delivered: $date, $time'),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),
                Text('Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}'),
                const SizedBox(height: 8),
                Text('Tip Received: \$${tip.toStringAsFixed(2)}'),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Text(
                  'Total Earned: \$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.home_outlined, // Or Icons.home for a filled look
                    // color: Colors.black, // Optional: Override theme color
                    size: 28.0, // Optional: Adjust size
                  ),
                  tooltip: 'Home', // Accessibility tooltip
                  onPressed: () {
                    // Action to navigate to the Home screen
                    print('Home icon tapped!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> NearbyReqScreen())
                    );
                    // Option 1: Pop until you reach the first route (often the home screen)
                    // MaterialPageRoute(
                    //     // Navigate to the OrderTracking screen widget directly
                    //     builder: (context) => NearbyReqScreen());

                    // Option 2: Push a new Home screen and remove everything else
                    // Useful if your home screen manages state differently
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const HomeScreen()), // Replace with your actual HomeScreen widget
                    //   (Route<dynamic> route) => false, // Remove all previous routes
                    // );

                    // Option 3: Just push if you allow multiple home instances (less common)
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
