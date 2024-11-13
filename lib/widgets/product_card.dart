import 'package:flutter/material.dart';
import 'package:shopey_mobile/screens/productentry_form.dart';

class ItemHomepage {
  final String name; // Item name.
  final IconData icon; // Item icon.
  final Color color; // Item color.

  ItemHomepage(this.name, this.icon, this.color);
}

// Card widget to display an item.
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Set the background color of the card.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        onTap: () {
          // Show a snackbar when the card is tapped.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You have pressed the ${item.name} button!")));

          if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.black, // Set icon color to black.
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black), // Set text color to black.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}