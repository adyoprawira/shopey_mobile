# Assignment 7
## Explain what are stateless widgets and stateful widgets, and explain the difference between them.
In Flutter, stateless widgets are widgets that display static content and do not change over time. They rely only on the data provided when they’re created. They are efficient because they don't update after being built, ideal for UI elements like text or icons. On the other hand, stateful widgets are used for dynamic content that needs to change in response to user interaction or data updates. These widgets maintain a separate State object where mutable data is stored, allowing them to rebuild themselves when this state changes.
## Mention the widgets that you have used for this project and its uses.
  1. Scaffold: Provides the main layout structure, including the AppBar and the body content area for the app.
  2. AppBar: Displays the application title, "Shopey," at the top of the screen with custom styling.
  3. Padding: Adds consistent spacing around widgets for improved layout and readability.
  4. Column: Arranges child widgets vertically, helping organize content within the app's main body.
  5. Row: Aligns multiple InfoCard widgets horizontally to display user information side by side.
  6. InfoCard: A custom StatelessWidget that uses Card and Container to display static details like NPM, Name, and Class with styling.
  7. Card: Provides a container with a slight shadow to highlight the content and give depth to the UI elements.
  8. Container: Wraps content within InfoCard to control size, padding, and alignment.
  9. GridView.count: Arranges ItemCard widgets in a 3-column grid for a structured, consistent layout.
  10. ItemCard: A custom widget that displays each action (e.g., "View Product," "Add Product," "Logout") as an icon and label.
  11. Material: Used within ItemCard to apply background colors, enhancing visual appeal.
  12. InkWell: Wraps the content in ItemCard to add click/tap functionality, showing visual feedback when tapped.
  13. Icon: Displays a symbol for each action (e.g., product, add, logout) within ItemCard for easy identification.
  14. Text: Displays static text for titles, user information, and action labels with specified styles.
## What is the use-case for setState()? Explain the variable that can be affected by setState().
The ```setState()``` method in Flutter’s stateful widgets is crucial for updating the UI in response to changes in the widget’s data or appearance. When ```setState()``` is called, it triggers a rebuild of the widget tree below the current widget, updating values that reflects in the interface. This is useful for variables that hold dynamic values.
##  Explain the difference between const and final keyword.
When a variable is declared with the ```const``` keyword, it indicates that the value is a compile-time constant. This means that the value must be known at compile time, and the variable cannot change afterward.  In contrast, a variable declared with the ```final``` keyword can only be assigned once, but its value can be determined at runtime.
## Explain how you implemented the checklist above step-by-step.
  1. Create a new Flutter app on a new directory using the ``` flutter create shopey_mobile``` command.
  2. Creating three simple buttons on the homepage by adding:
     ```dart
       final List<ItemHomepage> items = [
          ItemHomepage("View Product", Icons.store, Colors.blue),
          ItemHomepage("Add Product", Icons.add, Colors.green),
          ItemHomepage("Logout", Icons.logout, Colors.red),
        ];
     ```
  3. Create a new class for the new buttons that was previously added:
     ```dart
     class ItemHomepage {
        final String name;
        final IconData icon;
        final Color color;
    
        ItemHomepage(this.name, this.icon, this.color);
      }
      ```
  4. Create a new class ```ItemCard``` to handle views and styling of those buttons:
     ```dart
     class ItemCard extends StatelessWidget {
        final ItemHomepage item; 
        
        const ItemCard(this.item, {super.key}); 
      
        @override
        Widget build(BuildContext context) {
          return Material(
            color: item.color,
            borderRadius: BorderRadius.circular(12),
            
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text("You have pressed the ${item.name} button!"))
                  );
              },
              ...
      ```
  5. Implement different colors for each buttons
  6. Change colors explicitly for every button
     ```dart
     final List<ItemHomepage> items = [
        ItemHomepage("View Product", Icons.store, Colors.blue),
        ItemHomepage("Add Product", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
      ];
     ```
7. Implement those colors accordingly
   ```dart
   @override
    Widget build(BuildContext context) {
      return Material(
        color: item.color, // Set the background color of the card.
        borderRadius: BorderRadius.circular(12),
    ...
   ```
8. Display a snackbar, when a button is clicked it shows a message according to the button pressed.
   ```dart
   child: InkWell(
        onTap: () {
          // Show a snackbar when the card is tapped.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!"))
            );
        },
   ```

# Assignment 8
##  What is the purpose of ```const``` in Flutter? Explain the advantages of using ```const``` in Flutter code. When should we use ```const```, and when should it not be used?
The ```const``` keyword in Flutter marks an object as immutable and compile-time constant. When an object is declared with ```const```, it’s created once, stored in memory, and reused whenever that constant value is needed.  We should use ```const``` on datas that don't depend on states, datas that are immutable datas,etc. We shouldn't use ```const``` on datas that depend on states, dynamic datas/contents, etc.

## Explain and compare the usage of Column and Row in Flutter. Provide example implementations of each layout widget!
 `Column` and `Row` are two styles of layout widgets in Flutter than allow to arrange the widgets vertically by using `Column` or horizontally by using `Row`.

`Column` arranges the widget vertically. The example is on 'productentry_form.dart'
     
      ```dart
      ...
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title"),
          TextFormField(),
          SizedBox(height: 10),
          Text("Description"),
          TextFormField(),
        ],
      )
      ```

  `Row` arranges the widget horizontally. The example is on 'main.dart'

        ```dart
        ...
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             InfoCard(title: 'NPM', content: npm),
             InfoCard(title: 'Name', content: name),
             InfoCard(title: 'Class', content: className),
           ],
         )
        ```

   Comparison of `Column` and `Row` is on the allignment options, they both provide alignment properties like `mainAxisAlignment` (allign along the main axis) and `crossAxisAlignment` (aligning across or perpendicular to axis).

## List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? Explain!
Input elements used in `productentry_form.dart` is **TextFormField**, for name,price,description, etc. Here its features are validation, hint for the text, and label for the text. Its use is to provide various customization options and input types for the user to interact.
   Other Flutter input elements not used are checkboxes, radios, dropdowns.

   Example of an unused input element:

      ```dart
      Checkbox(
        value: isSelected,
        onChanged: (bool? newValue) {
          setState(() {
            isSelected = newValue!;
          });
        },
      )
      ```

## How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?
   We set the theme by setting a global theme to ensure its consistency. I implemented it on `main.dart` with the main primary and secondary color to be blue.

      ```dart
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            primary: const Color.fromARGB(255, 0, 229, 255),
            secondary: const Color.fromARGB(255, 0, 229, 255),
          ),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      );
      ```

##  How do you manage navigation in a multi-page Flutter application?
   Flutter handles navigation by using the `Navigator` class, here we used `Navigator.push`, `Navigator.pushReplacement`, and `Navigator.pop`. I have used these navigations on my Flutter project as follows. On `product_card.dart` I used both `Navigator.push` and `Navigator.pushReplacement`, in this case, `Navigator.push` adds a new page on top of the current stack allowing users to navigate back to the previous page. Meanwhile, `Navigator.pushReplacement replaces the current page with a new one, removing the previous page from the navigation stack.

      ```dart
      // Navigator.push example
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductEntryFormPage()),
      );

      // Navigator.pushReplacement example
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
      ```


   
