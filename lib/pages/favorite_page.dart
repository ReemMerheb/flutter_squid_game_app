import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatelessWidget {
    final List<Map<String, String>> favoriteItems;

  const FavoriteScreen({Key? key, required this.favoriteItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' My Favorites',style: GoogleFonts.roboto(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(favoriteItems[index]['imagePath']!),
            title: Text(favoriteItems[index]['name']!),
          );
        },
      ),
    );
  }
}