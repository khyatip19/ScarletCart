import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/cart_item.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<CartItem> cartItems = [
    CartItem(name: "Bananas", price: 7.90, onRemove: (item) {}),
    CartItem(name: "Package 01", price: 7.90, onRemove: (item) {}),
    CartItem(name: "Package 02", price: 7.90, onRemove: (item) {}),
    CartItem(name: "Bananas", price: 7.90, onRemove: (item) {}),
    CartItem(name: "Package 03", price: 7.90, onRemove: (item) {}),
  ];

  @override
  void initState() {
    super.initState();
    cartItems = cartItems.map((item) => CartItem(
        name: item.name,
        price: item.price,
        onRemove: (itemToRemove) {
          setState(() {
            cartItems.remove(itemToRemove);
          });
        })).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          'Shopping Cart (#)',
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return cartItems[index];
              },
            ),
          ),
          _buildSummarySection(),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
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
          _buildSummaryRow('Subtotal', '\$35.96'),
          _buildSummaryRow('Delivery', '\$2.00'),
          _buildSummaryRow('Total', '\$37.96', isTotal: true),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              //TODO: Implement proceed to checkout functionality here
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
              color: isTotal ? Colors.black : Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.w500 : FontWeight.w400,
              color: isTotal ? Colors.black : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}