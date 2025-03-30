import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double widthScale = screenSize.width / 393;
    final double heightScale = screenSize.height / 852;
    final double scaleFactor =
        widthScale < heightScale ? widthScale : heightScale;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 255, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 253, 242),
        elevation: 0,
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // iconTheme: const IconThemeData(color: Colors.black),  // Removed this line
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0 * scaleFactor),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2.0 * scaleFactor),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.0 * scaleFactor),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.0 * scaleFactor,
                      minHeight: 16.0 * scaleFactor,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0 * scaleFactor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0 * scaleFactor),
          child: Container(
            color: const Color.fromARGB(255, 23, 74, 44),
            height: 1.0 * scaleFactor,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0 * scaleFactor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 200 * scaleFactor,
                        height: 200 * scaleFactor,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: ColoredBox(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20 * scaleFactor),
                    Text(
                      'Fresh Lemon',
                      style: TextStyle(
                        fontSize: 24 * scaleFactor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8 * scaleFactor),
                    Text(
                      '\$5.00/KG',
                      style: TextStyle(
                        fontSize: 18 * scaleFactor,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 16 * scaleFactor),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20 * scaleFactor,
                          ),
                        SizedBox(width: 8 * scaleFactor),
                        Text(
                          '110 Reviews',
                          style: TextStyle(fontSize: 16 * scaleFactor),
                        ),
                      ],
                    ),
                    SizedBox(height: 24 * scaleFactor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade50,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 32 * scaleFactor, vertical: 12 * scaleFactor),
                            textStyle: TextStyle(fontSize: 16 * scaleFactor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8 * scaleFactor),
                            ),
                          ),
                          child: const Text('Add to Cart'),
                        ),
                        SizedBox(width: 16 * scaleFactor),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 32 * scaleFactor, vertical: 12 * scaleFactor),
                            textStyle: TextStyle(fontSize: 16 * scaleFactor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8 * scaleFactor),
                            ),
                          ),
                          child: const Text('Buy Now'),
                        ),
                      ],
                    ),
                    SizedBox(height: 32 * scaleFactor),
                    Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 20 * scaleFactor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8 * scaleFactor),
                    Text(
                      'Lemons are Good for You, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.',
                      style: TextStyle(
                        fontSize: 16 * scaleFactor,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 24 * scaleFactor),
                    ExpansionTile(
                      title: Text(
                        'Nutritional facts',
                        style: TextStyle(fontSize: 18 * scaleFactor),
                      ),
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Nutritional information goes here...',
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'Reviews',
                        style: TextStyle(fontSize: 18 * scaleFactor),
                      ),
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Reviews content goes here...',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}