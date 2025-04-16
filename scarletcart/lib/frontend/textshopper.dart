import 'package:flutter/material.dart';

class TextShopper extends StatelessWidget {
  const TextShopper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Confirmation App', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Manrope', 
          primarySwatch: Colors.green,
        
          scaffoldBackgroundColor: const Color(0xFFF0FFF4), 
          appBarTheme: const AppBarTheme(
             
              backgroundColor: Color(0xFFE6F8EB), 
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                color: Color(0xFF1E222B),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500, 
                fontSize: 20 
              ))),
      home: const OrderConfirmation(),
    );
  }
}


class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
   
    final screenSize = MediaQuery.of(context).size;
    const double refWidth = 393;
    const double refHeight = 852;
    final double widthScale = screenSize.width / refWidth;
    final double heightScale = screenSize.height / refHeight;
    final double scaleFactor =
        (widthScale < heightScale ? widthScale : heightScale);

    
    final headlineStyle = TextStyle(
      color: const Color(0xFF1E222B),
      fontSize: 24 * scaleFactor, 
      fontFamily: 'Manrope',
      fontWeight: FontWeight.bold, 
    );

     final detailLabelStyle = TextStyle(
      color: Colors.grey.shade700,
      fontSize: 14 * scaleFactor,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    );

     final detailValueStyle = TextStyle(
      color: const Color(0xFF1E222B),
      fontSize: 15 * scaleFactor,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    );

    final paymentTextStyle = TextStyle(
      color: const Color(0xFF1E222B),
      fontSize: 16 * scaleFactor,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    );

     final totalTextStyle = TextStyle(
      color: const Color(0xFF1E222B),
      fontSize: 18 * scaleFactor,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.bold, 
    );


    return Scaffold(
      appBar: AppBar(
       
        title: const Text('Confirmation'), 
        centerTitle: true, 
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0 * scaleFactor),
          child: Container(
            color: Colors.grey.shade300, 
            height: 1.0 * scaleFactor,
          ),
        ),
      ),
      body: SafeArea( 
        child: SingleChildScrollView( 
          child: Padding(
            
            padding: EdgeInsets.symmetric(
                horizontal: 20 * scaleFactor, vertical: 30 * scaleFactor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
              
                Text(
                  'Delivery Confirmed!',
                  style: headlineStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40 * scaleFactor), 

                
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                       _buildDetailItem('Order Number:', '#4884847', detailLabelStyle, detailValueStyle, scaleFactor),
                       SizedBox(height: 12 * scaleFactor),
                       _buildDetailItem('Driver: John Smith','',   detailLabelStyle, detailValueStyle, scaleFactor),
                       SizedBox(height: 12 * scaleFactor),
                       _buildDetailItem('Address:', '604 Bartholomew Rd, Piscataway, NJ 08854', detailLabelStyle, detailValueStyle, scaleFactor),
                       SizedBox(height: 12 * scaleFactor),
                       _buildDetailItem('Delivery:', 'October 22, 2025 6:15 PM', detailLabelStyle, detailValueStyle, scaleFactor),
                    ],
                  ),
                ),
                SizedBox(height: 60 * scaleFactor), 
                Text(
                  '\$10.00 Deliver Fee Sent', 
                  style: paymentTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8 * scaleFactor),
                Text(
                  '+',
                  style: paymentTextStyle.copyWith(fontSize: 20 * scaleFactor), 
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8 * scaleFactor),
                Text(
                  '\$3.00 Tip Sent',
                  style: paymentTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30 * scaleFactor),
                Text(
                  'Total: \$13.00',
                  style: totalTextStyle,
                  textAlign: TextAlign.center, 
                ),
                SizedBox(height: 40 * scaleFactor), 
              ],
            ),
          ),
        ),
      ),
    );
  }

   
   Widget _buildDetailItem(String label, String value, TextStyle labelStyle, TextStyle valueStyle, double scaleFactor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        SizedBox(height: 2 * scaleFactor), 
        Text(
          value,
          style: valueStyle,
        ),
      ],
    );
  }
}