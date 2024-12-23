import 'package:flutter/material.dart';
import 'package:shopey_mobile/widgets/left_drawer.dart';
import 'package:shopey_mobile/widgets/product_card.dart';

// Main page of the application.
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // User information
  final String npm = '2306173750'; // NPM
  final String name = 'Adyo Arkan Prawira'; // Name
  final String className = 'KKI'; // Class

  // List of items to be displayed on the homepage.
  final List<ItemHomepage> items = [
    ItemHomepage("View Product", Icons.store, Colors.blue),
    ItemHomepage("Add Product", Icons.add, Colors.green),
    ItemHomepage("Logout", Icons.logout, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure of the page with the AppBar and body.
    return Scaffold(
      // AppBar is the top part of the page that displays the title.
      appBar: AppBar(
        // The title of the application "Shopey" with black text and bold font.
        title: const Text(
          'Shopey',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // The background color of the AppBar is a custom color.
        backgroundColor: const Color.fromARGB(255, 0, 229, 255),
      ),
      // Add drawer as a parameter value for the drawer attribute of the Scaffold widget
      drawer: const LeftDrawer(),
      // Body of the page with paddings around it.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Place the widget vertically in a column.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row to display 3 InfoCard horizontally.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Give a vertical space of 16 units.
            const SizedBox(height: 16.0),

            // Place the following widget in the center of the page.
            Center(
              child: Column(
                // Place the text and grid item vertically.
                children: [
                  // Display the welcome message with bold font and size 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Shopey',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid to display ItemCard in a 3 column grid.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // To ensure that the grid fits its height.
                    shrinkWrap: true,

                    // Display ItemCard for each item in the items list.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Card information that displays the title and content.
class InfoCard extends StatelessWidget {
  final String title; // Card title.
  final String content; // Card content.
  final Color cardColor; // Card color.
  final Color textColor; // Text color.

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
    this.cardColor = const Color.fromARGB(255, 0, 229, 255),
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: cardColor, // Set the card's background color
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor, // Set text color for title
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyle(
                color: textColor, // Set text color for content
              ),
            ),
          ],
        ),
      ),
    );
  }
}
