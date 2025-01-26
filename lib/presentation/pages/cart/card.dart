import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Onam Gift box',
      'price': 1500.0,
      'quantity': 1,
      'height': 'Medium',
      'photoUrl': 'lib/assets/onam.jpg',
    },
    {
      'name': 'Onam Gift box',
      'price': 1500.0,
      'quantity': 2,
      'height': 'Medium',
      'photoUrl': 'lib/assets/onam.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double totalAmount = products.fold(
      0,
          (sum, product) => sum + (product['price'] * product['quantity']),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Favarite',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05, // Dynamic font size
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: screenWidth * 0.05),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  color: Colors.white,
                  elevation: 0,
                  margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                    horizontal: screenWidth * 0.02,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Image
                            Container(
                              height: screenWidth * 0.2, // Dynamic image size
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(product['photoUrl']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            // Product Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'],
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04, // Dynamic font size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    product['height'],
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035, // Dynamic font size
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    'RS.${product['price']}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Quantity Controls
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.02,
                                      ),
                                      child: CircleAvatar(
                                        radius: screenWidth * 0.05,
                                        backgroundColor: Colors.grey.shade300,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            size: screenWidth * 0.04,
                                          ),
                                          onPressed: () {
                                            // Decrease quantity logic
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${product['quantity']}',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.02,
                                      ),
                                      child: CircleAvatar(
                                        radius: screenWidth * 0.05,
                                        backgroundColor: Colors.grey.shade300,
                                        child: Center(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.add,
                                              size: screenWidth * 0.04,
                                            ),
                                            onPressed: () {
                                              // Increase quantity logic
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        // Buttons (Remove and Add to Cart)
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black54,
                                  size: screenWidth * 0.04,
                                ),
                                label: Text(
                                  'Remove',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.black54,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.015,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shop_2_outlined,
                                  color: Colors.black,
                                  size: screenWidth * 0.04,
                                ),
                                label: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.015,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Total and Checkout Section
          Container(
            height: screenHeight * 0.20,
            padding: EdgeInsets.all(screenWidth * 0.05),
            // decoration:  ,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(

                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 238, 177, 3),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    ),
  );
}