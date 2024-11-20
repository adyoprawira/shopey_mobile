import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:shopey_mobile/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Shopey',
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
          home: const LoginPage(),
        ));
  }
}
