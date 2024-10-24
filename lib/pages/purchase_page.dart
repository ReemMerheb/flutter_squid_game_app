import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchasePage extends StatefulWidget {
  final String imagePath;
  final String name1;

  const PurchasePage({super.key, required this.imagePath, required this.name1});

  @override
  PurchasePageState createState() => PurchasePageState();
}

class PurchasePageState extends State<PurchasePage> {
  int _productCount = 1;
  double _rating = 4; // Initialize product count to 1

  void _increment() {
    setState(() {
      _productCount++; // Increment the product count
    });
  }

  void _decrement() {
    if (_productCount > 1) {
      // Ensure the count doesn't go below 1
      setState(() {
        _productCount--; // Decrement the product count
      });
    }
  }

  void _setRating(double rating) {
    setState(() {
      _rating = rating; // Update the rating based on the tapped star
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with pink on left and white on right
          Row(
            children: [
              Expanded(
                flex: 2, // 3/4 of the screen
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 344),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 208, 225), // Pink color
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        // Rounded corner
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2, // Remaining 1/4 of the screen
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // Top-left aligned IconButton
          Positioned(
            top: 30, // 20px from the top
            left: 16, // 16px from the left
            child: IconButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              icon: Icon(Icons.arrow_back, size: 20),
            ),
          ),
          // Centered content, including image
          Padding(
            padding: const EdgeInsets.only(top: 65),
            child: Align(
              alignment: Alignment.center, // Center everything
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.imagePath, // Your image path
                    height: 410, // Image height
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.centerLeft, // Align text to the left
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                      ), // Padding for the text
                      child: Text(
                        widget.name1,
                        style: GoogleFonts.roboto(
                          fontSize: 45, // Font size
                          // Bold font weight
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 299, bottom: 10),
                    child: Text(
                      '\$79.9',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 124, 123, 123),
                      ),
                    ),
                  ),
                  // Space between price and avatars
                  // Increment and Decrement CircleAvatars
                  Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: _decrement,
                          child: CircleAvatar(
                            radius: 25, // Size of the CircleAvatar
                            backgroundColor: Color.fromARGB(255, 255, 208, 225),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 20), // Space between the avatars
                        Text(
                          '$_productCount', // Display the product count
                          style: TextStyle(
                              fontSize: 24, // Font size for the count
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                            width:
                                20), // Space between the count and plus avatar
                        GestureDetector(
                          onTap: _increment,
                          child: CircleAvatar(
                            radius: 25, // Size of the CircleAvatar
                            backgroundColor:
                                const Color.fromARGB(255, 232, 70, 124),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Space between the avatars and rating
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 207), // Adjust padding as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Star rating display
                        Row(
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: () =>
                                  _setRating(index + 1), // Update rating on tap
                              child: Icon(
                                index < _rating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 23,
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                            width: 10), // Space between stars and rating value
                        // Rating value display
                        Text(
                          _rating.toStringAsFixed(
                              1), // Show the rating with one decimal
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 124, 123, 123),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Space between avatars and buttons
                  // Add to Cart and Buy Now buttons
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart,
                              color: Colors.black),
                          label: Text(
                            'Add to cart',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  fontSize: 18, // Set your desired font size
                                  color: const Color.fromARGB(
                                      255, 0, 0, 0), // Set the color to black
                                ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 17),
                            backgroundColor: Color.fromARGB(255, 255, 208, 225),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 232, 70, 124),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size(160, 60),
                            ),
                            child: Text(
                              'Buy now',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 18, // Set your desired font size
                                    color:
                                        Colors.white, // Set the color to white
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
