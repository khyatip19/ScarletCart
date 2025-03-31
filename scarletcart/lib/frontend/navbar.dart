import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});
  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Shopper',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: 'Driver',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.green,
      onTap: widget.onItemTapped,
    );
  }
}