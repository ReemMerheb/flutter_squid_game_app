import 'package:flutter/material.dart';
import 'package:flutter_squid_game/pages/favorite_page.dart';
import 'package:flutter_squid_game/pages/purchase_page.dart';
import 'package:flutter_squid_game/pages/setting_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedIndex = 0;
  List<Map<String, String>> favoriteItems = [];

  // Function to handle tapping on a tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      // Navigate to FavoriteScreen when the "Favourite" tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoriteScreen(favoriteItems: favoriteItems),
        ),
      );
    } else if (index == 3) {
      // Navigate to FavoriteScreen when the "Favourite" tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ),
      );
    }
  }

  bool isFavorite(String name) {
    return favoriteItems.any((item) => item['name'] == name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 254, 254),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 12),
              Image.asset(
                'assets/Logoapp.png',
                height: 80,
                width: 100,
              ),
              SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 15),
                      constraints: BoxConstraints(maxHeight: 44),
                      filled: true,
                      fillColor: const Color.fromARGB(128, 217, 212, 212),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 38,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 7),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 39,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 36, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended for you',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 376,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  toy(
                    context,
                    'Supervisor toy',
                    'assets/Stafftoy.png',
                  ),
                  toy(
                    context,
                    'Front man toy',
                    'assets/blackmaster.png',
                  ),
                ],
              ),
            ),
            SizedBox(height: 22),
            Text(
              'Recent orders',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  items(
                    'Collector outfit',
                    '3 items ordered',
                    'assets/Staff2.png',
                    context,
                    'View details',
                  ),
                  items(
                    'Doll',
                    '1 item ordered',
                    'assets/doll.png',
                    context,
                    'View details',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.grey, size: 29),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.shopping_bag_outlined, color: Colors.grey, size: 29),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, color: Colors.grey, size: 29),
            label: 'Favourite',
            backgroundColor: Color.fromARGB(255, 254, 254, 254),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, color: Colors.grey, size: 29),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget toy(
    BuildContext context,
    String name,
    String imagePath,
  ) {
    return GestureDetector(
      onTap: () {
        // Optional: Add logic when the toy image is tapped
      },
      child: Container(
        width: 215,
        height: 354,
        margin: const EdgeInsets.only(right: 16, top: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -30,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                imagePath,
                height: 135,
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  isFavorite(name) ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite(name)
                      ? Colors.red
                      : const Color.fromARGB(255, 200, 22, 141),
                ),
                onPressed: () {
                  setState(() {
                    if (isFavorite(name)) {
                      // Remove from favorites
                      favoriteItems.removeWhere((item) => item['name'] == name);
                    } else {
                      // Add to favorites
                      favoriteItems.add({'name': name, 'imagePath': imagePath});
                    }
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isFavorite(name)
                            ? '$name added to favorites!'
                            : '$name removed from favorites!',
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 230),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 12),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.star, color: Colors.amber, size: 24),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PurchasePage(imagePath: imagePath, name1: name),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 232, 70, 124),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(65, 50),
                ),
                child: Text(
                  'View details',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget items(
    String name1,
    String orderDetails,
    String imagePath1,
    BuildContext context,
    String detail,
  ) {
    return Container(
      width: 215,
      height: 110,
      margin: const EdgeInsets.only(right: 16, top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 29, left: 93),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 4, 4, 4),
                          ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      orderDetails,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 10,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          detail,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 116, 112, 112),
                              ),
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: -30,
            left: 0,
            bottom: 0,
            child: Image.asset(
              imagePath1,
              height: 290,
              width: 90,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
