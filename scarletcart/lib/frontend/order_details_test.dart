import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateOrderStatus(String orderId, String newStatus) async {
  try {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .update({'status': newStatus});
  } catch (e) {
    print("Error updating order status: $e");
  }
}

Future<void> markOrderAsDelivered(String orderId) async {
  try {
    await FirebaseFirestore.instance.collection('orders').doc(orderId).update({
      'status': 'Delivered',  // Changed from 'Completed' to 'Delivered'
      'driverConfirmed': true,
      'deliveryCompletedTimestamp': FieldValue.serverTimestamp(),
    });
  } catch (e) {
    print("Error marking order as delivered: $e");
  }
}

class DriverOrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const DriverOrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Driver Order Details")),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .doc(orderId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
                child: Text("Error loading order data: ${snapshot.error}"));
          }

          if (!snapshot.hasData ||
              snapshot.data == null ||
              !snapshot.data!.exists) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Order not found", style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text("Looking for order ID: $orderId",
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            );
          }

          // Safely cast data
          Map<String, dynamic>? orderData;
          try {
            orderData = snapshot.data!.data() as Map<String, dynamic>;
          } catch (e) {
            return Center(child: Text("Invalid order data format: $e"));
          }

          // Get order items (handling as an array)
          List<dynamic> orderItems = orderData['orderDetails'] ?? [];
          // Updated to check for 'Delivered' status
          bool isDelivered = orderData['status'] == 'Delivered' &&
              orderData['driverConfirmed'] == true;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Order Information",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        const SizedBox(height: 8),
                        Text("Order ID: $orderId",
                            style: const TextStyle(fontSize: 16)),
                        Text("Status: ${orderData['status'] ?? 'Unknown'}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _getStatusColor(orderData['status']),
                            )),
                        const SizedBox(height: 4),
                        Text(
                            "Driver Confirmed: ${orderData['driverConfirmed'] == true ? 'Yes' : 'No'}",
                            style: const TextStyle(fontSize: 16)),
                        Text(
                            "Customer Confirmed: ${orderData['customerConfirmed'] == true ? 'Yes' : 'No'}",
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "Order Items",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                if (orderItems.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("No items in this order",
                          style: TextStyle(fontSize: 16)),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: orderItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          title: Text(orderItems[index].toString()),
                        ),
                      );
                    },
                  ),

                if (orderData['customerID'] != null) ...[
                  const SizedBox(height: 20),
                  const Text(
                    "Customer Information",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Customer ID: ${orderData['customerID']}",
                              style: const TextStyle(fontSize: 16)),
                          if (orderData['customerAddress'] != null)
                            Text("Address: ${orderData['customerAddress']}",
                                style: const TextStyle(fontSize: 16)),
                          if (orderData['customerPhone'] != null)
                            Text("Phone: ${orderData['customerPhone']}",
                                style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ],

                if (orderData['deliveryTimestamp'] != null) ...[
                  const SizedBox(height: 20),
                  const Text(
                    "Delivery Information",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Expected Delivery: ${_formatTimestamp(orderData['deliveryTimestamp'])}",
                              style: const TextStyle(fontSize: 16)),
                          if (orderData['deliveryCompletedTimestamp'] != null)
                            Text(
                                "Actual Delivery: ${_formatTimestamp(orderData['deliveryCompletedTimestamp'])}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 30),

                // Delivery confirmation button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isDelivered
                        ? null // Disable if already delivered
                        : () => _confirmDelivery(context, orderId),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDelivered ? Colors.grey : Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      isDelivered ? "Order Delivered" : "Mark as Delivered",
                      style: TextStyle(
                        fontSize: 18,
                        color: isDelivered ? Colors.black54 : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _confirmDelivery(BuildContext context, String orderId) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Confirm Delivery"),
          content: const Text(
              "Are you sure you want to mark this order as delivered?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Close confirmation dialog
                Navigator.of(dialogContext).pop();

                // Store the current scaffold context for showing snackbars later
                final scaffoldContext = context;

                // Show loading dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext loadingContext) {
                    return const AlertDialog(
                      content: Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 20),
                          Text("Updating order..."),
                        ],
                      ),
                    );
                  },
                );

                // Update the order
                markOrderAsDelivered(orderId).then((_) {
                  // Pop loading dialog if app is still running
                  if (scaffoldContext.mounted) {
                    // Find the current navigator context to pop the dialog
                    Navigator.of(scaffoldContext).pop();

                    // Show success message
                    ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Order marked as delivered successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                }).catchError((error) {
                  // Pop loading dialog if app is still running
                  if (scaffoldContext.mounted) {
                    Navigator.of(scaffoldContext).pop();

                    ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                      SnackBar(
                        content: Text("Failed to update order: $error"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                });
              },
              child:
                  const Text("Confirm", style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'delivered': // Added color for 'delivered' status
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatTimestamp(dynamic timestamp) {
    if (timestamp == null) return 'Unknown';

    try {
      if (timestamp is Timestamp) {
        final DateTime dateTime = timestamp.toDate();
        return '${dateTime.day}/${dateTime.month}/${dateTime.year} at ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
      } else {
        return timestamp.toString();
      }
    } catch (e) {
      return timestamp.toString();
    }
  }
}