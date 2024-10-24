import 'package:flutter/material.dart';
import 'package:flutter_squid_game/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 16, // Set font size to 19
              fontWeight: FontWeight.bold, // Set font weight to bold
              color: Color.fromARGB(255, 230, 220, 220), // Set text color
            ),
            bodyMedium: TextStyle(
              fontSize: 16, // You can use the same or different styles
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 230, 220, 220),
            ),
            // Add other styles as needed
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeSquidGame(),
    );}}
