import 'package:flutter/material.dart';


import 'package:flutter_squid_game/pages/shop_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSquidGame extends StatefulWidget {
  const HomeSquidGame({super.key});

  @override
  State<HomeSquidGame> createState() => _HomeSquidGameState();
}

class _HomeSquidGameState extends State<HomeSquidGame> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Background.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Logo.png',
                    width: 500,
                    height: 100,
                    alignment: Alignment.topCenter,
                  ),
                  SizedBox(height: 350),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Container(
                        width: 350,
                        height: 300,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(133, 140, 137, 137)
                              .withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(172, 148, 147, 147),
                              blurRadius: 10,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Align(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Image.asset(
                                  'assets/Everything.png',
                                  width: 100,
                                  alignment: Alignment.topLeft,
                                ),
                              ),
                              Image.asset(
                                'assets/squidtext.png',
                                width: 500,
                                height: 130,
                                alignment: Alignment.topCenter,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child:DefaultTextStyle(style:TextStyle(
                                  fontSize: 18,
                                  color: Colors.white), child: 
                                 Column(
                                  children: [
                                    Text(
                                      'Shop your favourite toys and outfits',
                                        style: Theme.of(context).textTheme.bodyLarge
                                     
                                      ),
                                    
                                    Text(
                                      'of the squid game on the go!',
                                      textAlign: TextAlign.center,
                                       style: Theme.of(context).textTheme.bodyLarge
                                     
                                     
                                      ),
                                    
                                    SizedBox(height: 10),
                                  ],
                                )),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 206, 72, 117),
                                  minimumSize: Size(300, 30),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 80, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShopPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Shop Now',
                                  
                                  style: GoogleFonts.lato(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
