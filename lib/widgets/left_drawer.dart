import 'package:flutter/material.dart';
import 'package:shopey_mobile/screens/menu.dart';
import 'package:shopey_mobile/screens/productentry_form.dart';
import 'package:shopey_mobile/screens/list_productentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      const DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 229, 255),
          ),
          child: Column(children: [
            Text('Shopey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            Padding(padding: EdgeInsets.all(8)),
            Text("Your one stop shop",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ))
          ])),
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home Page'),
        // Redirection part to MyHomePage
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.store),
        title: const Text('Add Product'),
        // Redirection part to ProductEntryFormPage
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.add_shopping_cart),
        title: const Text('Product List'),
        onTap: () {
          // Route to the mood page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductEntryPage()),
          );
        },
      ),
    ]));
  }
}
