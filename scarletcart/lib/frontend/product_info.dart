import 'package:flutter/material.dart';
import 'package:scarletcart/frontend/cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

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
    int cartItemCount = 3;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 255, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 253, 242),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 23, 74, 44),
            size: 24 * scaleFactor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Product Details',
          style: TextStyle(
            fontSize: 22 * (scaleFactor),
            color: const Color.fromARGB(255, 23, 74, 44),
            fontWeight: FontWeight.w600,
            fontFamily: 'Outfit',
          ),
        ),
        actions: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(255, 23, 74, 44),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ShoppingCartScreen()), // Navigate to Page
                  );
                },
                tooltip: 'Shopping cart',
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.green,
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
        ],
        automaticallyImplyLeading: false,
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
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: const Text('Item added to cart!'),
                                duration: const Duration(
                                    seconds: 3), // How long it stays
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  onPressed: () {
                                    // Perform undo action
                                  },
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade50,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32 * scaleFactor,
                                vertical: 12 * scaleFactor),
                            textStyle: TextStyle(fontSize: 16 * scaleFactor),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8 * scaleFactor),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 32 * scaleFactor,
                                vertical: 12 * scaleFactor),
                            textStyle: TextStyle(fontSize: 16 * scaleFactor),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8 * scaleFactor),
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
