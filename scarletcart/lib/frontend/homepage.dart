import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/order_details_test.dart';
import 'package:scarletcart/frontend/shopperview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const HomePage(), // Start with HomePage
    );
  }
}

// Enum to represent the possible roles
enum Role { none, delivery, customer }

// --- HomePage converted to StatefulWidget ---
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State variable to track the selected role
  Role _selectedRole = Role.none; // Initially nothing is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                height: 136,
                width: 136,
                image: AssetImage('assets/rumad_logo_b.png'), 
                // Use the image from assets (ensure you have added it in pubspec.yaml
              ),
              const SizedBox(height: 16),
              const Text(
                'Select your role',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Card 1: Delivery Partner
              _RoleSelectionCard(
                icon: Icons.local_shipping_outlined,
                title: 'Delivery partner',
                subtitle: 'Picks up and delivers requested items from stores to students',
                // Check if this role is selected
                isSelected: _selectedRole == Role.delivery,
                onTap: () {
                  // Update state and then navigate
                  setState(() {
                    _selectedRole = Role.delivery;
                  });
                  // Navigate after selection (optional: add delay if you want to see selection first)
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const DriverOrderDetailsScreen(orderId: 'orderID_123')),
                   );
                },
              ),

              const SizedBox(height: 24),

              // Card 2: Customer
              _RoleSelectionCard(
                icon: Icons.groups_outlined,
                title: 'Customer',
                subtitle: 'Requests items they need from nearby stores',
                // Check if this role is selected
                isSelected: _selectedRole == Role.customer,
                onTap: () {
                  // Update state and then navigate
                  setState(() {
                    _selectedRole = Role.customer;
                  });
                   // Navigate after selection (optional: add delay if you want to see selection first)
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const SplashScreen()),
                   );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Role Selection Card Widget (modified) ---
class _RoleSelectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected; // Added parameter
  final VoidCallback onTap;

  // Define colors for selected and default states
  static const Color selectedBackgroundColor = Color(0xFFEBFDF2);
  static final Color selectedBorderColor = Colors.green.shade400;
  static final Color selectedIconColor = Colors.green.shade700;

  static const Color defaultBackgroundColor = Colors.white;
  static final Color defaultBorderColor = Colors.grey.shade300;
  static final Color defaultIconColor = Colors.grey.shade700;


  const _RoleSelectionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected, // Required now
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Determine colors based on selection state
    final Color currentBackgroundColor = isSelected ? selectedBackgroundColor : defaultBackgroundColor;
    final Color currentBorderColor = isSelected ? selectedBorderColor : defaultBorderColor;
    final Color currentIconColor = isSelected ? selectedIconColor : defaultIconColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20.0),
        decoration: BoxDecoration(
          // Use determined colors
          color: currentBackgroundColor,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: currentBorderColor,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: currentIconColor, // Use determined color
            ),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}